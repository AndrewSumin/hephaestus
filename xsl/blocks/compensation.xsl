<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:hh="http://hh.ru/api"
  exclude-result-prefixes="hh">

  <xsl:template match="hh:compensation">
    <xsl:apply-templates select="hh:from"/>
    <xsl:if test="hh:from and hh:to">
      <br/>
    </xsl:if>
    <xsl:apply-templates select="hh:to"/>
    <xsl:apply-templates select="hh:currency"/>
    <xsl:apply-templates select="hh:notset"/>
  </xsl:template>

  <xsl:template match="hh:compensation/hh:from"/>
  <xsl:template match="hh:compensation/hh:to"/>
  
  <xsl:template match="hh:compensation/hh:from[.!='' and .!='0']">
    <xsl:text>от </xsl:text>
    <xsl:value-of select="format-number(.,'###&#160;###&#160;###', 'number')"/>
  </xsl:template>
  
  <xsl:template match="hh:compensation/hh:to[.!='' and .!='0']">
    <xsl:text>до </xsl:text>
    <xsl:value-of select="format-number(.,'###&#160;###&#160;###', 'number')"/>
  </xsl:template>
  
  <xsl:template match="hh:compensation/hh:currency">
    <xsl:text> </xsl:text>
    <xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="hh:compensation/hh:notset">
    <span class="salary__notset">з/п не указанна</span>
  </xsl:template>
  
  
  
</xsl:stylesheet>