<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="head">
    <header class="margin head">
      <hgroup>
        <table class="layout">
          <tr>
            <td colspan="8">
               <xsl:apply-templates select="." mode="menu"/>
            </td>
            <td colspan="4" style="vertical-align:middle;">
              <a href="http://hh.ru/employer/vacancy-promo.xml" class="layout__padding" style="font-size:.8em;color:#000">У меня есть вакансия</a>
            </td>
          </tr>
        </table>
      </hgroup>
    </header>
    <xsl:apply-templates select="." mode="search-form"/>
    
    <xsl:apply-templates select="." mode="page-title"/>
  </xsl:template>
  
  <xsl:template match="doc" mode="menu">
    <div class="layout__padding">
      <xsl:text>&#8592; </xsl:text><a href="/" class="notvisited">главная</a>
    </div>
  </xsl:template>
  
  <xsl:template match="doc" mode="page-title">
    <section class="margin">
      <h1 class="layout__padding title m-title_margintop">
        <xsl:apply-templates select="." mode="page-title-text"/>
      </h1>
    </section>
  </xsl:template>
  
  <xsl:template match="doc" mode="page-title-text">
    Работа в Москве для верстальщиков
  </xsl:template>
  
  <xsl:template match="doc" mode="page-subtitle"/>
    
</xsl:stylesheet>
