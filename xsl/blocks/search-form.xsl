<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="search-form">
    <div class="searchform">
      <section class="margin">
        <form action="/search/">
          <xsl:apply-templates select="$params[@name != 'salary' and @name != 'text' and @name != 'page']" mode="search-form"/>
          <table class="layout">
            <tr>
              <td colspan="5" class="searchform__item">
                <div class="layout__padding searchform__hint">
                  Должность
                </div>
              </td>
              <td class="searchform__item">
                &#160;
              </td>
              <td colspan="2" class="searchform__item">
                <div class="layout__padding searchform__hint">
                  Зарплата,&#160;руб
                </div>
              </td>
              <td colspan="4" class="searchform__item">
                &#160;
              </td>
            </tr>
            <tr>
              <td colspan="5" class="searchform__item">
                <div class="layout__padding">
                  <input name="text" value="{key('request', 'text')}" class="searchform__input searchform__search"/>
                </div>
              </td>
              <td class="searchform__item">
                &#160;
              </td>
              <td colspan="2" class="searchform__item">
                <div class="layout__padding searchform__salary">
                  <input name="salary" value="{key('request', 'salary')}" class="searchform__input searchform__salaryinput"/>
                </div>
              </td>
              <td colspan="4" class="searchform__item">
                <div class="layout__padding">
                  <input type="submit" value="найти" class="searchform__input searchform__submitinput"/>
                </div>
              </td>
            </tr>
          </table>
        </form>
      </section>
    </div>
  </xsl:template>
  
  <xsl:template match="param" mode="search-form">
    <input type='hidden' name="{@name}" value="{.}"/>
  </xsl:template>
  
</xsl:stylesheet>

