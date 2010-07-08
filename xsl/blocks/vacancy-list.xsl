<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

  <xsl:template match="hh:vacancies">
    <table class="layout">
      <xsl:apply-templates select="hh:vacancy"/>
    </table>
  </xsl:template>
  
  <xsl:template match="hh:vacancies" mode="omitemployer">
    <table class="layout">
      <xsl:apply-templates select="hh:vacancy">
        <xsl:with-param name="omitemployer" select="true()"/>
      </xsl:apply-templates>
    </table>
  </xsl:template>
  

  <xsl:template match="hh:vacancy">
    <xsl:param name="omitemployer" select="false()"/>
    <tr class="vacancylist__item">
      <td colspan="5" class="vacancylist__name vacancylist__item__item">
        <div class="layout__padding">
          <a href="/vacancy/{@id}">
            <xsl:value-of select="hh:name"/>
          </a>
          <br/>
          <div class="vacancylist__info">
            <xsl:apply-templates select="hh:employer[not($omitemployer)]"/>
            <xsl:if test="not($omitemployer) and hh:address/hh:metro">
              <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="hh:address/hh:metro"/>
            <xsl:if test="not($omitemployer) or hh:address/hh:metro">
              <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="hh:update" mode="datemonth"/>
          </div>
        </div>
      </td>
      <td colspan="2" class="vacancylist__salary vacancylist__item__item">
        <div class="layout__padding">
          <xsl:apply-templates select="hh:compensation | hh:salary"/>
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
    <a href="/employer/{hh:employer/@id}">
      <img src="{hh:employer/hh:logos/hh:link/@href}"/>
    </a>
  </xsl:template>
  
  <xsl:template match="hh:vacancy/hh:employer">
    <span class="vacancylist__company">
      <xsl:choose>
        <xsl:when test="hh:link[@rel='alternate']">
          <a href="/employer/{@id}" class="vacancylist__company__link" title="{hh:name}">
            <xsl:value-of select="hh:name"/>
          </a>
        </xsl:when>
        <xsl:otherwise>
          <span class="vacancylist__company__link" title="{hh:name}">
            <xsl:value-of select="hh:name"/>
          </span>
        </xsl:otherwise>
      </xsl:choose>
    </span>
  </xsl:template>
  
</xsl:stylesheet>

