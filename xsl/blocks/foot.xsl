<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="foot">
    <footer class="foot">
      <div class="margin">
        <table class="layout">
          <tr>
            <td colspan="8">
              <span class="layout__paddingleft">Данные предоставлены сайтом </span><a href="http://hh.ru">HeadHunter</a>
            </td>
            <td colspan="4">
              <span class="layout__paddingleft">&#169; </span><!--a href="http://jsx.ru">Андрей Сумин</a-->
            </td>
          </tr>
        </table>
      </div>
    </footer>
  </xsl:template>
  
</xsl:stylesheet>
