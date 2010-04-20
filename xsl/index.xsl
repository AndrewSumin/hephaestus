<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

<xsl:import href="blocks/page.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  <xsl:template match="doc" mode="body">
    <div style="background:#FFE102;">
      <section class="margin indexline">
        <table class="layout">
          <tr>
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="#" class="shortvacancy__header__link">HTML и CSS</a>
                    <xsl:apply-templates select="htmlcss/hh:result/hh:found"/>
                    <xsl:apply-templates select="htmlcss/hh:result" mode="avarage"/>
                  </header>
                  <xsl:apply-templates select="htmlcss/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="#" class="shortvacancy__header__link">Javascript</a>
                    <xsl:apply-templates select="javascript/hh:result/hh:found"/>
                    <xsl:apply-templates select="javascript/hh:result" mode="avarage"/>
                  </header>
                  <xsl:apply-templates select="javascript/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="#" class="shortvacancy__header__link">XSLT</a>
                    <xsl:apply-templates select="xsl/hh:result/hh:found"/>
                    <xsl:apply-templates select="xsl/hh:result" mode="avarage"/>
                  </header>
                  <xsl:apply-templates select="xsl/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>
          </tr>
        </table>
      </section>
    </div>
    
    <section class="margin indexline">
      <table class="layout">
        <tr>
          <td colspan="12">
            <header class="layout__padding">
              <span class="title">Вакансии известных компаний</span>
            </header>
            <xsl:apply-templates select="headhunter|yandex|mail|rambler|kaspersky|abbyy" mode="logo"></xsl:apply-templates>
          </td>
        </tr>
      </table>
    </section>
  </xsl:template>
  
  <xsl:template match="hh:found">
    <span class="count">
      <xsl:apply-templates select="." mode="conversion">
        <xsl:with-param name="num" select="."/>
        <xsl:with-param name="zero" select="'вакансий'"/>
        <xsl:with-param name="one" select="'вакансия'"/>
        <xsl:with-param name="some" select="'вакансий'"/>
        <xsl:with-param name="many" select="'вакансии'"/>
      </xsl:apply-templates>
    </span>
  </xsl:template>
  
  <xsl:template match="hh:vacancies">
    <section>
      <xsl:apply-templates select="hh:vacancy[position() &lt; 6]"/>
    </section>
  </xsl:template>
  
  <xsl:template match="hh:vacancy">
    <article class="shortvacancy">
      <table class="layout">
        <tr>
          <td colspan="2">
            <div class="layout__paddingright">
              <header class="title">
                <a class="shortvacancy__title__link" href="{hh:link[@rel='alternate']/@href}" title="{hh:name}">
                  <xsl:value-of select="hh:name"/>
                </a>
                <span class="fade">&#160;</span>
              </header>
              <details>
                <xsl:apply-templates select="hh:employer"/>
              </details>
            </div>
          </td>
          <td>
            <span class="salary">
              <xsl:apply-templates select="hh:compensation"/>
            </span>
          </td>
        </tr>
      </table>
    </article>
  </xsl:template>
  
  <xsl:template match="hh:employer">
    <div class="shortvacancy__company">
      <xsl:choose>
        <xsl:when test="hh:link[@rel='alternate']">
          <a href="{hh:link[@rel='alternate']/@href}" class="shortvacancy__company__link" title="{hh:name}">
            <xsl:value-of select="hh:name"/>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <span class="shortvacancy__company__link" title="{hh:name}">
            <xsl:value-of select="hh:name"/>
          </span>
        </xsl:otherwise>
      </xsl:choose>
      <span class="fade">&#160;</span>
    </div>
  </xsl:template>
  
  <xsl:template match="*" mode="logo">
    <div class="layout__padding">
      <xsl:apply-templates select="hh:employer/hh:logos/hh:link[@rel = 'small']"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:logos/hh:link">
    <img src="{@href}"/>
  </xsl:template>
  
  <xsl:template match="hh:result" mode="avarage">
    <xsl:variable name="from">
      <xsl:value-of select="sum(current()//hh:compensation/hh:from) div count(current()//hh:compensation/hh:from)"/>
    </xsl:variable>
    <xsl:variable name="to">
      <xsl:value-of select="sum(current()//hh:compensation/hh:to) div count(current()//hh:compensation/hh:to)"/>
    </xsl:variable>
    <span class="hint">
      <xsl:text>, средняя&#160;з/п&#160;</xsl:text>
      <xsl:value-of select="format-number($to + ($from - $to) div 2,'###&#160;###','number')"/>
      <xsl:text>&#160;р.</xsl:text>
    </span>
  </xsl:template>
  
</xsl:stylesheet>

