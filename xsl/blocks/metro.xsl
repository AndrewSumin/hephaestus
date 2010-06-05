<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">
  
  
  <xsl:template match="hh:metro">
    <span style="color:{hh:line/@color}">
      <xsl:text>м. </xsl:text>
      <xsl:value-of select="hh:line/hh:station"/>
    </span>
  </xsl:template>
  
  <xsl:template match="doc" mode="body"/>
  
</xsl:stylesheet>

