<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:hh="http://hh.ru/api"
  exclude-result-prefixes="hh">
  
  <xsl:template match="hh:update" mode="datemonth">
    <xsl:value-of select="@day"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="@month" mode="name"/>
  </xsl:template>

  <xsl:template match="hh:update" mode="full">
    <xsl:value-of select="@day"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="@month" mode="name"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="@year"/>
  </xsl:template>
  
</xsl:stylesheet>