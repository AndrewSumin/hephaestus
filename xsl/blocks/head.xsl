<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="doc" mode="header">
    <head>
      <title>
        <xsl:apply-templates select="." mode="title"/>
      </title>
      <meta charset="utf-8"/>
      <meta name="description">
        <xsl:apply-templates select="." mode="description"/>
      </meta>
      <meta name="keywords">
        <xsl:apply-templates select="." mode="keywords"/>
      </meta>
      <meta name="yandex-verification">
        <xsl:apply-templates select="." mode="yandex-verification"/>
      </meta>
      <meta name="google-site-verification">
        <xsl:apply-templates select="." mode="google-site-verification"/>
      </meta>
      <link rel="stylesheet" type="text/css" charset="utf-8" href="{$shost}markup/pages/style.css" />
      <xsl:apply-templates select="." mode="rss"/>
      <xsl:comment>
        <xsl:text>[if IE]&gt;</xsl:text>
        <xsl:text>&lt;script&gt;
        (function(){
          var e = 'abbr,article,aside,audio,bb,canvas,datagrid,datalist,details,dialog,eventsource,figure,footer,header,hgroup,mark,menu,meter,nav,output,progress,section,time,video'.split(',');
          for(var i = 0; i &lt; e.length; i++){
            document.createElement(e[i]);
          }
        })();
        &lt;/script&gt;</xsl:text>
        <xsl:text>&lt;![endif]</xsl:text>
      </xsl:comment>
    </head>
  </xsl:template>
  
  <xsl:template match="doc" mode="rss"/>
  <xsl:template match="doc" mode="title"/>
  <xsl:template match="doc" mode="description"/>
  <xsl:template match="doc" mode="keywords"/>
  <xsl:template match="doc" mode="yandex-verification"/>
  <xsl:template match="doc" mode="google-site-verification"/>

  <xsl:template match="doc[contains(key('protocol', 'host'), 'sales')]" mode="title">
    <xsl:text>Работа для продавцов , вакансии менеджера по продажам , продавец консультант , менеджер  по продажам  -  Работа на HeadHunter</xsl:text>
  </xsl:template>

  <xsl:template match="doc[contains(key('protocol', 'host'), 'sales')]" mode="description">
    <xsl:attribute name="content">
      <xsl:text>HeadHunter - это качественная база резюме и вакансий и лучшие сервисы для поиска работы и персонала.</xsl:text>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="doc[contains(key('protocol', 'host'), 'sales')]" mode="keywords">
    <xsl:attribute name="content">
      <xsl:text>менеджер  по продажам , продавец консультант , торговый представитель , работа для продавцов , работа продавцом , менеджер по работе с клиентами , менеджер  по работе  с клиентами , вакансия менеджер по продажам, вакансии менеджер  по продажам, менеджер по работе с ключевыми клиентами , директор отдела продаж</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'sales')]" mode="yandex-verification">
    <xsl:attribute name="content">
      <xsl:text>6f54c42a66b473e2</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'sales')]" mode="google-site-verification">
    <xsl:attribute name="content">
      <xsl:text>cN6ngoWjOVBZJLyyHK7efAJ7YeqMS3vKAgOFKZXy-D0</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'med')]" mode="title">
    <xsl:text>Работа для врачей, вакансии врачей, работа в области медицины – med.hh.ru</xsl:text>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'med')]" mode="description">
    <xsl:attribute name="content">
      <xsl:text>HeadHunter - это качественная база резюме и вакансий и лучшие сервисы для поиска работы и персонала. Работа в области медицины и фармацевтики.</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'med')]" mode="keywords">
    <xsl:attribute name="content">
      <xsl:text>работа для врачей, кваансии врачей, вакансии медсестер, вакансии медицина, работа для медиков, вакансии провизоров, вакансии ветеринарных врачей, работа для ветеринаров, вакансии доктора, вакансии ветеринаров, вакансии медработников, вакансии медиков, вакансии медицинских работников, работа в фармацевтике</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'med')]" mode="yandex-verification">
    <xsl:attribute name="content">
      <xsl:text>7240fac008e6e2c3</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'med')]" mode="google-site-verification">
    <xsl:attribute name="content">
      <xsl:text>cN6ngoWjOVBZJLyyHK7efAJ7YeqMS3vKAgOFKZXy-D0</xsl:text>
    </xsl:attribute>
  </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'neftegaz')]" mode="title">
      <xsl:text>Работа в нефтегазовой отрасли, вакансии нефтяника, работа в энергетике, работа в нефтяных компаниях - neftegaz.hh.ru</xsl:text>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'neftegaz')]" mode="description">
      <xsl:attribute name="content">
        <xsl:text>Поиск работы в области нефтегазовой отрасли, энергетической промышленности.</xsl:text>
      </xsl:attribute>
    </xsl:template>
  
    <xsl:template match="doc[contains(key('protocol', 'host'), 'neftegaz')]" mode="keywords">
      <xsl:attribute name="content">
        <xsl:text>работа газпром, работа в энергетике, работа геодезистом, работа лукойл, работа бурильщиком, работа геологом, работа в нефтяных компаниях, работа нефтегазовая отрасль, работа в нефтегазовой отрасли, работа в металлургии, работа в нефтяной промышленности, работа горным инженером, работа норильский никель, работа горным мастером, работа в энергетической компании, работа в нефтегазовой промышленности, работа  русал, работа в атомной энергетике, работа атомэнергопроект, работа инженером по бурению, атомредметзолото вакансии, работа в атомстройэкспорт, работа в энергетической отрасли, работа в атомной отрасли</xsl:text>
      </xsl:attribute>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'neftegaz')]" mode="yandex-verification">
      <xsl:attribute name="content">
        <xsl:text>5069f0c74789d1cd</xsl:text>
      </xsl:attribute>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'neftegaz')]" mode="google-site-verification">
      <xsl:attribute name="content">
        <xsl:text> </xsl:text>
      </xsl:attribute>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'stroi')]" mode="title">
      <xsl:text>Работа для строителей, работа в области строительства, работа для прорабов, вакансии архитекторов – stroi.hh.ru</xsl:text>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'stroi')]" mode="description">
      <xsl:attribute name="content">
        <xsl:text>Поиск работы в области строительства.  HeadHunter - это качественная база резюме и вакансий и лучшие сервисы для поиска работы.</xsl:text>
      </xsl:attribute>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'stroi')]" mode="keywords">
      <xsl:attribute name="content">
        <xsl:text>работа сварщиком, работа электриком, работа монтажником, работа архитектором, работа прорабом, работа риэлтором, работа электромонтажником, работа инженером-проектировщиком, работа инженером-конструктором, работа инженером-строителем, работа главным инженером, работа дизайнером интерьера, работа инженером в строительстве, работа архитектором-дизайнером, работа инженером по эксплуатации зданий, работа директором по строительству, работа главным архитектором, работа сметчиком в строительстве, работа в девелоперской компании, работа начальником участка в строительстве, работа инженером пто в строительстве, работа инженером технического надзора, работа проектировщиком в строительстве, работа конструктором в строительстве, работа инженером по эксплуатации в строительстве</xsl:text>
      </xsl:attribute>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'stroi')]" mode="yandex-verification">
      <xsl:attribute name="content">
        <xsl:text>6a44b807f0183ee7</xsl:text>
      </xsl:attribute>
    </xsl:template>

    <xsl:template match="doc[contains(key('protocol', 'host'), 'stroi')]" mode="google-site-verification">
      <xsl:attribute name="content">
        <xsl:text> </xsl:text>
      </xsl:attribute>
    </xsl:template>

  <xsl:template match="doc[contains(key('protocol', 'host'), 'engineer')]" mode="title">
    <xsl:text>Работа для инженеров, Вакансии инженеров, Поиск работы для инженеров – engineer.hh.ru  </xsl:text>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'engineer')]" mode="description">
    <xsl:attribute name="content">
      <xsl:text>Работа для инженеров.  HeadHunter - это качественная база резюме и вакансий и лучшие сервисы для поиска работы.</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'engineer')]" mode="keywords">
    <xsl:attribute name="content">
      <xsl:text>работа инженером, работа инженер, работа для инженера, работа главного инженера, работа инженер строитель, работа инженер технолог, работа инженер сметчик, вакансии инженера, вакансии инженер Москва, вакансии работа инженер, вакансия главный инженер, найти работу инженера, работа инженер проектировщик, работа инженер конструктор</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'engineer')]" mode="yandex-verification">
    <xsl:attribute name="content">
      <xsl:text>5fda28a1f13278f8</xsl:text>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="doc[contains(key('protocol', 'host'), 'engineer')]" mode="google-site-verification">
    <xsl:attribute name="content">
      <xsl:text> </xsl:text>
    </xsl:attribute>
  </xsl:template>
  

</xsl:stylesheet>

