<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

<xsl:import href="blocks/page.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  <xsl:template match="doc" mode="body">
    <section class="margin indexline">
      <table class="layout">
        <tbody>
          <tr>
            <td colspan="3">
              <header>
                <a href="#" class="shortvacancy__header__link">HTML и CSS</a>
                <span class="count">
                  <xsl:value-of select="htmlcss/hh:result/hh:found"/>
                </span>
                <xsl:apply-templates select="htmlcss/hh:result/hh:vacancies"/>
              </header>
            </td>
            <td>&#160;</td>
            <td colspan="3">
              <header>
                <a href="#" class="shortvacancy__header__link">Со знанием Javascript</a>
                <span class="count">
                  <xsl:value-of select="javascript/hh:result/hh:found"/>
                </span>
              </header>
              <xsl:apply-templates select="javascript/hh:result/hh:vacancies"/>
            </td>
            <td>&#160;</td>
            <td colspan="3">
              <header>
                <a href="#" class="shortvacancy__header__link">Со знанием XSLT</a>
                <span class="count">
                  <xsl:value-of select="xsl/hh:result/hh:found"/>
                </span>
              </header>
              <xsl:apply-templates select="xsl/hh:result/hh:vacancies"/>
            </td>
            <td>&#160;</td>
          </tr>
        </tbody>
      </table>
    </section>
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
            <div class="layout__marginright">
              <header class="shortvacancy__title">
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
</xsl:stylesheet>

