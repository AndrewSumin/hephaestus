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
  
  
  <xsl:template match="doc[not(hh:vacancy)]" mode="title">
    Вакансия
  </xsl:template>
  
  <xsl:template match="doc" mode="title">
    Вакансия <xsl:value-of select="hh:vacancy/hh:name"/>, <xsl:value-of select="hh:vacancy/hh:employer/hh:name"/>
  </xsl:template>  
  
  <xsl:template match="doc[not(hh:vacancy)]" mode="page-title-text">
    &#160;
  </xsl:template>
  
  <xsl:template match="doc[not(hh:vacancy)]" mode="body">
    <section class="margin">
      <div class="layout__padding">
        Извините, произошла ошибка. Возможно этой вакансии не существует.<br/>
        Если вы уверены, что это существующюя вакансия, попробуйте <a href="">перезагрузить страницу</a> позже.
      </div>
    </section>
  </xsl:template>
  
  <xsl:template match="doc" mode="body">
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
              <xsl:apply-templates select="." mode="button">
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
        <a target="_blank" class="yaru" href="http://my.ya.ru/posts_add_link.xml?URL=http://{key('protocol', 'host')}/vacancy/{@id}&amp;title={hh:name}, {hh:employer/hh:name}" title="Поделиться на я.ру">
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
  
</xsl:stylesheet>

