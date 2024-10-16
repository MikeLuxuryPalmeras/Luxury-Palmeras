// server.js
import express from "express";
import fetch from "node-fetch";
import cors from "cors"; // Import CORS middleware

const app = express();
const PORT = 4000;

// Enable CORS for all routes
app.use(cors());

// Proxy endpoint
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

app.listen(PORT, () => console.log(`Proxy server running on http://localhost:${PORT}`));
