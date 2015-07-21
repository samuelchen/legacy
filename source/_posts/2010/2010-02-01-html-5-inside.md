title: '>HTML 5 Inside - 深入HTML 5'
tags:
  - Articles
  - HTML5
  - Programming
  - Web2.0
id: 114
categories:
  - 未分类
date: 2010-02-01 14:47:00
---

>

&#160;
  > 本文基于 [HTM5 标准草案 2009年8月25日版](http://www.w3.org/TR/2009/WD-html5-20090825/ "W3C Working Draft 25 August 2009") 以及 [HTML5与HTML4的不同 2009年8月25日版](http://www.w3.org/TR/2009/WD-html5-diff-20090825/ "W3C Working Draft 25 August 2009") 。       
> 转载请保留出处：[http://SamuelChen.net](http://SamuelChen.net)  

HTML 5 的概念始于2003年，在2004年初期行成其第一个只包括form相关的一些内容的草案，并于同年被提请加入到W3C以探讨互联网应用的未来。显然，这么初步的提案是要被拒的，不过这也引起了很多公司的关注。不久之后，Apple、Mozilla 以及 Opera 都声明愿意继续在这个提案的基础之上进行进一步的研究工作，并将该提案转移到了WHATWG，同时建立了一个正式的公共邮件列表用以讨论。 直到2006年，W3C 才表示了对该提案的兴趣，并于2007年建立专项工作组和WHATWG共同工作。至此，所有的工作组才共同合作发展HTML5。 

有人说，HTML5是改变Web开发的新起点，它增加了如此多的让人期待的特性，使得富浏览器端应用不再让人头疼；而也有人说，HTML 5 是W3C 平衡商业利益向WHATWG低头的产物，只是对HTML4进行了些许改进，没有好的设计与规划，只是一个劲的往里塞特性，实质上是一种倒退。

商业巨头们的战争，咱们小家寡民也甭咸吃罗卜淡操心，无论如何，HTML5是一个有着很大变化的新标准，其特性从实用层面上来看，也是非常不错的。

HTML 5 草案形成有一段时间了，同时也有很多的浏览器支持了，很多特性基本上已经定型，更多的只是在细节上变化。因此，在这儿更加详细和深入的研究它，并计划写一个系列记录及分享心得。

名字就叫 html 5 inside 了，至于能不能真正做到 inside 咱慢慢来吧，学而时习之，边学边写。

先来道开胃菜，大家看看这些应用和例子，相信能坚定大家看好HTML5的决心：

*   [基于 webkit 的 video player （其实webkit的内容和播放视频无关）](http://jilion.com/sublime/video)*   [HTML5 canvas examples](http://www.phpguru.org/static/html5-canvas-examples) 这个里面有很多例子，还有很炫的游戏！*   [厉害的来了！ HTML+JS+SVG 的 Flash runtime !](http://paulirish.com/work/gordon/demos/)    

索引 （可能会修改）

1.  HTML 5 Inside – Overview 总览2.  HTML 5 Inside – Interative 交互3.  HTML 5 Inside – Canvas 画布4.  HTML 5 Inside – Multi Media 多媒体5.  HTML 5 Inside – Map 地图6.  HTML 5 Inside – Local Storage/Offline Cache 本地存储/离线缓存7.  HTML 5 Inside – Web Socket 页面上的套接字8.  HTML 5 Inside – Work Thread 工作线程9.  HTML 5 Inside – Messaging 消息10.  HTML 5 Inside – Drag &amp; Drop 拖拽11.  HTML 5 Inside – Copy &amp; Paste 复制粘贴12.  HTML 5 Inside – Dialog, Progress UI增强13.  HTML 5 Inside – DOM 文档对象结构14.  HTML 5 Inside – DataGrid 数据表格  

&#160;

Resources:

*   [Drive Into HTML 5](http://diveintohtml5.org/) – Mark Filgrim*   [Lachlan Hunt](http://lachy.id.au/) – W3C member*   [More on developing naming conventions, Microformats and HTML5](http://forabeautifulweb.com/blog/about/more_on_developing_naming_conventions_microformats_and_html5/)*   [A Preview of HTML 5](http://www.alistapart.com/articles/previewofhtml5 "A early preview of HTML 5, Dec 2007") – Lachlan Hunt*   [Semantics in HTML 5](http://www.alistapart.com/articles/semanticsinhtml5) – John Allsopp*   [Preparing for HTML5 with Semantic Class Names](http://jontangerine.com/log/2008/03/preparing-for-html5-with-semantic-class-names)*   [HTML 5 Tag Reference](http://www.w3schools.com/html5/html5_reference.asp) – W3C Shool*   [HTML 5 Validator](http://validator.w3.org/) – W3C*   [HTML5 and the future of the Web](http://www.smashingmagazine.com/2009/07/16/html5-and-the-future-of-the-web/)