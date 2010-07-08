<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:hh="http://hh.ru/api" exclude-result-prefixes="hh">

  <xsl:import href="../global/all.xsl"/>
  <xsl:import href="../blocks/salary.xsl"/>

  <xsl:output
  omit-xml-declaration="yes" method="xml" indent="yes" encoding="UTF-8"
  media-type="text/xml;"/>

<!--
  <rss xmlns:hhjsx="urn:hhjsx" version="2.0"> 
    <channel> 
      <link>http://blogs.yandex.ru/search.xml</link> 
      <title>hh.ru</title> 
      <image> 
        <url>http://img.yandex.net/i/logo100x43.png</url> 
        <title>Поиск Яндекса по блогам</title> 
        <link>http://blogs.yandex.ru/search.xml</link> 
        <width>100</width> 
        <height>43</height> 
      </image> 
      <ttl>60</ttl> 
      <generator>blogs.yandex.ru</generator> 
      <webMaster>support@blogs.yandex.ru</webMaster> 
      <copyright>noindex</copyright> 
      <description>Результаты поиска Яндекса по блогам</description> 
      <hhjsx:count>702</hhjsx:count> 
      <item> 
        <author>http://hh.ru/</author> 
        <title>причины увольнения - исследование НН</title> 
        <pubDate>Wed, 30 Jun 2010 19:19:50 GMT</pubDate> 
        <guid isPermaLink="false">ya.ru:39074622:60</guid> 
        <link>http://jk-moscow.ya.ru/replies.xml?item_no=60</link> 
        <description>Служба исследований.</description> 
      </item>
    </channel>
  </rss>
-->  
  
  <xsl:template match="doc">
    <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom"> 
      <channel> 
        <atom:link rel="self" type="application/rss+xml">
          <xsl:attribute name="href">http://<xsl:value-of select="key('protocol', 'host')"/>/rss/search<xsl:if test="key('protocol', 'query') != ''">?</xsl:if><xsl:value-of select="key('protocol', 'query')"/></xsl:attribute>
        </atom:link>
        <link>http://<xsl:value-of select="key('protocol', 'host')"/>/search/<xsl:if test="key('protocol', 'query') != ''">?</xsl:if><xsl:value-of select="key('protocol', 'query')"/></link> 
        <title>
          <xsl:text>Вакансии верстальщиков в Москве</xsl:text>
          <xsl:if test="key('request', 'text')"> по запросу «<xsl:value-of select="key('request', 'text')"/>»</xsl:if>
        </title> 
        <ttl>60</ttl> 
        <generator><xsl:value-of select="key('protocol', 'host')"/></generator> 
        <webMaster>AndrewSumin@gmail.com (Andrew Sumin)</webMaster> 
        <copyright>Andrew Sumin</copyright>
        <description>
          <xsl:text>Результаты поиска вакансий верстальщиков в Москве</xsl:text>
          <xsl:if test="key('request', 'text')"> по запросу «<xsl:value-of select="key('request', 'text')"/>»</xsl:if>
        </description> 
        <xsl:apply-templates select="search/hh:result/hh:vacancies/hh:vacancy"/>
      </channel>
    </rss>
  </xsl:template>
  
  <xsl:template match="hh:vacancy">
    <item> 
      <title>
        <xsl:value-of select="hh:name"/>
        <xsl:text>, </xsl:text>
        <xsl:apply-templates select="hh:salary" mode="notags"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="hh:employer/hh:name"/>
      </title> 
      <pubDate><xsl:value-of select="hh:update"/></pubDate> 
      <guid isPermaLink="false"><xsl:value-of select="key('protocol', 'host')"/>:vacancy:<xsl:value-of select="@id"/></guid> 
      <link>http://<xsl:value-of select="key('protocol', 'host')"/>/vacancy/<xsl:value-of select="@id"/></link> 
    </item>
  </xsl:template>

</xsl:stylesheet>

