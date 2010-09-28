<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:jsx="http://jsx.ru/"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh jsx">

<xsl:import href="blocks/page.xsl"/>
<xsl:import href="blocks/strings.xsl"/>

<xsl:output
  omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
  media-type="text/html;" 
  doctype-public="html"/>
  
  
  <xsl:template match="doc" mode="title">
    Вакансия, <xsl:value-of select="hh:vacancy/hh:name"/>, <xsl:value-of select="hh:vacancy/hh:employer/hh:name"/>
  </xsl:template>  
  
  <xsl:template match="doc[not(hh:vacancy)]" mode="page-title-text">
    &#160;
  </xsl:template>
  
  <xsl:template match="doc[not(hh:vacancy)]" mode="body">
    <section class="margin">
      <div class="layout__padding">
        <br/>
        Извините, произошла ошибка. Возможно этой вакансии не существует.<br/>
        Если вы уверены, что это существующюя вакансия, попробуйте <a href="">перезагрузить страницу</a> позже.
      </div>
    </section>
  </xsl:template>
  
  <xsl:template match="doc" mode="body">
    <xsl:apply-templates select="." mode="yaru_info"/>
    <article class="margin">
      <h1 class="layout__padding title m-title_margintop">
        <strong><xsl:value-of select="hh:vacancy/hh:name"/></strong>
        <br/>
        <xsl:apply-templates select="hh:vacancy/hh:salary"/>
      </h1>
      <xsl:apply-templates select="hh:vacancy"/>
    </article>
  </xsl:template>
  
  <xsl:template match="hh:vacancy">
    <table class="layout">
      <tr>
        <td colspan="8">
          <div class="layout__padding">
            <div class="description">
              <xsl:value-of select="hh:description" disable-output-escaping="yes"/>
            </div>
            <div style="margin-top:1em;">
              <xsl:apply-templates select="." mode="button-href">
                <xsl:with-param name="url" select="concat('http://hh.ru/applicant/vacancyResponse.do?vacancyId=', @id)"/>
                <xsl:with-param name="text" select="'Откликнуться на hh.ru &#8594;'"/>
              </xsl:apply-templates>
            </div>
          </div>
        </td>
        <td colspan="4">
          <div class="layout__padding">
            <xsl:apply-templates select="hh:employer[hh:logos/hh:link[@rel='medium']]" mode="logo"/>
            <xsl:apply-templates select="hh:employer[not(hh:logos/hh:link[@rel='medium'])]" mode="name"/>
            <xsl:apply-templates select="hh:update"/>
            <xsl:apply-templates select="hh:address[hh:metro]"/>
            <xsl:apply-templates select="hh:experience"/>
            <xsl:apply-templates select="hh:schedule"/>
            <xsl:apply-templates select="hh:employment"/>
            <xsl:apply-templates select="." mode="social"/>
          </div>
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="hh:employer" mode="logo">
    <div class="vacancy__value" style="margin-bottom:1em">
      <a href="/employer/{@id}">
        <img src="{hh:logos/hh:link[@rel='medium']/@href}"/>
      </a>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:employer" mode="name">
    <div class="vacancy__value">
      <a href="{hh:link[@rel = 'alternate']/@href}">
        <xsl:value-of select="hh:name"/>
      </a>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:update">
    <div class="vacancy__label">дата публикации</div>
    <div class="vacancy__value">
      <xsl:apply-templates select="." mode="full"/>
    </div>
  </xsl:template>

  <xsl:template match="hh:address">
    <div class="vacancy__label">метро</div>
    <div class="vacancy__value">
      <xsl:apply-templates select="hh:metro"/>
    </div>
  </xsl:template>
  

  <xsl:template match="hh:vacancy" mode="salary">
    <div class="vacancy__label">зарплата</div>
    <div class="vacancy__value">
      <xsl:apply-templates select="hh:salary"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:experience">
    <div class="vacancy__label">опыт</div>
    <div class="vacancy__value">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:schedule">
    <div class="vacancy__label">график</div>
    <div class="vacancy__value">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="hh:employment">
    <div class="vacancy__label">занятость</div>
    <div class="vacancy__value">
      <xsl:value-of select="jsx:lowercase(.)"/>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:vacancy" mode="social">
    <div class="vacancy__label">рассказать друзьям</div>
    <div class="vacancy__value" style="margin-top:.3em;">
      <style>.vacancy__value .ya-share .share-button{margin:0}</style>
      <a counter="yes" type="button" size="large" name="ya-share" style="float:left; margin-right:.3em">&#160;</a>
      <xsl:text> или </xsl:text>
      <xsl:apply-templates select="." mode="yaru"/>
      <script charset="utf-8" type="text/javascript">
        <![CDATA[
          if (!(!window.Ya || !window.Ya.Share)) {
            Ya.Share.update();
          }else{
            (function(){
              if(!window.Ya){
                window.Ya = {}
              };
              Ya.STATIC_BASE = 'http:\/\/img\-css.friends.yandex.net';
              Ya.START_BASE = 'http:\/\/wow.ya.ru\/';
              var shareScript = document.createElement("script");
              shareScript.type = "text/javascript";
              shareScript.async = "true";
              shareScript.charset = "utf-8";
              shareScript.src = Ya.STATIC_BASE + "/js/api/Share.js";
              (document.getElementsByTagName("head")[0] || document.body).appendChild(shareScript);
            })();
          }
        ]]>
      </script>
    </div>
    <div class="vacancy__value">
      <script type="text/javascript" src="http://vkontakte.ru/js/api/share.js?5" charset="windows-1251">&#160;</script>
      <script type="text/javascript">
          document.write(VK.Share.button(false,{type: "round", text: "Сохранить"}));
      </script>
    </div>
    <div class="vacancy__value">
      <script>
        function fbs_click() {
          var u=location.href;
          var t=document.title;
          window.open('http://www.facebook.com/sharer.php?u='+encodeURIComponent(u)+'&amp;t='+encodeURIComponent(t),'sharer','toolbar=0,status=0,width=626,height=436');
          return false;
        }
      </script>
      <div style="overflow:hidden">
        <a class="livejournal" title="в жж" href="http://www.livejournal.com/update.bml?subject={hh:name}&amp;event=&lt;a href=&#34;http://{key('protocol', 'host')}/vacancy/{@id}&#34;&gt;{hh:name}, {hh:employer/hh:name}&lt;/a&gt;" target="_blank">
          &#160;
        </a>
        <a target="_blank" class="facebook" onclick="return fbs_click()" href="http://www.facebook.com/share.php?u=http://{key('protocol', 'host')}/vacancy/{@id}" title="Поделиться на facebook">
          &#160;
        </a>
        <a class="twitter" title="в твиттер" href="http://twitter.com/home/?status=http://{key('protocol', 'host')}/vacancy/{@id} {hh:name}, {hh:employer/hh:name}" target="_blank">
          &#160;
        </a>
      </div>
    </div>
    
  </xsl:template>
  <xsl:template match="hh:vacancy[key('cookie', 'yaru_token')]" mode="yaru">
    <a href="/yaru/vacancy?id={@id}" class="notvisited n1owrap">опубликовать у себя</a>
  </xsl:template>
  <xsl:template match="hh:vacancy" mode="yaru">
    <a href="/yaru/gettoken?vacancy={@id}" class="notvisited n1owrap">авторизоваться и опубликовать у себя</a>
  </xsl:template>
  
  <xsl:template match="doc" mode="yaru_info"/>
  <xsl:template match="doc[key('request', 'yaru_post')]" mode="yaru_info">
    <div class="tiser m-tiser_goodnews">
      <div class="margin layout__padding">
        Вы успешно опубликовали вакансию <a href="{key('request', 'yaru_post')}">у себя</a>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="doc[key('request', 'yaru_error')]" mode="yaru_info">
    <div class="tiser m-tiser_badnews">
      <div class="margin layout__padding">
        Не удалось опубликовать вакансию, попробуйте позже
      </div>
    </div>
  </xsl:template>
  <xsl:template match="doc[key('request', 'yaru_denied')]" mode="yaru_info">
    <div class="tiser m-tiser_normalnews">
      <div class="margin layout__padding">
        Вы отказались публиковать вакансию
      </div>
    </div>
  </xsl:template>
  

</xsl:stylesheet>

