<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="header">
    <head>
      <title>
        <xsl:apply-templates select="." mode="title"/>
      </title>
      <meta charset="utf-8"/>
      <meta name="description">
        <xsl:apply-templates select="." mode="description"/>
      </meta>
      <meta name="keywords">
        <xsl:apply-templates select="." mode="keywords"/>
      </meta>
      <meta name="yandex-verification">
        <xsl:apply-templates select="." mode="yandex-verification"/>
      </meta>
      <meta name="google-site-verification">
        <xsl:apply-templates select="." mode="google-site-verification"/>
      </meta>
      <link rel="stylesheet" type="text/css" charset="utf-8" href="{$shost}markup/pages/style.css" />
      <xsl:apply-templates select="." mode="rss"/>
      <xsl:comment>
        <xsl:text>[if IE]&gt;</xsl:text>
        <xsl:text>&lt;script&gt;
        (function(){
          var e = 'abbr,article,aside,audio,bb,canvas,datagrid,datalist,details,dialog,eventsource,figure,footer,header,hgroup,mark,menu,meter,nav,output,progress,section,time,video'.split(',');
          for(var i = 0; i &lt; e.length; i++){
            document.createElement(e[i]);
          }
        })();
        &lt;/script&gt;</xsl:text>
        <xsl:text>&lt;![endif]</xsl:text>
      </xsl:comment>
    </head>
  </xsl:template>
  
  <xsl:template match="doc" mode="rss"/>
  <xsl:template match="doc" mode="title"/>
  <xsl:template match="doc" mode="description"/>
  <xsl:template match="doc" mode="keywords"/>
  <xsl:template match="doc" mode="yandex-verification"/>
  <xsl:template match="doc" mode="google-site-verification"/>

  <xsl:template match="doc[key('protocol', 'host') = 'sales.hh.ru']" mode="title">
    <xsl:text>Работа для продавцов , вакансии менеджера по продажам , продавец консультант , менеджер  по продажам  -  Работа на HeadHunter</xsl:text>
  </xsl:template>

  <xsl:template match="doc[key('protocol', 'host') = 'sales.hh.ru']" mode="description">
    <xsl:attribute name="content">
      <xsl:text>HeadHunter - это качественная база резюме и вакансий и лучшие сервисы для поиска работы и персонала.</xsl:text>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="doc[key('protocol', 'host') = 'sales.hh.ru']" mode="keywords">
    <xsl:attribute name="content">
      <xsl:text>менеджер  по продажам , продавец консультант , торговый представитель , работа для продавцов , работа продавцом , менеджер по работе с клиентами , менеджер  по работе  с клиентами , вакансия менеджер по продажам, вакансии менеджер  по продажам, менеджер по работе с ключевыми клиентами , директор отдела продаж</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[key('protocol', 'host') = 'sales.hh.ru']" mode="yandex-verification">
    <xsl:attribute name="content">
      <xsl:text>6f54c42a66b473e2</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[key('protocol', 'host') = 'sales.hh.ru']" mode="google-site-verification">
    <xsl:attribute name="content">
      <xsl:text>cN6ngoWjOVBZJLyyHK7efAJ7YeqMS3vKAgOFKZXy-D0</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[key('protocol', 'host') = 'med.hh.ru']" mode="title">
    <xsl:text>Работа для врачей, вакансии врачей, работа в области медицины – med.hh.ru</xsl:text>
  </xsl:template>
  
  <xsl:template match="doc[key('protocol', 'host') = 'med.hh.ru']" mode="description">
    <xsl:attribute name="content">
      <xsl:text>HeadHunter - это качественная база резюме и вакансий и лучшие сервисы для поиска работы и персонала. Работа в области медицины и фармацевтики.</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[key('protocol', 'host') = 'med.hh.ru']" mode="keywords">
    <xsl:attribute name="content">
      <xsl:text>работа для врачей, кваансии врачей, вакансии медсестер, вакансии медицина, работа для медиков, вакансии провизоров, вакансии ветеринарных врачей, работа для ветеринаров, вакансии доктора, вакансии ветеринаров, вакансии медработников, вакансии медиков, вакансии медицинских работников, работа в фармацевтике</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[key('protocol', 'host') = 'med.hh.ru']" mode="yandex-verification">
    <xsl:attribute name="content">
      <xsl:text>7240fac008e6e2c3</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[key('protocol', 'host') = 'med.hh.ru']" mode="google-site-verification">
    <xsl:attribute name="content">
      <xsl:text>cN6ngoWjOVBZJLyyHK7efAJ7YeqMS3vKAgOFKZXy-D0</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
</xsl:stylesheet>

