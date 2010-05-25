<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:decimal-format name="number" grouping-separator="&#160;" NaN="0"/>
 
  <xsl:variable name="shost" select="'/static/6/'"/>
  <xsl:key name="request" match="request/param" use="@name"/>
</xsl:stylesheet>

