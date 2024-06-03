<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:param name="corregido" select="no"/>
    <xsl:template match="/examen">
        <html>
            <xsl:call-template name="escribirDoctype"/>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <xsl:call-template name="escribirTitulo">
                    <xsl:with-param name="titulo" select="'06 XSLT Victor Garcia Gordon'"/>    
                </xsl:call-template>
            </head>
            <body>
                <header>
                    <xsl:apply-templates select="datos"/>
                </header>
                <main>
                    <form action="examen.php" method="get">
                        <xsl:apply-templates select="preguntas/pregunta"/>
                        <xsl:if test="$corregido='no'">
                            <fieldset class="botones">
                                <input type="button">Enviar</input>
                                <input type="reset">Borrar</input>
                            </fieldset>    
                        </xsl:if>
                    </form>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="datos">
        <h1><xsl:value-of select="nombreCiclo"/></h1>
        <h2><xsl:value-of select="document('../data/modulosdaw1.xml')/modulos/modulo[@codM=current()/nombreModulo]"/></h2>  
        <h3><xsl:value-of select="concat('Fecha: ',fecha/dia,' de ',fecha/mes,' de ',fecha/anyo)"/></h3>   
    </xsl:template>

    <xsl:template match="preguntas/pregunta">
        <fieldset class="">
            <ol>
                <li><xsl:value-of select="concat(@id,'.-',enunciado)"/></li>
                <xsl:apply-templates select="respuestas/respuesta"/>  
            </ol>                  
        </fieldset>
    </xsl:template>

    <xsl:template match="respuesta">
        <xsl:variable name="idPregunta" select="../../@id"/>
        <div>
            <label>
                <input type="radio" name="{'p',$idPregunta}" value="{concat($idPregunta,position())}">
                    <xsl:if test="$corregido='si'">
                        <xsl:attribute name="disabled"/>
                        <xsl:if test="@correcta='correcta'">
                            <xsl:attribute name="checked"/>    
                        </xsl:if>
                    </xsl:if>
                </input>
                <xsl:value-of select="current()"/>
            </label>
        </div>
    </xsl:template>
</xsl:stylesheet>
