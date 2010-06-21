<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="search-form">
    <div class="searchform">
      <section class="margin">
        <form action="/search/">
          <table class="layout">
            <tr>
              <td colspan="5" class="searchform__item">
                <div class="layout__padding">
                  <input name="text" value="{key('request', 'text')}" class="searchform__input searchform__search"/>
                </div>
              </td>
              <td colspan="3" class="searchform__item">
                <div class="layout__padding searchform__salary">
                  зарплата&#160;
                  <input name="salary" value="{key('request', 'salary')}" class="searchform__input searchform__salaryinput"/>
                </div>
              </td>
              <td colspan="2" class="searchform__item">
                <div class="layout__padding">
                  <input type="submit" value="найти" class="searchform__input searchform__submitinput"/>
                </div>
              </td>
              <td colspan="2" class="searchform__item">
                <div class="layout__padding hint">
                  <label>
                    <span class="searchform__onlysalary">
                      <input type="checkbox" name="onlysalary" value="true">
                        <xsl:if test="key('request', 'onlysalary')='true'">
                          <xsl:attribute name="checked">checked</xsl:attribute>
                        </xsl:if>
                      </input>
                    </span>
                    <xsl:text>скрыть вакансии</xsl:text><br/><xsl:text> без указания з/п</xsl:text>
                  </label>
                </div>
              </td>
              
            </tr>
          </table>
        </form>
      </section>
    </div>
  </xsl:template>
  
</xsl:stylesheet>

