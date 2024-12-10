// server.js
import express from "express";
import fetch from "node-fetch";
import path from "path";
import { fileURLToPath } from "url";
import cors from "cors";
import NodeCache from "node-cache"; // Import NodeCache
import http from 'http';
import fs from 'fs';
// import { DOMParser } from 'xmldom';

import { XMLParser } from 'fast-xml-parser';
const options = {
    ignoreAttributes: false, // Keep attributes in the parsed JSON
    attributeNamePrefix: "@_", // Prefix for attributes
    allowBooleanAttributes: true, // Handle boolean attributes
    textNodeName: "#text", // Name for text nodes
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
const jsonFilePath = path.join('/tmp', 'data.json');

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
      const json = parser.parse(xml);

      // Save JSON to file
      const jsonFilePath = "data.json";
      fs.writeFileSync(jsonFilePath, JSON.stringify(json, null, 2));
      console.log(`JSON saved to ${jsonFilePath}`);

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

// function xmlToJson(xml) {
//   // Helper function to process a single node
//   function processNode(node) {
//       let obj = {};

//       // Process attributes
//       if (node.attributes && node.attributes.length > 0) {
//           obj["@attributes"] = {};
//           for (let i = 0; i < node.attributes.length; i++) {
//               const attr = node.attributes[i];
//               obj["@attributes"][attr.nodeName] = attr.nodeValue;
//           }
//       }

//       // Process child nodes
//       const childNodes = Array.from(node.childNodes).filter(
//           (child) => child.nodeType === 1 || (child.nodeType === 3 && child.nodeValue.trim() !== "")
//       );

//       if (childNodes.length > 0) {
//           for (let child of childNodes) {
//               if (child.nodeType === 1) { // Element node
//                   const nodeName = child.nodeName;

//                   // Special handling for `images` node
//                   if (nodeName === "image" && node.nodeName === "images") {
//                       if (!obj[nodeName]) {
//                           obj[nodeName] = [];
//                       }
//                       obj[nodeName].push(processNode(child));
//                   } else {
//                       // Handle regular nodes
//                       if (!obj[nodeName]) {
//                           obj[nodeName] = processNode(child);
//                       } else {
//                           if (!Array.isArray(obj[nodeName])) {
//                               obj[nodeName] = [obj[nodeName]];
//                           }
//                           obj[nodeName].push(processNode(child));
//                       }
//                   }
//               } else if (child.nodeType === 3) { // Text node
//                   const text = child.nodeValue.trim();
//                   if (text) {
//                       obj = text;
//                   }
//               }
//           }
//       } else if (node.textContent.trim()) {
//           // If no child nodes, return text content
//           obj = node.textContent.trim();
//       }

//       return obj;
//   }

//   // Start processing the root element
//   return processNode(xml.documentElement);
// }

// Function to fetch and save JSON on server start

async function createJsonFile() {
  try {
      const response = await fetch(XML_API_URL);
      if (!response.ok) throw new Error(`Failed to fetch XML: ${response.statusText}`);
      const xml = await response.text();

      // Parse the XML to JSON
      const parser = new XMLParser(options);
      const json = parser.parse(xml);

      fs.writeFileSync(jsonFilePath, JSON.stringify(json, null, 2));
      console.log(`JSON saved to ${jsonFilePath}`);
  } catch (error) {
      console.error(`Error creating JSON file: ${error.message}`);
  }
}