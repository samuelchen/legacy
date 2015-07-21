title: '>Spring MVC 中的国际化的message.properties该如何配置？'
tags:
  - Config
  - Java
id: 7
categories:
  - 未分类
date: 2004-07-29 07:23:00
---

>ResourceBundle [messages] not found for MessageSource: Can't find bundle for base name messages, locale zh_CN。

为了解决这个，我复制了一个message_zh_CN.properties，但是无论是放在message.properties相同的class目录下，还是放在class/i18n/ 下都仍然是这个警告。

该如何解决呢？

已解决，漏了s
<span style="font-weight: bold;">message<span style="color: rgb(255, 0, 0);">s</span></span> is not <span style="font-weight: bold;">message</span>.
I've missed the letter 's'.  :(![](http://samuel.cnblogs.com/aggbug/28297.html)