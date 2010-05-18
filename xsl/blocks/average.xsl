<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:func="http://exslt.org/functions"
  xmlns:jsx="http://jsx.ru"
  xmlns:hh="http://hh.ru/api"
  extension-element-prefixes="func">
  
  <xsl:output omit-xml-declaration="yes"/>
  
  <func:function name="jsx:avg">
    <xsl:param name="from"/>
    <xsl:param name="to"/>
    <xsl:variable name="avg">
      <xsl:choose>
        <xsl:when test="$from and $to">
          <xsl:value-of select="($from + $to) div 2"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$from|$to"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <func:result select="$avg"/>
  </func:function>
  
  <func:function name="jsx:median">
    <xsl:param name="nodes"/>
    <xsl:variable name="pos" select="round(count($nodes) div 2)"/>
    <xsl:variable name="result">
      <xsl:for-each select="$nodes">
        <xsl:sort select="jsx:avg(hh:from,hh:to)" data-type="number" />
        <xsl:if test="position() = $pos">
         <xsl:value-of select="jsx:avg(hh:from,hh:to)"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    <func:result select="$result"/>    
  </func:function>
  
  <!--xsl:template match="/">
    <xsl:value-of select="jsx:median(/results/result/comp[from or to])"/>
  </xsl:template-->
  
</xsl:stylesheet>