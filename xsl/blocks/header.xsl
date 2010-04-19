<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="header">
    <head>
      <title>
        <xsl:apply-templates select="." mode="title"/>
      </title>
      <meta charset="utf-8"/>
      <link rel="stylesheet" type="text/css" charset="utf-8" href="{$shost}markup/pages/style.css" />
      <script type="text/javascript" src="{$shost}js/jsx/jsx.js">
        <xsl:text>return {autoinit:true, base:'sizzle', build:'develop'}</xsl:text>
      </script>
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
    <xsl:text> </xsl:text>
  </xsl:template>
  
</xsl:stylesheet>

