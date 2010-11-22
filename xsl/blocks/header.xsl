<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="head">
    <header class="margin head">
      <table class="layout">
        <tr>
          <td colspan="8">
             <xsl:apply-templates select="." mode="menu"/>
          </td>
          <td colspan="4" style="vertical-align:middle;">
            <a href="http://hh.ru/employer/vacancy-promo/" class="layout__padding" style="font-size:.8em;color:#000">У меня есть вакансия</a>
          </td>
        </tr>
      </table>
    </header>
    <xsl:apply-templates select="." mode="search-form"/>
  </xsl:template>
  
  <xsl:template match="doc" mode="menu">
    <nav class="layout__padding">
      <span style="position:absolute;margin-left:-1.3em;margin-top:-2px;font-size:1.1em;"><xsl:text>&#8592; </xsl:text></span><a href="/" class="notvisited">главная</a>
    </nav>
  </xsl:template>
  
  <xsl:template match="doc" mode="page-title-text">
    Работа в Москве для верстальщиков
  </xsl:template>
  
  <xsl:template match="doc" mode="page-subtitle"/>
    
</xsl:stylesheet>
