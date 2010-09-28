<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:jsx="http://jsx.ru/"
  xmlns:y="yandex:data"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh jsx y">
  
  <xsl:import href="../blocks/page.xsl"/>
  <xsl:import href="../blocks/strings.xsl"/>
  
  <xsl:output
    omit-xml-declaration="yes" method="xml" indent="no" encoding="UTF-8"
    media-type="text/html;" 
    doctype-public="html"/>
  
  
  <xsl:template match="doc" mode="title">
    Опубликовать вакансию на Я.ру
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
    <div class="margin">
      <form method="post">
        <input name="debug" type="hidden" value="true"/>
        <input name="id" type="hidden" value="{key('request', 'id')}"/>
        <input name="user" type="hidden" value="{y:person/y:id}"/>
        <input name="post" type="hidden" value="{y:person/y:link[@rel='posts']/@href}"/>
        <table class="layout">
          <tr>
            <td colspan="8">
              <article>
                <div class="layout__padding">
                  <h2 class="title m-title_margintop">Заголовок записи</h2>
                  <input name="title" class="yaru__input">
                    <xsl:attribute name="value">
                      <xsl:value-of select="hh:vacancy/hh:name"/>
                      <xsl:text>, </xsl:text>
                      <xsl:apply-templates select="hh:vacancy/hh:salary"/>
                      <xsl:text>, </xsl:text>
                      <xsl:value-of select="hh:vacancy/hh:employer/hh:name"/>
                    </xsl:attribute>
                  </input>
                </div>
                <div class="g-hidden layout__padding">
                  <textarea class="yaru__input" name="text">
                    <xsl:value-of select="hh:vacancy/hh:description"/>
                    <xsl:text>&lt;small&gt;</xsl:text>
                    <xsl:text>&lt;a style="color:#999" href="http://</xsl:text>
                    <xsl:value-of select="key('protocol','host')"/>
                    <xsl:text>/vacancy/</xsl:text>
                    <xsl:value-of select="key('request', 'id')"/>
                    <xsl:text>"&gt;вакансия с сайта hh.jsx.ru&lt;/a&gt;</xsl:text>
                    <xsl:text>&lt;/small&gt;</xsl:text>
                  </textarea>
                </div>
                <br/>
                <xsl:apply-templates select="hh:vacancy"/>
              </article>
            </td>
            <td colspan="3">
              <br/>
              <div class="layout__padding">
                <img src="{y:person/y:link[@rel='userpic']/@href}"/>
              </div>
              <div class="layout__padding">
                <xsl:value-of select="y:person/y:name"/>
              </div>
              <br/>
              <div class="layout__padding hint">
                Вы не можете поменять описание вакансии, потому что там содержится HTML разметка.
                <br/><br/>
                Если вы знаете что такое HTML разметка и как ее менять, то вы сможете поменять и описание вакансии
              </div>
            </td>
            <td>&#160;</td>
          </tr>
        </table>
      </form>
    </div>
  </xsl:template>
  
  <xsl:template match="hh:vacancy">
      <div class="layout__padding">
        <div class="description">
          <xsl:value-of select="hh:description" disable-output-escaping="yes"/>
        </div>
        <div style="margin-top:1em;">
          <xsl:apply-templates select="." mode="button">
            <xsl:with-param name="text" select="'Скопировать к себе в блог &#8594;'"/>
          </xsl:apply-templates>
        </div>
      </div>
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
  
</xsl:stylesheet>

