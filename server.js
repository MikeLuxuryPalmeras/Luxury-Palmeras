// server.js
import express from "express";
import fetch from "node-fetch";
import NodeCache from "node-cache";
import path from 'path';
import { fileURLToPath } from 'url';
import cors from "cors"; // Import CORS middleware

const app = express();
const cache = new NodeCache({ stdTTL: 300 }); // Cache for 5 minutes

// Use `fileURLToPath` to get __dirname in ES Modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Enable CORS for all routes
app.use(cors());

// Handle any API routes or dynamic functionality here
app.get('/api', (req, res) => {
  res.json({ message: "Hello from the backend!" });
});

// Proxy endpoint

// app.get("/proxy-xml", async (req, res) => {
//     const cachedXML = cache.get("xmlData");

//     if (cachedXML) {
//         res.set("Content-Type", "application/xml");
//         return res.send(cachedXML);
//     }

//     try {
//         const response = await fetch("https://gaudi-estate.com/thinkspain.xml");
//         if (!response.ok) throw new Error(`Error fetching XML: ${response.statusText}`);
//         const xml = await response.text();
//         cache.set("xmlData", xml); // Cache the XML data
//         res.set("Content-Type", "application/xml");
//         res.send(xml);
//     } catch (error) {
//         console.error(error);
//         res.status(500).send("Error fetching XML data");
//     }
// });

app.get("/proxy-xml", async (req, res) => {
    try {
        const response = await fetch("https://gaudi-estate.com/thinkspain.xml");
        if (!response.ok) throw new Error(`Error fetching XML: ${response.statusText}`);
        const xml = await response.text();
        res.set("Content-Type", "application/xml");
        res.send(xml);
    } catch (error) {
        console.error(error);
        res.status(500).send("Error fetching XML data");
    }
});


// Default route to serve your homepage or fallback
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Start the server on the environment port or 3000
const PORT = process.env.PORT || 4000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));