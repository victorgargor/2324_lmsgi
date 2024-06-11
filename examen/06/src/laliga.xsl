<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">

    <xsl:import href="../lib/plantillahtml.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="/data">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'Examen 06 Victor Garcia Gordon'"/>    
                </xsl:call-template>
            </head>
            <body>
                <header id="inicio">
                    <img src="images/liga/89.png" title="logo" alt="logo"/>
                    <h1>LA LIGA</h1> 
                    <nav>
                        <ul>
                            <xsl:apply-templates select="equipos/equipo"/>
                        </ul>
                    </nav>          
                </header>
                <main>            
                    <xsl:apply-templates select="equipos"/>                   
                </main>
                <footer>
                    <div>
                        &#169;2024 <a href="#inicio">Víctor García.</a> Todos los derechos reservados
                    </div>                  
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="equipos/equipo">
        <xsl:for-each select=".">
            <a href="{concat('#',lower-case(nombrecorto))}"><xsl:value-of select="nombrecorto"/></a>    
        </xsl:for-each>    
    </xsl:template>

    <xsl:template match="equipos">
        <xsl:for-each select="equipo">
            <article id="{lower-case(nombrecorto)}">
            <header>
                <h2>Información del club</h2>
            </header>
            <div>
                <img src="{concat('images/club/',@id,'.png')}" title="{nombre}" alt="{nombre}"/>
                <p><b>Manager:</b> <xsl:value-of select="manager"/></p>
                <p><b>Nombre corto:</b> <xsl:value-of select="nombrecorto"/></p>
                <p><b>Nombre:</b> <xsl:value-of select="nombre"/></p>
                <p><b>Apodo:</b> <xsl:value-of select="apodo"/></p>
                <p><b>Estadio:</b> </p>
            </div> 
            <div>
                <h3>Plantilla de jugadores</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Edad</th>
                            <th>Nacionalidad</th>
                            <th>Posición</th>
                            <th>Número</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="jugadores/jugador">
                        <tr>
                            <td><xsl:value-of select="nombre"/></td>
                            <td><xsl:value-of select="year-from-date(current-date()) - year-from-date(fechaNacimiento)"/></td>
                            <td><img src="{concat('images/paises/',substring(lower-case(nacionalidad),1,3),'.png')}" title="{nacionalidad}" alt="{nacionalidad}"/></td>
                            <td><xsl:value-of select="posicion"/></td>
                            <td><xsl:value-of select="numeroCamiseta"/></td>
                        </tr>    
                        </xsl:for-each>  
                    </tbody>
                    <tfoot>
                        <td>Año 1999: </td>
                        <td>España: </td>
                        <td>Otras: </td>
                    </tfoot>          
                </table>        
            </div>
        </article>       
        </xsl:for-each>     
    </xsl:template>
</xsl:stylesheet>