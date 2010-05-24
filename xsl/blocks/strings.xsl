<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:func="http://exslt.org/functions"
  xmlns:jsx="http://jsx.ru/"
  extension-element-prefixes="func jsx">
  
  <func:function name="jsx:lowercase">
    <xsl:param name="string"/>
    <func:result select="translate($string,'ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ','abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя')"/>
  </func:function>

  <func:function name="jsx:uppercase">
    <xsl:param name="string"/>
    <func:result select="translate($string,'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщъыьэюя','ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ')"/>
  </func:function>

</xsl:stylesheet>
