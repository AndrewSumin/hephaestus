<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="doc" mode="foot">
    <footer class="foot">
      <div class="margin">
        <table class="layout">
          <tr>
            <td colspan="8">
              <span class="layout__paddingleft foot_text">Данные предоставлены сайтом </span>
              <a href="http://hh.ru">HeadHunter</a>
            </td>
            <td colspan="4">
              <span class="layout__paddingleft foot_text">&#169; </span>
              <a href="http://hh.ru">Алла Савченко</a>
            </td>
          </tr>
        </table>
      </div>
    </footer>
    
    <xsl:apply-templates select="." mode="counters"/>
    
  </xsl:template>
  
  <xsl:template match="doc" mode="counters"/>
    
  <xsl:template match="doc[key('protocol', 'host') = 'sales.hh.ru']" mode="counters">
    <!-- Yandex.Metrika -->
    <script src="//mc.yandex.ru/metrika/watch.js" type="text/javascript">&#160;</script>
    <div style="display:none;">
      <script type="text/javascript">
        try { var yaCounter1153836 = new Ya.Metrika(1153836); } catch(e){}
      </script>
    </div>
    <noscript>
      <div style="position:absolute"><img src="//mc.yandex.ru/watch/1153836" alt=""/>&#160;</div>
    </noscript>
    <!-- /Yandex.Metrika -->
    
    <div class="margin">
      <div class="layout__padding">
        <!--LiveInternet counter-->
        <script type="text/javascript">
            document.write('<img src="http://counter.yadro.ru/hit;HeadHunter?r' +
            escape(document.referrer) +((typeof (screen) == 'undefined')? '':
            ';s' + screen.width + '*' + screen.height + '*' +(screen.colorDepth?
            screen.colorDepth: screen.pixelDepth)) + ';u' + escape(document.URL) +
            ';i' + escape('Жж' + document.title.substring(0, 80)) + ';' + Math.random() +
            '" width="1" height="1" alt=""></img>')
        </script>
        <!--/LiveInternet-->
        
        <!--LiveInternet logo-->
        <a href="http://www.liveinternet.ru/click" target="_blank">
          <img src="http://counter.yadro.ru/logo?14.1" border="0"
            title="LiveInternet: показано число посетителей за сегодня" alt="" width="88"
            height="31"/>
        </a>
        <!--/LiveInternet-->
        
        <!-- begin of Top100 logo -->
        <a href="http://top100.rambler.ru/home?id=644963">
          <img src="http://top100-images.rambler.ru/top100/banner-88x31-rambler-gray2.gif"
            alt="Rambler's Top100" width="88" height="31" border="0"/>
        </a>
        <!-- end of Top100 logo -->
        
        <!--begin of Rambler's Top100 code -->
        <a href="http://top100.rambler.ru/top100/">
          <img src="http://counter.rambler.ru/top100.cnt?644963" alt="" width="1" height="1"
            border="0"/>
        </a>
        <!--end of Top100 code-->
        
        <!--Rating@Mail.ru COUNTER-->
        <script type="text/javascript">
          var a = 'r=' + escape(document.referrer) + ';j=' + navigator.javaEnabled();
          var s = screen;
          
          a += ';s=' + s.width + '*' + s.height + ';d=' +(s.colorDepth? s.colorDepth: s.pixelDepth);
          
          document.write('<a href="http://top.mail.ru/jump?from=310372" target="_top"><img src="http://top.list.ru/counter' +
          '?id=310372;t=49;js=13;' + a + ';rand=' + Math.random() +
          '" alt="Рейтинг@Mail.ru" border="0" height="31" width="88"/></a>');
        </script>
        <noscript>
          <a target="_top" href="http://top.mail.ru/jump?from=310372">
            <img src="http://top.list.ru/counter?js=na;id=310372;t=49" border="0" height="31"
              width="88" alt="Рейтинг@Mail.ru"/>
          </a>
        </noscript>
        <!--/COUNTER-->
        
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
