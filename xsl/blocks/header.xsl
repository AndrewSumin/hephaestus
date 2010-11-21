<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="head">
    <div class="head">
      <header class="margin head__navy">
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
    </div>
  </xsl:template>
  
  <xsl:template match="doc" mode="menu">
    <nav class="layout__padding">
      <span class="head__menu__back"><xsl:text>&#8592; </xsl:text></span><a href="/" class="head__menu notvisited">главная</a>
    </nav>
  </xsl:template>
  
  <xsl:template match="doc" mode="page-title-text">
    Работа в Москве для верстальщиков
  </xsl:template>
  
  <xsl:template match="doc" mode="page-subtitle"/>
    
</xsl:stylesheet>
