<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

<xsl:import href="blocks/page.xsl"/>
<xsl:import href="blocks/vacancy-list.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  
  <xsl:template match="doc" mode="title">
    Вакансии компании <xsl:value-of select="hh:employer/hh:name"/>
  </xsl:template>  
  
  <xsl:template match="doc[not(hh:employer)]" mode="body">
    <section class="margin">
      <div class="layout__padding">
        Извините, произошла ошибка. Возможно этого работодателя не существует.<br/>
        Если вы уверены, что это существующий работодатель, попробуйте <a href="">перезагрузить страницу</a> позже.
      </div>
    </section>
  </xsl:template>
  
  <xsl:template match="doc" mode="body">
    <section class="margin">
      <h1 class="layout__padding title m-title_margintop">
        Вакансии компании <xsl:value-of select="hh:employer/hh:name"/>
      </h1>
      <xsl:apply-templates select="hh:vacancies[hh:vacancy]"/>
      <xsl:apply-templates select="current()[not(hh:vacancies/hh:vacancy)]" mode="novacancies"/>
    </section>
    <p><br/></p>
    <xsl:apply-templates select="hh:employer"/>
  </xsl:template>
  
  <xsl:template match="hh:employer">
    <article class="margin">
      <h1 class="layout__padding title m-title_margintop">О компании</h1>
      <table class="layout">
        <tr>
          <td colspan="8">
            <div class="layout__padding description">
              <xsl:value-of select="hh:full-description" disable-output-escaping="yes"/>
            </div>
          </td>
          <td colspan="4">
            <a href="{hh:link[@rel = 'alternate']/@href}">
              <xsl:apply-templates select="." mode="logo"/>
            </a>
          </td>
        </tr>
      </table>
    </article>
  </xsl:template>
  
  <xsl:template match="hh:vacancy/hh:employer"/>
  
  <xsl:template match="hh:employer" mode="logo">
    <xsl:value-of select="hh:name"/>
  </xsl:template>
  
  <xsl:template match="hh:employer[hh:logos/hh:link[@rel='medium']]" mode="logo">
    <img src="{hh:logos/hh:link[@rel='medium']/@href}"/>
  </xsl:template>
  
  <xsl:template match="doc" mode="novacancies">
    <div class="layout__padding">
      <p><br/></p>
      У компании нет открытых вакансий
      <p><br/></p>
    </div>
  </xsl:template>
</xsl:stylesheet>

