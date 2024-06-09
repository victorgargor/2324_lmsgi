<?xml version="1.0" encoding="UTF-8"?>
<!-- La declaración de tipo de documento XSLT -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- xsl:template define una plantilla de transformación -->
    <!-- La plantilla de identidad copia todos los nodos del XML de entrada -->
    <xsl:template match="/">
        <!-- xsl:apply-templates aplica plantillas a los nodos seleccionados -->
        <xsl:apply-templates select="root"/>
    </xsl:template>

    <!-- xsl:template con un patrón de coincidencia -->
    <!-- Esta plantilla se aplica a todos los elementos "root" -->
    <xsl:template match="root">
        <html>
            <body>
                <h2>Ejemplo de XSLT con Funciones Comunes de XPath</h2>
                <!-- xsl:apply-templates aplica plantillas a los hijos de "root" -->
                <xsl:apply-templates select="items"/>
                <!-- Llamada a una plantilla que muestra el uso de funciones -->
                <xsl:call-template name="functionsExample"/>
            </body>
        </html>
    </xsl:template>

    <!-- xsl:value-of extrae el valor de un nodo -->
    <!-- Esta plantilla se aplica a los elementos "item" -->
    <xsl:template match="item">
        <p>
            <!-- Se obtiene el valor del elemento "name" hijo de "item" -->
            <b>Nombre:</b> <xsl:value-of select="name"/>
            <br/>
            <!-- Se obtiene el valor del elemento "price" hijo de "item" -->
            <b>Precio:</b> <xsl:value-of select="price"/>
        </p>
    </xsl:template>

    <!-- xsl:for-each itera sobre un conjunto de nodos -->
    <xsl:template match="items">
        <ul>
            <!-- Itera sobre cada "item" dentro de "items" -->
            <xsl:for-each select="item">
                <!-- xsl:sort ordena los elementos dentro de xsl:for-each -->
                <xsl:sort select="price" data-type="number" order="ascending"/>
                <li>
                    <!-- xsl:value-of se usa dentro de un bucle para extraer valores -->
                    <xsl:value-of select="name"/>: <xsl:value-of select="price"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <!-- xsl:if ejecuta condicionalmente un bloque de código -->
    <xsl:template match="discount">
        <p>
            <!-- xsl:if se usa para comprobar si el precio es mayor de 100 -->
            <xsl:if test="price &gt; 100">
                <b>Descuento:</b> Aplicado
            </xsl:if>
        </p>
    </xsl:template>

    <!-- xsl:choose, xsl:when, y xsl:otherwise para estructuras de decisión -->
    <xsl:template match="status">
        <p>
            <xsl:choose>
                <xsl:when test="status = 'available'">
                    <b>Status:</b> Disponible
                </xsl:when>
                <xsl:otherwise>
                    <b>Status:</b> No disponible
                </xsl:otherwise>
            </xsl:choose>
        </p>
    </xsl:template>

    <!-- xsl:attribute se usa para crear atributos en el resultado -->
    <xsl:template match="link">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="url"/>
            </xsl:attribute>
            <xsl:value-of select="text"/>
        </a>
    </xsl:template>

    <!-- xsl:text para incluir texto literal en el resultado -->
    <xsl:template match="footer">
        <footer>
            <xsl:text>Este es el pie de página< /xsl:text>
        </footer>
    </xsl:template>

    <!-- xsl:copy y xsl:copy-of para copiar nodos -->
    <xsl:template match="copyElement">
        <div>
            <!-- xsl:copy copia el elemento actual con sus atributos -->
            <xsl:copy>
                <!-- Se pueden añadir hijos o atributos al elemento copiado -->
                <xsl:apply-templates/>
            </xsl:copy>
        </div>
    </xsl:template>

    <!-- xsl:call-template para llamar a una plantilla por su nombre -->
    <xsl:template name="calledTemplate">
        <p>Esta es una plantilla llamada explícitamente</p>
    </xsl:template>

    <!-- Ejemplo de cómo llamar a una plantilla por su nombre -->
    <xsl:template match="callExample">
        <xsl:call-template name="calledTemplate"/>
    </xsl:template>

    <!-- xsl:element para crear elementos en el resultado -->
    <xsl:template match="dynamicElement">
        <xsl:element name="div">
            <xsl:text>Contenido del elemento dinámico</xsl:text>
        </xsl:element>
    </xsl:template>

    <!-- xsl:variable para definir variables -->
    <xsl:template match="variableExample">
        <xsl:variable name="varName" select="'Valor de la variable'"/>
        <p>
            <xsl:text>Variable: </xsl:text>
            <xsl:value-of select="$varName"/>
        </p>
    </xsl:template>

    <!-- xsl:param para definir parámetros -->
    <xsl:template match="paramExample">
        <xsl:param name="paramName" select="'Valor del parámetro'"/>
        <p>
            <xsl:text>Parámetro: </xsl:text>
            <xsl:value-of select="$paramName"/>
        </p>
    </xsl:template>

    <!-- xsl:key para definir claves -->
    <xsl:key name="itemsByName" match="item" use="name"/>

    <!-- Plantilla para mostrar el uso de funciones comunes de XPath -->
    <xsl:template name="functionsExample">
        <h3>Ejemplos de funciones comunes de XPath</h3>
        <!-- Usando la función string-length para obtener la longitud de una cadena -->
        <p>Longitud del nombre del primer ítem:
            <xsl:value-of select="string-length(items/item[1]/name)"/>
        </p>

        <!-- Usando la función substring para obtener una subcadena -->
        <p>Primeros 3 caracteres del nombre del primer ítem:
            <xsl:value-of select="substring(items/item[1]/name, 1, 3)"/>
        </p>

        <!-- Usando la función contains para comprobar si una cadena contiene otra cadena -->
        <p>El nombre del primer ítem contiene 'Apple':
            <xsl:if test="contains(items/item[1]/name, 'Apple')">Sí</xsl:if>
            <xsl:if test="not(contains(items/item[1]/name, 'Apple'))">No</xsl:if>
        </p>

        <!-- Usando la función concat para concatenar cadenas -->
        <p>Nombre completo del primer ítem con prefijo:
            <xsl:value-of select="concat('Producto: ', items/item[1]/name)"/>
        </p>

        <!-- Usando la función count para contar el número de elementos -->
        <p>Número total de ítems:
            <xsl:value-of select="count(items/item)"/>
        </p>

        <!-- Usando la función sum para sumar valores -->
        <p>Suma de todos los precios:
            <xsl:value-of select="sum(items/item/price)"/>
        </p>

        <!-- Usando la función translate para reemplazar caracteres -->
        <p>Nombre del primer ítem con 'a' reemplazado por 'o':
            <xsl:value-of select="translate(items/item[1]/name, 'a', 'o')"/>
        </p>
    </xsl:template>

</xsl:stylesheet>
