<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    
    <xsl:template match="/listatickets">
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>               
                <xsl:call-template name="escribirDoctype"/>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo">02 XSLT Victor Garcia Gordon</xsl:with-param>
                </xsl:call-template>            
            </head>
            <body>
                <header>
                    <h1>Información de tickets</h1>
                </header>
                <main>
                    <h2>Listado de tickets</h2>
                    <xsl:apply-templates select="ticket">
                        <xsl:sort select="numero" data-type="number" order="ascending"/>
                    </xsl:apply-templates>
                </main>
                <footer>
                    <div>Número de tickets:<xsl:value-of select="count(//ticket)"/></div>
                    <div>Total de tickets:<xsl:value-of select="sum(ticket/total)"/></div>
                </footer>
            </body>          
        </html>
    </xsl:template>
    
    <xsl:template match="ticket">
        <article>
            <h3><xsl:value-of select="concat('Tickets: ',numero)"/></h3>
            <table>
                <caption><xsl:value-of select="concat('Fecha Ticket: ',fecha)"/></caption>     
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
                <xsl:apply-templates select="producto"/>
                <tfoot>
                    <tr>
                        <th>Total:</th>
                        <td> 
                            <xsl:value-of select="total"/>
                        </td>  
                    </tr>
                </tfoot>
            </table>
        </article>
    </xsl:template>
    
    <xsl:template match="producto">             
        <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="precio"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:comment><xsl:value-of select="current()"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:comment>
    </xsl:template>
</xsl:stylesheet>

