<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="@month[. = '01']" mode="name">
    <xsl:text>января</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '02']" mode="name">
    <xsl:text>февраля</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '03']" mode="name">
    <xsl:text>марта</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '04']" mode="name">
    <xsl:text>апреля</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '05']" mode="name">
    <xsl:text>мая</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '06']" mode="name">
    <xsl:text>июня</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '07']" mode="name">
    <xsl:text>июля</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '08']" mode="name">
    <xsl:text>августа</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '09']" mode="name">
    <xsl:text>сентября</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '10']" mode="name">
    <xsl:text>октября</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '11']" mode="name">
    <xsl:text>ноября</xsl:text>
  </xsl:template>
  <xsl:template match="@month[. = '12']" mode="name">
    <xsl:text>декабря</xsl:text>
  </xsl:template>
</xsl:stylesheet>