<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="*" mode="button">
    <xsl:param name="text"/>
    <div class="button__block">
      <span class="button m-button_green">
        <input type="submit" value="{$text}"/>
      </span>
    </div>
  </xsl:template>
  

  <xsl:template match="*" mode="button-href">
    <xsl:param name="url"/>
    <xsl:param name="text"/>
    <div class="button__block">
      <span class="button m-button_green">
        <a href="{$url}">
          <xsl:value-of select="$text"/>
        </a>
      </span>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
