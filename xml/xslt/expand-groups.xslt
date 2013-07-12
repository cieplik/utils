<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:output method="xml" omit-xml-declaration="yes"
              indent="yes" encoding="UTF-8" />

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="xs:attributeGroup[@ref]">
    <xsl:comment> attr-group:<xsl:value-of select="@ref" /> BEGIN<xsl:text> </xsl:text></xsl:comment>
    <xsl:apply-templates select="//xs:attributeGroup[@name=current()/@ref]/node()" />
    <xsl:comment> attr-group:<xsl:value-of select="@ref" /> END<xsl:text> </xsl:text></xsl:comment>
  </xsl:template>

  <xsl:template match="xs:group[@ref]">
    <xsl:comment> group:<xsl:value-of select="@ref" /> BEGIN<xsl:text> </xsl:text></xsl:comment>
    <xsl:apply-templates select="//xs:group[@name=current()/@ref]/node()" />
    <xsl:comment> group:<xsl:value-of select="@ref" /> END<xsl:text> </xsl:text></xsl:comment>
  </xsl:template>

  <xsl:template match="xs:group[@name] | xs:attributeGroup[@name]">
    <xsl:comment> Expanded and removed <xsl:value-of select="@name" /><xsl:text> </xsl:text></xsl:comment>
  </xsl:template>

</xsl:stylesheet>

<!-- vim: set et: -->
