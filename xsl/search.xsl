<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

  <xsl:import href="blocks/page.xsl"/>
  <xsl:import href="blocks/vacancy-list.xsl"/>
  <xsl:import href="blocks/clusters.xsl"/>

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
        <tr>
          <td colspan="9">
            <xsl:apply-templates select="search/hh:result/hh:vacancies"/>
          </td>
          <td colspan="3">
            <xsl:apply-templates select="search/hh:result/hh:clusters"/>
          </td>
        </tr>
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
</xsl:stylesheet>

