<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="/" mode="pager">
    <xsl:param name="total"/>
    <xsl:param name="interval"/>
    <xsl:param name="current"/>
    <xsl:param name="href"/>
    <xsl:if test="$total &gt; 1">
      <xsl:variable name="_total">
        <xsl:value-of select="$total - 1"/>
      </xsl:variable>
      <xsl:variable name="halfinterval">
        <xsl:value-of select="floor($interval div 2)"/>
      </xsl:variable>

      <xsl:variable name="startinteval">
        <xsl:choose>
          <xsl:when test="($interval &gt; $_total) or ($current - $halfinterval &lt;= 0)">0</xsl:when>
          <xsl:when test="$current + $halfinterval &gt; $_total">
            <xsl:value-of select="$_total - $interval"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$current - $halfinterval"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>

      <xsl:variable name="endinteval">
        <xsl:choose>
          <xsl:when test="($interval &gt; $total) or ($current + $halfinterval &gt; $_total)">
            <xsl:value-of select="$_total"/>
          </xsl:when>
          <xsl:when test="$current - $halfinterval &lt; 0">
            <xsl:value-of select="$interval - 1"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$current + $halfinterval"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <ul>
        <xsl:if test="0 != $startinteval">
          <li>
            <xsl:choose>
              <xsl:when test="1 = $startinteval">
                <xsl:apply-templates select="/" mode="pager-item-link">
                  <xsl:with-param name="href">
                    <xsl:value-of select="$href"/><xsl:value-of select="0"/>
                  </xsl:with-param>
                  <xsl:with-param name="item" select="1"/>
                </xsl:apply-templates>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="/" mode="pager-item-link">
                  <xsl:with-param name="href">
                    <xsl:choose>
                      <xsl:when test="0 &lt; $startinteval - $halfinterval">
                        <xsl:value-of select="$href"/><xsl:value-of select="$startinteval - $halfinterval"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$href"/><xsl:value-of select="0"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:with-param>
                  <xsl:with-param name="item">...</xsl:with-param>
                </xsl:apply-templates>
              </xsl:otherwise>
            </xsl:choose>
          </li>
        </xsl:if>

        <xsl:apply-templates select="/" mode="pager-item">
          <xsl:with-param name="item" select="$startinteval"/>
          <xsl:with-param name="current" select="$current"/>
          <xsl:with-param name="end" select="$endinteval"/>
          <xsl:with-param name="href" select="$href"/>
        </xsl:apply-templates>
        <xsl:if test="$_total != $endinteval">
          <li>
            <xsl:choose>
              <xsl:when test="$_total = $endinteval + 1">
                <xsl:apply-templates select="/" mode="pager-item-link">
                  <xsl:with-param name="href">
                    <xsl:value-of select="$href"/><xsl:value-of select="$_total"/>
                  </xsl:with-param>
                  <xsl:with-param name="item" select="$total"/>
                </xsl:apply-templates>
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="/" mode="pager-item-link">
                  <xsl:with-param name="href">
                    <xsl:choose>
                      <xsl:when test="$_total &gt; $endinteval + $halfinterval">
                        <xsl:value-of select="$href"/><xsl:value-of select="$endinteval + $halfinterval"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="$href"/><xsl:value-of select="$_total"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:with-param>
                  <xsl:with-param name="item">...</xsl:with-param>
                </xsl:apply-templates>
              </xsl:otherwise>
            </xsl:choose>
          </li>
        </xsl:if>
      </ul>

    </xsl:if>
  </xsl:template>

  <xsl:template match="/" mode="pager-item">
    <xsl:param name="item"/>
    <xsl:param name="current"/>
    <xsl:param name="end"/>
    <xsl:param name="href"/>
    <xsl:if test="$item &lt;= $end">
      <li>
        <xsl:choose>
          <xsl:when test="$item = $current">
            <xsl:value-of select="$item + 1"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="/" mode="pager-item-link">
              <xsl:with-param name="href">
                <xsl:value-of select="$href"/><xsl:value-of select="$item"/>
              </xsl:with-param>
              <xsl:with-param name="item" select="$item + 1"/>
            </xsl:apply-templates>
          </xsl:otherwise>
        </xsl:choose>
      </li>
      <xsl:apply-templates select="/" mode="pager-item">
        <xsl:with-param name="item" select="$item + 1"/>
        <xsl:with-param name="current" select="$current"/>
        <xsl:with-param name="end" select="$end"/>
        <xsl:with-param name="href" select="$href"/>
      </xsl:apply-templates>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/" mode="pager-item-link">
    <xsl:param name="href"/>
    <xsl:param name="item"/>
    <a href="{$href}">
      <xsl:value-of select="$item"/>
    </a>
  </xsl:template>
</xsl:stylesheet>