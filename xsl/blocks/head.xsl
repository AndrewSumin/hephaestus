<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="head">
    <header class="margin head">
      <hgroup>
        <table class="layout">
          <tr>
            <td colspan="8">
              <h1 class="layout__padding head__title">
                <xsl:apply-templates select="." mode="page-title"/>
              </h1>
            </td>
            <td colspan="4" style="vertical-align:middle;">
              <a href="http://hh.ru/employer/vacancy-promo.xml" class="layout__padding" style="font-size:.8em;color:#000">У меня есть вакансия</a>
            </td>
          </tr>
        </table>
      </hgroup>
    </header>
  </xsl:template>
  
  <xsl:template match="doc" mode="page-title">
    <a href="/">Главная</a>
    <xsl:text> / </xsl:text>
    <xsl:apply-templates select="." mode="page-subtitle"/>
  </xsl:template>
  
  <xsl:template match="doc" mode="page-subtitle"/>
    
</xsl:stylesheet>
