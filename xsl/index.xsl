<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:jsx="http://jsx.ru" xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

<xsl:import href="blocks/page.xsl"/>
<xsl:import href="blocks/average.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  <xsl:template match="doc" mode="menu">
    <h4 class="layout__padding head__title"><xsl:value-of select="h4"/></h4>
    <div class="layout__padding">
      <h1 class="head_subtitle"><xsl:value-of select="h1"/></h1>
      <span class="head_subtitle">&#160;&#183;&#160;</span>
      <h2 class="head_subtitle"><xsl:value-of select="h2"/></h2>
      <span class="head_subtitle">&#160;&#183;&#160;</span>
      <h3 class="head_subtitle"><xsl:value-of select="h3"/></h3>
    </div>
  </xsl:template>
  
  <xsl:template match="doc" mode="body">
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
        <xsl:apply-templates select="." mode="seo-text"/>
      </div>
    </section>
    
  </xsl:template>
  
  <xsl:template match="tab">
    <td colspan="4">
      <div class="layout__paddingright">
        <div class="layout__padding shortvacancy__list">
          <div class="shortvacancy__header">
            <h2>
              <a class="shortvacancy__header__link">
                <xsl:attribute name="href">
                  <xsl:text>/search/?text=</xsl:text>
                  <xsl:value-of select="text"/>
                  <xsl:if test="salary">
                    <xsl:text>&amp;salary=</xsl:text>
                    <xsl:value-of select="salary"/>
                  </xsl:if>
                  <xsl:if test="onlysalary">
                    <xsl:text>&amp;onlysalary=</xsl:text>
                    <xsl:value-of select="onlysalary"/>
                  </xsl:if>
                  <xsl:if test="specialization">
                    <xsl:text>&amp;specialization=</xsl:text>
                    <xsl:value-of select="specialization"/>
                  </xsl:if>
                </xsl:attribute>
                <xsl:value-of select="name"/>
              </a>
            </h2>
            <div class="shortvacancy__subheader">
              <xsl:apply-templates select="last/hh:result/hh:found"/>
              <xsl:apply-templates select="median" mode="average"/>
            </div>
          </div>
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
        <div class="layout__paddingright">
          <h3 class="shortvacancy__title">
            <a class="shortvacancy__title__link" href="/vacancy/{@id}" title="{hh:name}">
              <xsl:value-of select="hh:name"/>
            </a>
          </h3>
          <div class="salary shortvacancy__salary">
            <xsl:apply-templates select="hh:salary">
              <xsl:with-param name="break" select="true()"/>
            </xsl:apply-templates>
          </div>
          <details>
            <xsl:apply-templates select="hh:employer"/>
          </details>
        </div>
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

  <xsl:template match="doc" mode="seo-text"/>

  <xsl:template match="doc[key('protocol', 'host') = 'sales.hh.ru']" mode="seo-text">
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
  </xsl:template>
  <xsl:template match="doc[key('protocol', 'host') = 'med.hh.ru']" mode="seo-text">
    <p>
      Работа для медиков найдется всегда. Вот только находится она не сама — нужно потратить уйму времени и сил, просматривая различные работные сайты, формулируя условия поиска, отсеивая из всего потока предложений только вакансии врачей или, например, только вакансии провизоров. Все это превращает поиск любимой работы в мучение.
    </p>
    <p>
      Вас интересует исключительно работа для врачей? Тогда вам сюда! На нашем сайте вы узнаете, какие свежие вакансии медицина приберегла для вас. И не важно, спасаете ли вы людей или братьев наших меньших, — на сайте med.hh.ru найдутся как вакансии доктора, так и вакансии ветеринарных врачей.
    </p>
    <p>
      Работа для врачей, работа для ветеринаров, вакансии медсестер — все это на специализированном сайте med.hh.ru!
    </p>
  </xsl:template>
</xsl:stylesheet>


