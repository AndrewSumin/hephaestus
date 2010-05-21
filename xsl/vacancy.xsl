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
  
  
  <xsl:template match="doc" mode="title">
    Вакансия, <xsl:value-of select="hh:vacancy/hh:name"/>, <xsl:value-of select="hh:vacancy/hh:employer/hh:name"/>
  </xsl:template>  
  
  <xsl:template match="doc" mode="page-title-text">
    <xsl:value-of select="hh:vacancy/hh:name"/>
  </xsl:template>  
  
  <xsl:template match="doc" mode="body">
    <section class="margin">
      <xsl:apply-templates select="hh:vacancy"/>
    </section>
  </xsl:template>
  
  <xsl:template match="hh:vacancy">
    <table class="layout">
      <tr>
        <td colspan="8">
          <div class="layout__padding" style="margin-right:50px;">
            <div class="vacancy__description">
              <xsl:value-of select="hh:description" disable-output-escaping="yes"/>
            </div>
            <div style="margin-top:1em;">
              <xsl:apply-templates select="." mode="button">
                <xsl:with-param name="url" select="concat('http://hh.ru/applicant/vacancyResponse.do?vacancyId=', @id)"/>
                <xsl:with-param name="text" select="'Откликнуться на hh.ru &#8594;'"/>
              </xsl:apply-templates>
            </div>
          </div>
        </td>
        <td colspan="4">
          <div class="layout__padding">
            <xsl:apply-templates select="hh:employer[hh:logos/hh:link[@rel='medium']]" mode="logo"/>
            <xsl:apply-templates select="hh:employer[not(hh:logos/hh:link[@rel='medium'])]" mode="name"/>
            <xsl:apply-templates select="hh:updated"/>
            <xsl:apply-templates select="." mode="salary"/>
          </div>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="hh:employer" mode="logo">
    <div class="vacancy__value">
      <a href="{hh:link[@rel = 'alternate']/@href}">
        <img src="{hh:logos/hh:link/@href}"/>
      </a>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:employer" mode="name">
    <div class="vacancy__value">
      <a href="{hh:link[@rel = 'alternate']/@href}">
        <xsl:value-of select="hh:name"/>
      </a>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:updated">
    <div class="vacancy__label">дата публикации</div>
    <div class="vacancy__value">
      <xsl:value-of select="@day"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select="@month" mode="name"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="@year"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:vacancy" mode="salary">
    <div class="vacancy__label">зарплата</div>
    <div class="vacancy__value">
      <xsl:apply-templates select="hh:compensation"/>
    </div>
  </xsl:template>
  
</xsl:stylesheet>

