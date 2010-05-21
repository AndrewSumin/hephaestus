<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="header">
    <head>
      <title>
        <xsl:apply-templates select="." mode="title"/>
      </title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta name="description" content="hh.jsx.ru) позволяет верстальщикам найти работу в Москве" />
      <meta name="keywords" content="верстальщик, работе, вакансии, работа, поиск вакансий, резюме, работы, работу, работ, ищу работу, поиск, россия,  москва" />
      <link rel="stylesheet" type="text/css" charset="utf-8" href="{$shost}markup/pages/style.css" />
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
    <xsl:text>Работа в Москве для верстальщиков</xsl:text>
  </xsl:template>
  
</xsl:stylesheet>

