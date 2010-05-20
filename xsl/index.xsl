<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:jsx="http://jsx.ru" xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

<xsl:import href="blocks/page.xsl"/>
<xsl:import href="blocks/average.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  <xsl:template match="doc" mode="page-title">
    <xsl:text>Работа в Москве для верстальщиков</xsl:text>
  </xsl:template>
  
  <xsl:template match="doc" mode="body">
    <div style="background:#FFE102;">
      <section class="margin indexline">
        <table class="layout">
          <tr>
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="/search/?text={htmlcss/text}" class="shortvacancy__header__link">HTML и CSS</a>
                    <xsl:apply-templates select="htmlcss/last/hh:result/hh:found"/>
                    <xsl:apply-templates select="htmlcss/relevant/hh:result" mode="average"/>
                  </header>
                  <xsl:apply-templates select="htmlcss/last/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="/search/?text={javascript/text}" class="shortvacancy__header__link">Javascript</a>
                    <xsl:apply-templates select="javascript/last/hh:result/hh:found"/>
                    <xsl:apply-templates select="javascript/relevant/hh:result" mode="average"/>
                  </header>
                  <xsl:apply-templates select="javascript/last/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="/search/?text={jquery/text}" class="shortvacancy__header__link">jQuery</a>
                    <xsl:apply-templates select="jquery/last/hh:result/hh:found"/>
                    <xsl:apply-templates select="jquery/relevant/hh:result" mode="average"/>
                  </header>
                  <xsl:apply-templates select="jquery/last/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="12">
              &#160;
            </td>
          </tr>
          <tr>
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="/search/?text={xsl/text}" class="shortvacancy__header__link">XSLT</a>
                    <xsl:apply-templates select="xsl/last/hh:result/hh:found"/>
                    <xsl:apply-templates select="xsl/relevant/hh:result" mode="average"/>
                  </header>
                  <xsl:apply-templates select="xsl/last/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>
            
            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="/search/?text={php/text}" class="shortvacancy__header__link">PHP</a>
                    <xsl:apply-templates select="php/last/hh:result/hh:found"/>
                    <xsl:apply-templates select="php/relevant/hh:result" mode="average"/>
                  </header>
                  <xsl:apply-templates select="php/last/hh:result/hh:vacancies"/>
                </div>
              </div>
            </td>

            <td colspan="4">
              <div class="layout__paddingright">
                <div class="layout__padding shortvacancy__list">
                  <header class="shortvacancy__header">
                    <a href="/search/?text={perl/text}" class="shortvacancy__header__link">Perl</a>
                    <xsl:apply-templates select="perl/last/hh:result/hh:found"/>
                    <xsl:apply-templates select="perl/relevant/hh:result" mode="average"/>
                  </header>
                  <xsl:apply-templates select="perl/last/hh:result/hh:vacancies"/>
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
              <div class="title m-title_marginbottom">Вакансии известных компаний</div>
            </header>
            <xsl:apply-templates select="headhunter|yandex|mail|rambler|kaspersky|abbyy|rbc|actis|rucenter|ozon" mode="logo"/>
          </td>
        </tr>
      </table>
    </section>
    
    <xsl:apply-templates select="." mode="search-form"/>
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
    <a href="{hh:employer/hh:link[@rel='alternate']/@href}#vacancies" class="layout__padding">
      <xsl:apply-templates select="hh:employer/hh:logos/hh:link[@rel = 'small']"/>
    </a>
  </xsl:template>
  
  <xsl:template match="hh:logos/hh:link">
    <img src="{@href}"/>
  </xsl:template>
  
  <xsl:template match="hh:result" mode="average">
    <!--xsl:variable name="from">
      <xsl:value-of select="sum(current()//hh:compensation[hh:currency/@code = 'RUR']/hh:from) div count(current()//hh:compensation[hh:currency/@code = 'RUR']/hh:from)"/>
    </xsl:variable>
    <xsl:variable name="to">
      <xsl:value-of select="sum(current()//hh:compensation[hh:currency/@code = 'RUR']/hh:to) div count(current()//hh:compensation[hh:currency/@code = 'RUR']/hh:to)"/>
    </xsl:variable-->
    
    <span class="hint">
      <xsl:text>, средняя&#160;з/п&#160;</xsl:text>
      <xsl:value-of select="jsx:median(current()//hh:compensation[hh:currency/@code = 'RUR'])"/>
      <!--|
      <xsl:value-of select="format-number($to + ($from - $to) div 2,'###&#160;###','number')"/> -->
      <xsl:text>&#160;р.</xsl:text>
    </span>
  </xsl:template>
  
</xsl:stylesheet>


