<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:func="http://exslt.org/functions"
  xmlns:ya="urn:yandex-functions"
  extension-element-prefixes="func ya">
  
  
  <!--func:function name="ya:bla">
    <xsl:param name="date"/>
    <func:result select="concat(substring($date, 0, 20), substring($date, 24, 3), ':', substring($date, 27, 2))"/>
    </func:function-->
  
  <xsl:decimal-format name="conversion" grouping-separator="&#160;" decimal-separator="," NaN="0" pattern-separator="*"/>
  
  <!-- Склонение слов -->
  <xsl:template match="*" mode="conversion">
    
    <xsl:param name="num" select="1"/>
    
    <!-- Читай: "один .." -->
    <xsl:param name="one" select="''"/>
    
    <!-- "пятнадцать .." -->
    <xsl:param name="some" select="''"/>
    
    <!-- "сто два" -->
    <xsl:param name="many" select="''"/>
    
    <!-- нулевой результат -->
    <xsl:param name="zero" select="''"/>
    
    <!-- выводить с числом -->
    <xsl:param name="with-num" select="true()"/>
    
    <!-- Определение дробного числа -->
    
    <xsl:variable name="is-fractional-number" select="not(round($num) = $num)"/>
    
    <xsl:choose>
      <xsl:when test="$num = 0 or $num = ''">
        <xsl:value-of select="$zero"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="num-mod-10" select="$num mod 10"/>
        <xsl:variable name="num-mod-100" select="$num mod 100"/>
        
        <xsl:if test="$with-num">
          <xsl:value-of select="format-number($num, '###&#160;###', 'conversion')"/>
          <xsl:text>&#160;</xsl:text>
        </xsl:if>
        
        <xsl:choose>
          <xsl:when test="$is-fractional-number">
            <xsl:value-of select="$many"/>
          </xsl:when>
          <xsl:when test="($num-mod-100 &gt;= 5) and ($num-mod-100 &lt;= 20)">
            <xsl:value-of select="$some"/>
          </xsl:when>
          <xsl:when test="$num-mod-10 = 1">
            <xsl:value-of select="$one"/>
          </xsl:when>
          <xsl:when test="($num-mod-10 &gt;= 2) and ($num-mod-10 &lt;= 4)">
            <xsl:value-of select="$many"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$some"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
