<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="header">
    <head>
      <title>
        <xsl:apply-templates select="." mode="title"/>
      </title>
      <meta charset="utf-8"/>
      <meta name="description" content="HeadHunter - это качественная база резюме и вакансий и лучшие сервисы для поиска работы и персонала." />
      <meta name="keywords" content="менеджер  по продажам , продавец консультант , торговый представитель , работа для продавцов , работа продавцом , менеджер по работе с клиентами , менеджер  по работе  с клиентами , вакансия менеджер по продажам, вакансии менеджер  по продажам, менеджер по работе с ключевыми клиентами , директор отдела продаж" />
      <meta name="yandex-verification" content="6f54c42a66b473e2"/>
      <meta name="google-site-verification" content="cN6ngoWjOVBZJLyyHK7efAJ7YeqMS3vKAgOFKZXy-D0" />
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
  
  <xsl:template match="doc" mode="title">
    <xsl:text>Работа для продавцов , вакансии менеджера по продажам , продавец консультант , менеджер  по продажам  -  Работа на HeadHunter</xsl:text>
  </xsl:template>
  
  <xsl:template match="doc" mode="rss"/>
  
</xsl:stylesheet>

