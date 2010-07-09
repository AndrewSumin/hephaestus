<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:jsx="http://jsx.ru" xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

<xsl:import href="blocks/page.xsl"/>
<xsl:import href="blocks/average.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  <xsl:template match="doc" mode="menu">
    <h4 class="layout__padding head__title">Работа для продавцов в Москве</h4>
    <div class="layout__padding">
      <h1 class="head_subtitle">Менеджер по продажам</h1>
      <span class="head_subtitle">&#160;&#183;&#160;</span>
      <h2 class="head_subtitle">Продавец-консультант</h2>
      <span class="head_subtitle">&#160;&#183;&#160;</span>
      <h3 class="head_subtitle">Торговый представитель</h3>
    </div>
  </xsl:template>
  
  <xsl:template match="doc" mode="body">
    <div style="background:#99E102;">
      <section class="margin indexline">
        <table class="layout">
          <tr>
            <xsl:apply-templates select="tabs/tab[position() &lt; 4]"/>
          </tr>
          <tr>
            <td colspan="12">
              &#160;
            </td>
          </tr>
          <tr>
            <xsl:apply-templates select="tabs/tab[position() &gt; 3]"/>
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
            <xsl:apply-templates select="employer" mode="logo"/>
          </td>
        </tr>
      </table>
    </section>
    
    <section class="margin indexline">
      <div class="layout__padding" style="color:#999;font-size:.8em;">
        <p>
        Давайте представим, что у вас есть друг - отличный менеджер по продажам или торговый представитель, настоящий профессионал своего дела, который может одинаково виртуозно продавать как холодильники, так и навороченную ERP-систему. Представили? И вот, ваш друг решил сменить работу (мы-то с вами знаем, что он может рассчитывать на большее) и отважно приступил к поискам. 
        Заглянув на все известные работные сайты, он был немало удивлен. Вакансий тысячи, кто только не требуется, но ему-то нужна вполне конкретная вакансия - менеджер по продажам или менеджер по работе с клиентами. 
        Как только ни строил наш друг поисковые запросы: и работа для продавцов, и работа продавцом, и даже менеджер по работе с ключевыми клиентами. Потратил уйму времени и сил, но найти подходящую было также трудно, как иголку в стоге сена. 
        </p>
        <p>
        Именно поэтому мы создали сайт, где собраны вакансии только в сфере продаж. 
        </p>
        <p>
        Неважно, вы просто начинающий продавец консультант или известный директор по продажам. Этот сайт создан специально для вас.
        </p>
      </div>
    </section>
    
  </xsl:template>
  
  <xsl:template match="tab">
    <td colspan="4">
      <div class="layout__paddingright">
        <div class="layout__padding shortvacancy__list">
          <h2 class="shortvacancy__header">
            <a href="/search/?text={text}&amp;salary={salary}&amp;onlysalary={onlysalary}" class="shortvacancy__header__link"><xsl:value-of select="name"/></a>
            <xsl:apply-templates select="last/hh:result/hh:found"/>
            <xsl:apply-templates select="median" mode="average"/>
          </h2>
          <xsl:apply-templates select="last/hh:result/hh:vacancies"/>
        </div>
      </div>
    </td>
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
    <div>
      <xsl:apply-templates select="hh:vacancy[position() &lt; 6]"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:vacancy">
    <div class="shortvacancy">
      <table class="layout">
        <tr>
          <td colspan="2">
            <div class="layout__paddingright">
              <h3 class="shortvacancy__title">
                <a class="shortvacancy__title__link" href="/vacancy/{@id}" title="{hh:name}">
                  <xsl:value-of select="hh:name"/>
                </a>
                <span class="fade">&#160;</span>
              </h3>
              <details>
                <xsl:apply-templates select="hh:employer"/>
              </details>
            </div>
          </td>
          <td>
            <span class="salary">
              <xsl:apply-templates select="hh:salary">
                <xsl:with-param name="break" select="true()"/>
              </xsl:apply-templates>
            </span>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:employer">
    <div class="shortvacancy__company">
      <xsl:choose>
        <xsl:when test="hh:link[@rel='alternate']">
          <a href="/employer/{@id}" class="shortvacancy__company__link" title="{hh:name}">
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
    <a href="/employer/{hh:employer/@id}" class="layout__padding">
      <xsl:apply-templates select="hh:employer/hh:logos/hh:link[@rel = 'small']"/>
    </a>
  </xsl:template>
  
  <xsl:template match="hh:logos/hh:link">
    <img src="{@href}"/>
  </xsl:template>
  
  <xsl:template match="median" mode="average">
    <span class="hint">
      <xsl:text>, средняя&#160;</xsl:text><span style="white-space:nowrap">з/п</span><xsl:text>&#160;</xsl:text>
      <xsl:value-of select="format-number(., '###&#160;###','number')"/>
      <xsl:text>&#160;р.</xsl:text>
    </span>
  </xsl:template>
  
</xsl:stylesheet>


