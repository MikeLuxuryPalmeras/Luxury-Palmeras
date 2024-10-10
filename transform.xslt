<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output as HTML -->
    <xsl:output method="html" doctype-public="XSLT-compat" encoding="UTF-8" indent="yes"/>
    
    <!-- Import CSS -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Property Listing</title>
                <link rel="stylesheet" type="text/css" href="style.css" />
            </head>
            <body>
                <div id="container-head">
                    <h1>Property Listings</h1>
                    <div id="property-list">
                        <xsl:apply-templates select="//property"/>
                    </div>
                </div>
                <footer>
                    <p>Property listings provided by Real Estate</p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each property -->
    <xsl:template match="property">
        <div class="property">
            <h2><xsl:value-of select="type"/> in <xsl:value-of select="town"/>, <xsl:value-of select="province"/></h2>
            <p><strong>Reference:</strong> <xsl:value-of select="ref"/></p>
            <p><strong>Price:</strong> <xsl:value-of select="price"/> <xsl:value-of select="currency"/></p>
            <p><strong>Beds:</strong> <xsl:value-of select="beds"/> | <strong>Baths:</strong> <xsl:value-of select="baths"/> | <strong>Pool:</strong> <xsl:value-of select="pool"/></p>
            <p><strong>Surface Area:</strong> <xsl:value-of select="surface_area/built"/> m² built, <xsl:value-of select="surface_area/plot"/> m² plot</p>
            <div class="desc">
                <h3>Description:</h3>
                <xsl:value-of select="desc/en" disable-output-escaping="yes"/>
            </div>
            <h4>Features:</h4>
            <ul id="list">
                <xsl:for-each select="features/feature">
                    <li><xsl:value-of select="."/></li>
                </xsl:for-each>
            </ul>
            <h4>Images:</h4>
            <div id="photo-overview">
                <xsl:for-each select="images/image">
                    <img class="img-fluid" src="{url}" alt="Property Image" id="hoverimg"/>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
