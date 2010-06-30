<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">
  
  <xsl:template match="hh:clusters">
    <xsl:if test="key('request', 'metro') or key('request', 'employment') or key('request', 'specialization')">
      <div class="layout__padding clusters m-clusters_selected">
        <xsl:apply-templates select="hh:cluster[@name = 'metro'][key('request', 'metro')]" mode="reset"/>
        <xsl:apply-templates select="hh:cluster[@name = 'fields'][key('request', 'specialization')]" mode="reset"/>
        <xsl:apply-templates select="hh:cluster[@name = 'employment'][key('request', 'employment')]" mode="reset"/>
      </div>
    </xsl:if>
    <div class="layout__padding clusters">
      <xsl:apply-templates select="hh:cluster[@name = 'metro' and count(hh:line/hh:station) != 1]"/>
      <xsl:apply-templates select="hh:cluster[@name = 'fields' and not(key('request', 'specialization'))]/hh:field[hh:value = '17']"/>
      <xsl:apply-templates select="hh:cluster[@name = 'employment' and not(key('request', 'employment')) and count(hh:employment) != 1]"/>
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
      <a style="color:{@color}">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="href"/>
        </xsl:attribute>
        <xsl:value-of select="hh:name"/>
      </a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster/hh:line/hh:station">
    <div class="clusters__cluster__item">
      <a style="color:{@color}">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="href"/>
        </xsl:attribute>
        <xsl:text>м. </xsl:text><xsl:value-of select="hh:name"/>
      </a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:clusters/hh:cluster[@name = 'fields']/hh:field">
    <div class="clusters__cluster">
      <header class="clusters__title">Специализации</header>
      <xsl:apply-templates select="hh:specialization[position() &lt; 6]">
        <xsl:sort select="@found"/>
      </xsl:apply-templates>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster/hh:field/hh:specialization">
    <div class="clusters__cluster__item">
      <a class="clusters__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="href"/>
        </xsl:attribute>
        <xsl:value-of select="hh:name"/>
      </a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
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
  
  <xsl:template match="hh:cluster/hh:employment">
    <div class="clusters__cluster__item">
      <a class="clusters__link">
        <xsl:attribute name="href">
          <xsl:apply-templates select="." mode="href"/>
        </xsl:attribute>
        <xsl:value-of select="hh:name"/>
      </a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster/hh:experience">
    <div class="clusters__cluster__item">
      <a href="?{hh:query}" class="clusters__link"><xsl:value-of select="hh:name"/></a>&#160;<span class="clusters__count"><xsl:value-of select="@found"/></span>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:line | hh:station" mode="href">
    <xsl:text>?</xsl:text>
    <xsl:apply-templates select="$params[@name != 'metro']" mode="concat-params"/>
    <xsl:if test="$params[@name != 'metro']">
      <xsl:text>&amp;</xsl:text>
    </xsl:if>
    <xsl:text>metro=</xsl:text><xsl:value-of select="hh:value"/>
  </xsl:template>
  
  <xsl:template match="hh:specialization" mode="href">
    <xsl:text>?</xsl:text>
    <xsl:apply-templates select="$params[@name != 'specialization']" mode="concat-params"/>
    <xsl:if test="$params[@name != 'specialization']">
      <xsl:text>&amp;</xsl:text>
    </xsl:if>
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text><xsl:value-of select="hh:value"/>
  </xsl:template>
  
  <xsl:template match="hh:employment" mode="href">
    <xsl:text>?</xsl:text>
    <xsl:apply-templates select="$params[@name != 'employment']" mode="concat-params"/>
    <xsl:if test="$params[@name != 'employment']">
      <xsl:text>&amp;</xsl:text>
    </xsl:if>
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text><xsl:value-of select="hh:value"/>
  </xsl:template>
  
  <xsl:template match="param" mode="href">
    <xsl:value-of select="@name"/>=<xsl:value-of select="."/><xsl:text>&amp;</xsl:text>
  </xsl:template>
  
  <xsl:template match="hh:cluster[@name = 'metro']" mode="reset">
    <div class="clusters__cluster__item">
      <a class="clusters__link">
        <xsl:attribute name="href">
          <xsl:choose>
            <xsl:when test="$params[@name != 'metro']">
              <xsl:text>?</xsl:text>
              <xsl:apply-templates select="$params[@name != 'metro']" mode="concat-params"/>
            </xsl:when>
            <xsl:otherwise>.</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:text>Вся Москва</xsl:text>
      </a>
      <xsl:text>, </xsl:text>
      <xsl:choose>
        <xsl:when test="hh:line[hh:value = key('request', 'metro')]">
          <xsl:text>выбрана </xsl:text>
          <span style="color:{hh:line[hh:value = key('request', 'metro')]/@color}">
            <xsl:value-of select="hh:line[hh:value = key('request', 'metro')]/hh:name"/>
          </span>
          <xsl:text> ветка</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>выбрана станция </xsl:text>
          <span style="color:{hh:line/hh:station[hh:value = key('request', 'metro')]/@color}">
            <xsl:value-of select="hh:line/hh:station[hh:value = key('request', 'metro')]/hh:name"/>
          </span>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>
  
  
  <xsl:template match="hh:cluster[@name = 'fields']" mode="reset">
    <div class="clusters__cluster__item">
      <a class="clusters__link">
        <xsl:attribute name="href">
          <xsl:choose>
            <xsl:when test="$params[@name != 'specialization']">
              <xsl:text>?</xsl:text>
              <xsl:apply-templates select="$params[@name != 'specialization']" mode="concat-params"/>
            </xsl:when>
            <xsl:otherwise>.</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:text>Всe специализации</xsl:text>
      </a>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="hh:field/hh:specialization[hh:value = key('request', 'specialization')]/hh:name"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:cluster[@name = 'employment']" mode="reset">
    <div class="clusters__cluster__item">
      <a class="clusters__link">
        <xsl:attribute name="href">
          <xsl:choose>
            <xsl:when test="$params[@name != 'employment']">
              <xsl:text>?</xsl:text>
              <xsl:apply-templates select="$params[@name != 'employment']" mode="concat-params"/>
            </xsl:when>
            <xsl:otherwise>.</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:text>Любая занятость</xsl:text>
      </a>
      <xsl:text>, </xsl:text>
      <span style="text-transform:lowercase"><xsl:value-of select="hh:employment[hh:value = key('request', 'employment')]/hh:name"/></span>
    </div>
  </xsl:template>
  
  
</xsl:stylesheet>
