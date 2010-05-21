<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:import href="../global/all.xsl"/>
  
  <xsl:import href="head.xsl"/>
  <xsl:import href="header.xsl"/>
  <xsl:import href="footer.xsl"/>
  <xsl:import href="web.xsl"/>
  <xsl:import href="compensation.xsl"/>
  <xsl:import href="search-form.xsl"/>
  <xsl:import href="button.xsl"/>
  
  <xsl:template match="doc" mode="page">
    <html>
      <xsl:apply-templates select="." mode="header"/>
      <body>
        <xsl:apply-templates select="." mode="web"/>
        <xsl:apply-templates select="." mode="head"/>
        <xsl:apply-templates select="." mode="body"/>
        <xsl:apply-templates select="." mode="foot"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="doc" mode="body"/>
  
</xsl:stylesheet>

