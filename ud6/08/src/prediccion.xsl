<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="/prediccion">
        <html>
            <head>
                <title>Víctor García Gordón</title>
                <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
            </head>
            <body>
                <header>
                    <h1>Predicción por municipios</h1>
                </header>
                <main>
                    <table>
                        <caption>EL TIEMPO.<xsl:value-of select="municipio/nombre/text()"/>(<xsl:value-of select="municipio/provincia/text()"/>)</caption>
                        <thead>
                            <th>Día</th>
                            <th>Prob. precip.</th>
                            <th>Estado del cielo</th>
                            <th>Temperatura (ºC)</th>
                            <th>Viento (km/h)</th>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="dia"/>
                        </tbody>
                    </table>
                </main>
            </body>
        </html>                  
    </xsl:template>

    <xsl:template match="dia">
        <tr>
            <td><xsl:value-of select="substring(@fecha, 9, 2)"/></td>
            <td><xsl:value-of select="prob_precipitacion"/>%</td>
            <td><img src="{concat('images/',estado_cielo,'.gif')}" title="{estado_cielo/@descripcion}" alt="{estado_cielo/@descripcion}"/></td>
            <td>
                <span class="minima"><xsl:value-of select="temperatura/minima"/></span> / 
                <span class="maxima"><xsl:value-of select="temperatura/maxima"/></span>
            </td>
            <td>
                <img src="{concat('images/',viento/direccion,'.gif')}" title="{viento/direccion}" alt="{viento/direccion}"/>
                <xsl:value-of select="viento/velocidad"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>