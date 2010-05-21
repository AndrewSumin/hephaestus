<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

<xsl:import href="blocks/page.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  <xsl:template match="doc" mode="page-title-text">
    <xsl:apply-templates select="." mode="conversion">
      <xsl:with-param name="num" select="search/hh:result/hh:found"/>
      <xsl:with-param name="zero" select="'Найдено'"/>
      <xsl:with-param name="one" select="'Найдена'"/>
      <xsl:with-param name="some" select="'Найдено'"/>
      <xsl:with-param name="many" select="'Найдено'"/>
      <xsl:with-param name="with-num" select="false()"/>
    </xsl:apply-templates>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="." mode="conversion">
      <xsl:with-param name="num" select="search/hh:result/hh:found"/>
      <xsl:with-param name="zero" select="'вакансий'"/>
      <xsl:with-param name="one" select="'вакансия'"/>
      <xsl:with-param name="some" select="'вакансий'"/>
      <xsl:with-param name="many" select="'вакансии'"/>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="doc" mode="body">
    
    <section class="margin">
      <table class="layout">
        <xsl:apply-templates select="search/hh:result/hh:vacancies/hh:vacancy"/>
      </table>
      
      <div class="pager">
        <xsl:apply-templates select="/" mode="pager">
          <xsl:with-param name="interval" select="10"/>
          <xsl:with-param name="total" select="ceiling(search/hh:result/hh:found div 20)"/>
          <xsl:with-param name="current">
            <xsl:choose>
              <xsl:when test="key('request', 'page') != ''">
                <xsl:value-of select="key('request', 'page')"/>
              </xsl:when>
              <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
          
          <xsl:with-param name="href">
            <xsl:text>/search?text=</xsl:text>
            <xsl:value-of select="key('request','text')"/>
            <xsl:text>&amp;salary=</xsl:text>
            <xsl:value-of select="key('request','salary')"/>
            <xsl:text>&amp;page=</xsl:text>
          </xsl:with-param>
        </xsl:apply-templates>
      </div>
    </section>
  </xsl:template>
  
  <xsl:template match="hh:vacancy">
    <tr class="vacancylist__item">
      <td colspan="6" class="vacancylist__name vacancylist__item__item">
        <div class="layout__padding">
          
          <a href="/vacancy/{@id}">
            <xsl:value-of select="hh:name"/>
          </a>
          <br/>
          <xsl:apply-templates select="hh:employer"/>
        </div>
      </td>
      <td colspan="4" class="vacancylist__salary vacancylist__item__item">
        <div class="layout__padding">
          <xsl:apply-templates select="hh:compensation"/>
        </div>
      </td>
      <td colspan="2" class="vacancylist__logo vacancylist__item__item">
        <xsl:apply-templates select="." mode="logo"/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="hh:vacancy" mode="logo">
    &#160;
  </xsl:template>
  
  <xsl:template match="hh:vacancy[hh:employer/hh:logos/hh:link[@rel='small']]" mode="logo">
    <a href="{hh:employer/hh:link[@rel = 'alternate']/@href}">
      <img src="{hh:employer/hh:logos/hh:link/@href}"/>
    </a>
  </xsl:template>
  
  <xsl:template match="hh:employer">
    <div class="vacancylist__company">
      <xsl:choose>
        <xsl:when test="hh:link[@rel='alternate']">
          <a href="{hh:link[@rel='alternate']/@href}" class="vacancylist__company__link" title="{hh:name}">
            <xsl:value-of select="hh:name"/>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <span class="vacancylist__company__link" title="{hh:name}">
            <xsl:value-of select="hh:name"/>
          </span>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>
  
</xsl:stylesheet>

