<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:variable name="newline" select="'&#10;'"/>
    <xsl:variable name="tab" select="'    '"/>
    <xsl:output method="text" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="/network">
        <xsl:value-of select="concat(name(),':')"/>
        <xsl:value-of select="concat($newline,$tab)"/>
        <xsl:value-of select="concat(ethernets/name(),':')"/>
        <xsl:apply-templates select="ethernets"/>
    </xsl:template>

    <xsl:template match="ethernets">
        <xsl:value-of select="concat($newline,$tab,$tab)"/>
        <xsl:value-of select="concat(name/text(),':')"/>
        <xsl:value-of select="concat($newline,$tab,$tab,$tab)"/>
        <xsl:value-of select="concat(addresses/name(),':')"/>
        <xsl:value-of select="concat($newline,$tab,$tab,$tab,$tab)"/>
        <xsl:value-of select="addresses/text()"/>
        <xsl:if test="gateway4">
            <xsl:apply-templates select="gateway4"/>
        </xsl:if>
        <xsl:if test="nameservers">
            <xsl:apply-templates select="nameservers"/>
        </xsl:if>    
    </xsl:template>

    <xsl:template match="gateway4">
        <xsl:value-of select="concat($newline,$tab,$tab,$tab)"/>
        <xsl:value-of select="'routes:'"/>
        <xsl:value-of select="concat($newline,$tab,$tab,$tab,$tab)"/>
        <xsl:value-of select="'to: default'"/>
        <xsl:value-of select="concat($newline,$tab,$tab,$tab,$tab)"/>
        <xsl:value-of select="concat('via: ', text())"/>
    </xsl:template>

    <xsl:template match="nameservers">
        <xsl:value-of select="concat($newline,$tab,$tab,$tab)"/>
        <xsl:value-of select="concat(name(), ':')"/>
        <xsl:value-of select="concat($newline,$tab,$tab,$tab,$tab)"/>
        <xsl:value-of select="concat(addresses/name(), ':')"/>
        <xsl:for-each select="addresses">
            <xsl:value-of select="concat($newline,$tab,$tab,$tab,$tab,$tab)"/>
            <xsl:value-of select="text()"/>
        </xsl:for-each>
    </xsl:template>  
</xsl:stylesheet>