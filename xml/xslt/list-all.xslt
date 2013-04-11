<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output method="xml" omit-xml-declaration="yes"
              indent="yes" encoding="UTF-8"/>

  <xsl:template match="node()">
    <xsl:for-each select="ancestor-or-self::*">
      <xsl:text>/</xsl:text><xsl:value-of select="name()" />
    </xsl:for-each>
    <xsl:text>&#10;</xsl:text>

    <xsl:apply-templates select="* | @*" />
  </xsl:template>

  <xsl:template match="@*">
    <xsl:for-each select="ancestor-or-self::*">
      <xsl:text>/</xsl:text><xsl:value-of select="name()" />
    </xsl:for-each>
    <xsl:text>/@</xsl:text><xsl:value-of select="name()" />
  </xsl:template>

</xsl:stylesheet>

<!-- vim: set et: -->
