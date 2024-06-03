<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:import href="../../lib/plantillahtml.xsl"/>

    <xsl:template match="/edificio">
        <html>
            <head>
                <xsl:call-template name="escribirDoctype"/>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo">01 XSLT Victor Garcia Gordon</xsl:with-param>
                </xsl:call-template>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <main>
                    <xsl:apply-templates select="vivienda"/> 
                </main>
                <footer>
                    <p>Número de viviendas:<xsl:value-of select="count(//vivienda)"/></p>
                    <p>Número de vecinos:<xsl:value-of select="count(//nombre)"/></p>
                </footer>     
            </body>
        </html>
    </xsl:template>
    <xsl:template match="vivienda">
        <p>Piso:<xsl:value-of select="piso"/>  Puerta:<xsl:value-of select="puerta"/></p>
        <ol>
            <xsl:apply-templates select="vecinos/nombre"/> 
        </ol>
        
    </xsl:template>
    <xsl:template match="vecinos/nombre">
        <li>
            <xsl:value-of select="text()"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
