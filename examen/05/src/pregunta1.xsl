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

    <xsl:template match="/">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'Examen 05 Victor Garcia Gordon'"/>    
                </xsl:call-template>
            </head>
            <body>
                <header>
                    <nav>
                        <xsl:apply-templates select="datos"/>
                    </nav>
                </header>
                <main>
                    <xsl:apply-templates select="datos/proveedores"/>
                    <xsl:apply-templates select="datos/productos"/>
                    <xsl:apply-templates select="datos/proyectos"/>
                    <xsl:apply-templates select="datos/suministros"/>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="datos">           
        <a href="#proveedores">Proveedor</a>
        <a href="#productos">Productos</a>
        <a href="#proveedores">Proyectos</a>
        <a href="#suministros">Suministros</a>
        <a href="#estadisticas">Estadística</a>  
    </xsl:template>

    <xsl:template match="datos/proveedores">
        <article id="proveedores">
            <h2>Proveedores</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nombre(Num Proveedor)</th>
                        <th>Estado</th>
                        <th>Ciudad</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="proveedor">
                    <tr>
                        <td><xsl:value-of select="concat(nombreprov,'(',@numprov,')')"/></td>
                        <td><xsl:value-of select="estado"/></td>
                        <td><xsl:value-of select="ciudad"/></td>
                    </tr>    
                    </xsl:for-each>  
                </tbody>          
            </table>         
        </article>    
    </xsl:template>

    <xsl:template match="datos/productos">
        <article id="productos">
            <h2>Productos</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nombre(Num Producto)</th>
                        <th>Color</th>
                        <th>Peso</th>
                        <th>Ciudad</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="producto">
                    <tr>
                        <td><xsl:value-of select="concat(nombreproducto,'(',@numproducto,')')"/></td>
                        <td><xsl:value-of select="color"/></td>
                        <td><xsl:value-of select="peso"/></td>
                        <td><xsl:value-of select="ciudad"/></td>
                    </tr>    
                    </xsl:for-each>  
                </tbody>          
            </table>         
        </article>    
    </xsl:template>

    <xsl:template match="datos/proyectos">
        <article id="proyectos">
            <h2>Proyectos</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nombre(Num Proyecto)</th>
                        <th>Ciudad</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="proyecto">
                    <tr>
                        <td><xsl:value-of select="concat(nombreproyecto,'(',@numproyecto,')')"/></td>
                        <td><xsl:value-of select="ciudad"/></td>
                    </tr>    
                    </xsl:for-each>  
                </tbody>          
            </table>         
        </article>    
    </xsl:template>

    <xsl:template match="datos/suministros">
        <article id="suministros">
            <h2>Suministra</h2>
            <table>
                <thead>
                    <tr>
                        <th>Proveedor(Num Prov)</th>
                        <th>Producto(Num Prod)</th>
                        <th>Proyecto(Num Proy)</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="suministra">
                    <tr>
                        <td><xsl:value-of select="@numprov"/></td>
                        <td><xsl:value-of select="@numproducto"/></td>
                        <td><xsl:value-of select="@numproyecto"/></td>
                        <td><xsl:value-of select="cantidad"/></td>
                    </tr>    
                    </xsl:for-each>  
                </tbody>
                <tfooter>
                </tfooter>      
            </table>         
        </article>    
    </xsl:template>
</xsl:stylesheet>