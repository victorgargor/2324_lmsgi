<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>
    
    <xsl:template match="factura">
        <html lang="es">
            <head>
                <xsl:call-template name="escribirDoctype"/>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'04 XSLT Victor Garcia Gordon'"/>
                </xsl:call-template>
            </head>
            <body>
                <main>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="4" scope="col" class="titulo">FACTURA NÚMERO <xsl:value-of select="@n_factura"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="datos_emisor"/>
                            <xsl:apply-templates select="datos_receptor"/>
                            <xsl:apply-templates select="datos_factura"/>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4">
                                    <span class="negrita" style="color:red">IMPORTES FACTURA: </span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><span class="negrita">Base: </span><xsl:value-of select="sum(datos_factura/linea/importe)"/></td>
                                <td><span class="negrita">Cuota IVA: </span><xsl:value-of select="sum(datos_factura/linea/importe)*(datos_factura/@iva div 100)"/></td>
                                <td><span class="negrita">Total Factura: </span><xsl:value-of select="sum(datos_factura/linea/importe)*(1+(datos_factura/@iva div 100))"/></td>
                            </tr>
                        </tfoot>
                    </table>
                </main>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="datos_emisor">
        <tr>
            <td colspan="4">
                <span class="negrita" style="color:red">DATOS EMISOR: </span>
            </td>
        </tr>
        <tr>
            <td colspan="2"><span class="negrita">Razón social: </span><xsl:value-of select="nombre"/></td>
            <td colspan="2"><span class="negrita">CIF/NIF: </span><xsl:value-of select="cif"/></td>
        </tr>
        <tr>
            <td colspan="2"><span class="negrita">Direccion: </span></td>
            <td colspan="2">
                <xsl:value-of select="poblacion/@cod_postal"/>
                <br/>
                <xsl:value-of select="poblacion/text()"/>
                <br/>
                <xsl:value-of select="provincia"/>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <span class="negrita">DATOS DE CONTACTO: </span>
            </td>
        </tr>
        <tr>
            <td colspan="2"><span class="negrita">Telefono: </span><xsl:value-of select="nombre"/></td>
            <td colspan="2"><span class="negrita">FAX: </span><xsl:value-of select="cif"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="datos_receptor">
        <tr>
            <td colspan="4">
                <span class="negrita" style="color:red">DATOS RECEPTOR: </span>
            </td>
        </tr>
        <tr>
            <td colspan="4"><span class="negrita">Num cliente: </span><xsl:value-of select="@n_cli"/></td>
        </tr>
        <tr>
            <td colspan="2"><span class="negrita">Direccion: </span></td>
            <td colspan="2">
                <xsl:value-of select="poblacion/@cod_postal"/>
                <br/>
                <xsl:value-of select="poblacion/text()"/>
                <br/>
                <xsl:value-of select="provincia"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="datos_factura">
        <tr>
            <td colspan="4">
                <span class="negrita" style="color:red">RESUMEN FACTURA: </span>
            </td>
        </tr>
        <tr>
            <td colspan="2"><span class="negrita">Num pedido: </span><xsl:value-of select="@n_ped"/></td>
            <td><span class="negrita">IVA: </span><xsl:value-of select="@iva"/>%</td>
            <td><span class="negrita">Forma de pago: </span><xsl:value-of select="@f_pago"/></td>
        </tr>
        <tr>
            <td colspan="2"><span class="negrita">Moneda: </span><xsl:value-of select="@moneda"/></td>
            <td colspan="2"><span class="negrita">Fecha: </span><xsl:value-of select="fecha"/></td>
        </tr>
        <tr>
            <td colspan="4">
                <span class="negrita" style="color:red">DETALLE FACTURA: </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table>
                    <thead>
                        <tr>
                            <th scope="col">Ref</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Importe</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="linea">
                            <tr>
                                <td><xsl:value-of select="ref"/></td>
                                <td><xsl:value-of select="desc"/></td>
                                <td><xsl:value-of select="cant"/></td>
                                <td><xsl:value-of select="precio"/></td>
                                <td><xsl:value-of select="importe"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
