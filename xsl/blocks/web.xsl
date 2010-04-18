<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="web">
    <!--xsl:apply-templates select="." mode="web-ex"/-->
    <div class="margin web" style="height:1000px;displa1y:none;">
      <table class="layout">
        <tbody>
          <tr>
            <td class="layout__column" style="background:red">&#160;</td>
            <td class="layout__column" style="background:blue">&#160;</td>
            <td class="layout__column" style="background:red">&#160;</td>
            <td class="layout__column" style="background:blue">&#160;</td>
            <td class="layout__column" style="background:red">&#160;</td>
            <td class="layout__column" style="background:blue">&#160;</td>
            <td class="layout__column" style="background:red">&#160;</td>
            <td class="layout__column" style="background:blue">&#160;</td>
            <td class="layout__column" style="background:red">&#160;</td>
            <td class="layout__column" style="background:blue">&#160;</td>
            <td class="layout__column" style="background:red">&#160;</td>
            <td class="layout__column" style="background:blue">&#160;</td>
          </tr>
        </tbody>
      </table>
    </div>
  </xsl:template>
  
  <xsl:template match="doc" mode="web-ex">
    <div class="l web">
      <div class="l__margin" style="background:yellow">&#160;</div>
      <div class="l__column" style="background:red">&#160;</div>
      <div class="l__column">&#160;</div>
      <div class="l__column" style="background:red">&#160;</div>
      <div class="l__column">&#160;</div>
      <div class="l__column" style="background:red">&#160;</div>
      <div class="l__column">&#160;</div>
      <div class="l__column" style="background:red">&#160;</div>
      <div class="l__column">&#160;</div>
      <div class="l__column" style="background:red">&#160;</div>
      <div class="l__column">&#160;</div>
      <div class="l__column" style="background:red">&#160;</div>
      <div class="l__column">&#160;</div>
      <div class="l__margin" style="background:yellow">&#160;</div>
    </div>
    <hr/>
    <table class="l web" style="top:310px;">
      <tbody>
        <tr>
          <td class="l__margin" style="background:yellow">&#160;</td>
          <td class="l__column" style="background:red">&#160;</td>
          <td class="l__column">&#160;</td>
          <td class="l__column" style="background:red">&#160;</td>
          <td class="l__column">&#160;</td>
          <td class="l__column" style="background:red">&#160;</td>
          <td class="l__column">&#160;</td>
          <td class="l__column" style="background:red">&#160;</td>
          <td class="l__column">&#160;</td>
          <td class="l__column" style="background:red">&#160;</td>
          <td class="l__column">&#160;</td>
          <td class="l__column" style="background:red">&#160;</td>
          <td class="l__column">&#160;</td>
          <td class="l__margin" style="background:yellow">&#160;</td>
        </tr>
      </tbody>
    </table>
  </xsl:template>
  
</xsl:stylesheet>

