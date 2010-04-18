<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:hh="http://schema.reintegration.hh.ru/types"
  exclude-result-prefixes="hh x"
  xmlns:x="http://www.yandex.ru/xscript"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl">
  
  <xsl:template match="doc">
    <!-- суём все в переменную -->
    <xsl:variable name="nodeset">
      <xsl:apply-templates select="." mode="page"/>
    </xsl:variable>
    
    <!-- кормим всё jsx-парсеру -->
    <xsl:apply-templates select="exsl:node-set($nodeset)" mode="jsx-parse-for"/> 
  </xsl:template>
  
  <xsl:template match="@*|node()" mode="jsx-parse-for">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="jsx-parse-for"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="*[@jsx]" mode="jsx-parse-for">
    <xsl:variable name="id" select="generate-id()" />
    <xsl:element name="{name()}">
      <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
      <xsl:attribute name="onclick"><xsl:text>return {</xsl:text><xsl:value-of select="@jsx" /><xsl:text>}</xsl:text></xsl:attribute>
      <xsl:apply-templates select="@*[name()!='id' and name()!='onclick']|node()" mode="jsx-parse-for"/>
    </xsl:element>
    <script type="text/javascript">
        if (jsx) {jsx.require(['Components'], function(){jsx.Components.createComponents([document.getElementById('<xsl:value-of select="$id"/>')])});}
      </script>
  </xsl:template>
  
  <xsl:template match="@jsx" mode="jsx-parse-for"/>
  
</xsl:stylesheet>