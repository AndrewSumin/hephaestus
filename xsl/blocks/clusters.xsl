<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

  <xsl:template match="hh:clusters">
    <xsl:if test="key('request', 'metro')">
      <div class="layout__padding clusters m-clusters_selected">
        <a class="clusters__link">
          <xsl:attribute name="href">
            <xsl:text>?</xsl:text><xsl:apply-templates select="$request/param[@name != 'metro']" mode="clearmetro"/>
          </xsl:attribute>
          <xsl:text>Вся Москва</xsl:text>
        </a>
        <xsl:text>, </xsl:text>
        <xsl:choose>
          <xsl:when test="hh:cluster[@name = 'metro']/hh:line[hh:value = key('request', 'metro')]">
            <xsl:text>выбрана </xsl:text>
            <span style="color:{hh:cluster[@name = 'metro']/hh:line[hh:value = key('request', 'metro')]/@color}">
              <xsl:value-of select="hh:cluster[@name = 'metro']/hh:line[hh:value = key('request', 'metro')]/hh:name"/>
            </span>
            <xsl:text> ветка</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>выбрана станция </xsl:text>
            <span style="color:{hh:cluster[@name = 'metro']/hh:line/hh:station[hh:value = key('request', 'metro')]/@color}">
              <xsl:value-of select="hh:cluster[@name = 'metro']/hh:line/hh:station[hh:value = key('request', 'metro')]/hh:name"/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </xsl:if>
    <div class="layout__padding clusters">
      <xsl:apply-templates select="hh:cluster[@name = 'metro' and count(hh:line/hh:station) != 1]"/>
      <!--xsl:apply-templates select="hh:cluster[@name = 'fields' and not(key('request', 'specialization'))]/hh:field[hh:value = '1']"/-->
      <!--xsl:apply-templates select="hh:cluster[@name = 'employment' and not(key('request', 'employment')) and count(hh:employment) != 1]"/-->
      <!--xsl:apply-templates select="hh:cluster[@name = 'experience']"/-->
    </div>
  </xsl:template>
  
  <xsl:template match="hh:clusters/hh:cluster[@name = 'metro']">
    <div class="clusters__cluster">
      <header class="clusters__title">Метро</header>
      <xsl:choose>
        <xsl:when test="count(hh:line) = 1">
          <xsl:apply-templates select="hh:line/hh:station"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="hh:line"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster/hh:line">
    <div class="clusters__cluster__item">
      <a href="?{hh:query}" style="color:{@color}"><xsl:value-of select="hh:name"/></a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster/hh:line/hh:station">
    <div class="clusters__cluster__item">
      <a href="?{hh:query}" style="color:{@color}">м. <xsl:value-of select="hh:name"/></a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:clusters/hh:cluster[@name = 'fields']/hh:field">
    <div class="clusters__cluster">
      <header class="clusters__title">Специализации</header>
      <xsl:apply-templates select="hh:specialization[position() &lt; 6]">
        <xsl:sort select="value"/>
      </xsl:apply-templates>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster/hh:field/hh:specialization">
    <div class="clusters__cluster__item">
      <a href="?{hh:query}" class="clusters__link"><xsl:value-of select="hh:name"/></a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:clusters/hh:cluster[@name = 'employment']">
    <div class="clusters__cluster">
      <header class="clusters__title">Занятость</header>
      <xsl:apply-templates select="hh:employment"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:clusters/hh:cluster[@name = 'experience']">
    <div class="clusters__cluster">
      <header class="clusters__title">Опыт работы</header>
      <xsl:apply-templates select="hh:experience"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster/hh:employment | hh:cluster/hh:experience">
    <div class="clusters__cluster__item">
      <a href="?{hh:query}" class="clusters__link"><xsl:value-of select="hh:name"/></a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="param" mode="clearmetro">
    <xsl:if test="position() != 1">&amp;</xsl:if>
    <xsl:value-of select="@name"/>=<xsl:value-of select="."/>
  </xsl:template>
  
</xsl:stylesheet>
