<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:hh="http://hh.ru/api"
  exclude-result-prefixes="hh">

  <xsl:template match="hh:compensation | hh:salary" mode="notags">
    <xsl:apply-templates select=".">
      <xsl:with-param name="notags" select="true()"/>
    </xsl:apply-templates>
  </xsl:template>
  

  <xsl:template match="hh:compensation | hh:salary">
    <xsl:param name="break"/>
    <xsl:param name="notags" select="false()"/>
    <xsl:apply-templates select="hh:from"/>
    <xsl:choose>
      <xsl:when test="hh:from and hh:to and $break">
        <br/>
      </xsl:when>
      <xsl:when test="hh:from and hh:to">
        <xsl:text> </xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates select="hh:to"/>
    <xsl:apply-templates select="hh:currency"/>
    <xsl:apply-templates select="hh:notset[not($notags)]"/>
    <xsl:apply-templates select="hh:notset[$notags]" mode="notags"/>
  </xsl:template>

  <xsl:template match="hh:from"/>
  <xsl:template match="hh:to"/>
  
  <xsl:template match="hh:from[.!='' and .!='0']">
    <xsl:text>от </xsl:text>
    <xsl:value-of select="format-number(.,'###&#160;###','number')"/>
  </xsl:template>
  
  <xsl:template match="hh:to[.!='' and .!='0']">
    <xsl:text>до </xsl:text>
    <xsl:value-of select="format-number(.,'###&#160;###','number')"/>
  </xsl:template>
  
  <xsl:template match="hh:currency">
    <xsl:text> </xsl:text>
    <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="hh:currency[@code='RUR']">
    <xsl:text> р.</xsl:text>
  </xsl:template>
  
  <xsl:template match="hh:currency[@code='USD']">
    <xsl:text> $</xsl:text>
  </xsl:template>

  <xsl:template match="hh:currency[@code='EUR']">
    <xsl:text> eur</xsl:text>
  </xsl:template>
  

  <xsl:template match="hh:notset">
    <span class="salary__notset">з/п не указана</span>
  </xsl:template>

  <xsl:template match="hh:notset" mode="notags">
    <xsl:text>з/п не указана</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>