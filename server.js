// server.js
import express from "express";
import fetch from "node-fetch";
import path from "path";
import { fileURLToPath } from "url";
import cors from "cors";
import NodeCache from "node-cache"; // Import NodeCache
import http from 'http';
import fs from 'fs';
import os from "os";
import { XMLParser } from 'fast-xml-parser';
const options = {
    ignoreAttributes: false, // Keep attributes in the parsed JSON
    attributeNamePrefix: "@_", // Prefix for attributes
    allowBooleanAttributes: true, // Handle boolean attributes
    textNodeName: "#text", // Name for text nodes
    ignoreDeclaration: true,
};

// Setup
const app = express();
const cache = new NodeCache({ stdTTL: 300 }); // Cache for 5 minutes (300 seconds)
const XML_API_URL = process.env.XML_API_URL || "https://gaudi-estate.com/thinkspain.xml";

// Use `fileURLToPath` to get __dirname in ES Modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const PORT = process.env.PORT || 4000; // Use Heroku's port or default to 4000
//const jsonFilePath = path.resolve('data.json'); // Absolute path to the data.json file
const jsonFilePath = path.join(os.tmpdir(), "data.json"); // Save to a cross-platform temp directory

// Middleware

app.use(cors()); // Enable CORS for all routes
app.use(express.static(path.join(__dirname, "public"))); // Serve static files from the "public" directory

// Default route to serve your homepage or fallback
app.get("*", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
  });

// Handle any API routes or dynamic functionality here
app.get("/api", (req, res) => {
  res.json({ message: "Hello from the backend!" });
});

app.get('/data.json', (req, res) => {
    fs.readFile(jsonFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error(`Error reading file: ${err.message}`);
            return res.status(404).send('File not found');
        }
        res.setHeader('Content-Type', 'application/json');
        res.send(data);
    });
});

// Proxy endpoint with caching
app.get("/proxy-xml", async (req, res) => {
  try {
      // Check if XML data is cached
      const cachedXML = cache.get("xmlData");
      if (cachedXML) {
          console.log("Serving cached XML data");
          return res.send({ message: "JSON already created from cached XML." });
      }

      // Fetch XML data if not cached
      const response = await fetch(XML_API_URL);
      if (!response.ok) throw new Error(`Error fetching XML: ${response.statusText}`);
      const xml = await response.text();

      // Parse the XML to JSON
      const parser = new XMLParser(options);
      const parsedJson = parser.parse(xml);
      const json = parsedJson?.root || parsedJson;

      // Write the flattened JSON to the specified file
      fs.writeFileSync(jsonFilePath, JSON.stringify(json, null, 2));
      console.log(`JSON file created at ${jsonFilePath}`);
    
      // Store XML data in cache
      cache.set("xmlData", xml);

      // Send success response
      res.send({ message: "JSON successfully created from XML." });
  } catch (error) {
      console.error(error);
      res.status(500).send("Error processing XML data");
  }
});

// Start the server and trigger JSON creation
app.listen(PORT, async () => {
    console.log(`Server is running on port ${PORT}`);
    await createJsonFile(); // Automatically fetch XML and create JSON
});


async function createJsonFile() {
  try {
      const response = await fetch(XML_API_URL);
      if (!response.ok) throw new Error(`Failed to fetch XML: ${response.statusText}`);
      const xml = await response.text();

      // Parse the XML to JSON
      const parser = new XMLParser(options);
      const parsedJson = parser.parse(xml);
      // Remove wrapping objects, keeping only the contents of "root"
      const json = parsedJson?.root || parsedJson;
      
      // Write the flattened JSON to the specified file
      fs.writeFileSync(jsonFilePath, JSON.stringify(json, null, 2));
      console.log(`JSON file created at ${jsonFilePath}`);
  } catch (error) {
      console.error(`Error creating JSON file: ${error.message}`);
  }
}