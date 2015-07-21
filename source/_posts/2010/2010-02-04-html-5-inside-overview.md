title: '>HTML 5 Inside – Overview 总览'
tags:
  - Architect
  - HTML5
  - Programming
  - Web2.0
id: 115
categories:
  - 未分类
date: 2010-02-04 15:33:00
---

>> 本文基于 [HTM5 标准草案 2009年8月25日版](http://www.w3.org/TR/2009/WD-html5-20090825/ "W3C Working Draft 25 August 2009")       
> 转载请保留出处：[http://SamuelChen.net](http://samuelchen.net/)HTML5并不是一个全新的语言，它只是在HTML4的基础上进行进化，去掉了一些内容修饰的tag，增加了许多新的特性。我们可以简单的认为 HTML5&nbsp; = HTML4 - legacy features + colletion of new features
HTML5 有一个很重要的改变，那就是强化了语义。更多的标签引入带来了更加丰富的语义，使得爬虫、解析程序对页面的理解可以更加贴近人的理解。
下面从各个方面来说说。

#### 兼容性
我们常说某某浏览器支持或者不支持HTML5，其实这个并不是一个严谨的说法。事实上，HTML只是一种标记性语言，它是被浏览器解析并渲染显示的，所以并不存在HTML5支持不支持，而应该是HTML5中某一元素是否能被浏览器支持。

由于HTML5是由HTML4发展而来，很多旧有的元素本身就能支持，因此，HTML5是兼容HTML4的，我们更多的是说某浏览器引擎是否支持HTML5中的某一特性。

<div align="center">[![comparison_of_layout_engines_(HTML5)_element](http://public.blu.livefilestore.com/y1pSxh3SnB20bc9Y5MT2Hvo3KnzUQ0KqhEXbapXOcQvULDbCgKON1nU3Gm8jjpQhiH1lXDMZprcjAi_hkyjsOsifg/comparison_of_layout_engines_(HTML5)_element.PNG "comparison_of_layout_engines_(HTML5)_element")](http://www.w3.org/TR/2009/WD-html5-20090825/images/content-venn.svg)&nbsp;_各浏览器引擎对元素的支持，来自 _[_Comparison of layout engines (HTML5)_](http://en.wikipedia.org/wiki/Comparison_of_layout_engines_(HTML5))_ - Wikipedia_</div>
那么自然而然就有一个问题，如何去判断一个浏览器是否支持某一个特性？我们可以通过创建一个元素是否成功来判断，比如创建函数supports_canvas() 用来判断是否支持canvas :

<pre style="background-color: #ffffe1; border-bottom: #cecece 1px solid; border-left: #cecece 1px solid; border-right: #cecece 1px solid; border-top: #cecece 1px solid; height: 90px; min-height: 40px; overflow: auto; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; padding-top: 5px; width: 479px;"></pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">1:   <span style="color: blue;">function</span> supports_canvas() {
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">2:     <span style="color: blue;">return</span> !!<span style="color: blue;">document</span>.createElement('canvas').getContext;
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">3:   }
</pre>
然后调用这个函数来判断是否支持canvas :

<pre style="background-color: #ffffe1; border-bottom: #cecece 1px solid; border-left: #cecece 1px solid; border-right: #cecece 1px solid; border-top: #cecece 1px solid; height: 101px; min-height: 40px; overflow: auto; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; padding-top: 5px; width: 481px;"></pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">1: <span style="color: blue;">if</span> (supports_canvas()) {
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">2:   <span style="color: blue;">document</span>.write("<span style="color: darkred;">Your browser supports canvas.</span>");
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">3: } <span style="color: blue;">else</span> {
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">4:   <span style="color: blue;">document</span>.write("<span style="color: darkred;">Your browser does not support canvas.</span>");
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">5: }</pre>
结果如图所示, Chrome4 支持 IE6 不支持:

[![supports_canvas](http://public.blu.livefilestore.com/y1pd3KcG7Qrxssahr-ILMHpQobwiJYBNhsDahOAD7XuczlSUiY_YsfEOEmlDgnluKlkB8XjMysyJQgf6sChLxoNbA/supports_canvas.png "supports_canvas")](http://public.blu.livefilestore.com/y1pd3KcG7Qrxssahr-ILMHpQobwiJYBNhsDahOAD7XuczlSUiY_YsfEOEmlDgnluKlkB8XjMysyJQgf6sChLxoNbA/supports_canvas.png) 

有人将所有类似的函数封装成了一个库 [Modernizr](http://www.modernizr.com/) ，你可以直接使用 Modernizr.canvastext, Modernizr.video, modernizr.video.h264 等方式来判断是否支持指定的特性。

<span class="Apple-style-span" style="font-weight: bold;">内容模型（Content Models）</span>

HTML5采用了一种新的内容模型用以替代HTML4中block和inline的概念。

HTML5 中，所有的元素（Elements）都属于（拥有）某一个定义好的内容模型，这个内容模型描述了这个元素中可以包含哪些节点。

任何一个元素都归于0或多个内容分类，以便将具有相似特性的元素归组。HTML5标准中的内容分类有如下几种（某些元素也会归于其他分类）：

![content-venn](http://public.blu.livefilestore.com/y1p6w5JEpN-ATekKTZVbycQZYkz1bLO-3XQLi-lT4QHdlU7Y7w1Ax3rtOObRJN6YLnJUzfnIIer9urEhoN9Tf3rXQ/contentvenn.png "content-venn")

*   Metadata content*   Flow content*   Sectioning content*   Heading content*   Phrasing content*   Embedded content*   Interactive content这些分类之间的关系如图所示。

Metadata content 表示该内容用于设定内容的呈现、行为、文档（document）之间的关系或者传递外界信息（converys “out-of-band” information），基本上可以理解为元素的元数据。

base, command, link, meta, noscript, script, style, title 这些元素、属性或者标签都属于Metadata Content.

非HTML命名空间下的元素，如果它的语义主要是元数据相关的（metadata-related），那么它也是属于metadata content。比如引入第三方的namespace来支持RDF，那么此时就认为这个是属于 metadata content。如代码中所示:

<pre style="background-color: #ffffe1; border-bottom: #cecece 1px solid; border-left: #cecece 1px solid; border-right: #cecece 1px solid; border-top: #cecece 1px solid; height: 208px; min-height: 40px; overflow: auto; padding-bottom: 5px; padding-left: 5px; padding-right: 5px; padding-top: 5px; width: 496px;"></pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">1: <span style="color: blue;">&lt;</span><span style="color: maroon;">html</span> <span style="color: red;">xmlns</span>=<span style="color: blue;">"http://www.w3.org/1999/xhtml"</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">2:       <span style="color: red;">xmlns</span>:<span style="color: red;">r</span>=<span style="color: blue;">"http://www.w3.org/1999/02/22-rdf-syntax-ns#"</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">3:  <span style="color: blue;">&lt;</span><span style="color: maroon;">head</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">4:   <span style="color: blue;">&lt;</span><span style="color: maroon;">title</span><span style="color: blue;">&gt;</span>Hedral's Home Page<span style="color: blue;">&lt;/</span><span style="color: maroon;">title</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">5:   <span style="color: blue;">&lt;</span><span style="color: mediumvioletred;">r</span>:<span style="color: maroon;">RDF</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">6:    <span style="color: blue;">&lt;</span><span style="color: maroon;">Person</span> <span style="color: red;">xmlns</span>=<span style="color: blue;">"http://www.w3.org/2000/10/swap/pim/contact#"</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">7:            <span style="color: red;">r</span>:<span style="color: red;">about</span>=<span style="color: blue;">"http://hedral.example.com/#"</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">8:     <span style="color: blue;">&lt;</span><span style="color: maroon;">fullName</span><span style="color: blue;">&gt;</span>Cat Hedral<span style="color: blue;">&lt;/</span><span style="color: maroon;">fullName</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">9:     <span style="color: blue;">&lt;</span><span style="color: maroon;">mailbox</span> <span style="color: red;">r</span>:<span style="color: red;">resource</span>=<span style="color: blue;">"mailto:hedral@damowmow.com"</span><span style="color: blue;">/&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">10:     <span style="color: blue;">&lt;</span><span style="color: maroon;">personalTitle</span><span style="color: blue;">&gt;</span>Sir<span style="color: blue;">&lt;/</span><span style="color: maroon;">personalTitle</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">11:    <span style="color: blue;">&lt;/</span><span style="color: maroon;">Person</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">12:   <span style="color: blue;">&lt;/</span><span style="color: mediumvioletred;">r</span>:<span style="color: maroon;">RDF</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">13:  <span style="color: blue;">&lt;/</span><span style="color: maroon;">head</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">14:  <span style="color: blue;">&lt;</span><span style="color: maroon;">body</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">15:   <span style="color: blue;">&lt;</span><span style="color: maroon;">h1</span><span style="color: blue;">&gt;</span>My home page<span style="color: blue;">&lt;/</span><span style="color: maroon;">h1</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">16:   <span style="color: blue;">&lt;</span><span style="color: maroon;">p</span><span style="color: blue;">&gt;</span>This is my home page.<span style="color: blue;">&lt;/</span><span style="color: maroon;">p</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">17:  <span style="color: blue;">&lt;/</span><span style="color: maroon;">body</span><span style="color: blue;">&gt;</span>
</pre><pre style="background-color: #ffffe1; font-family: consolas,'Courier New',courier,monospace; font-size: 12px; margin: 0em; width: 100%;">18: <span style="color: blue;">&lt;/</span><span style="color: maroon;">html</span><span style="color: blue;">&gt;</span></pre>
其他几个Content就不一一解释了，看着图加上顾名思义，都比较容易理解。请参考文档 [Content Model on Spec](http://www.w3.org/TR/2009/WD-html5-20090825/dom.html#content-models) 。

#### 文档结构
HTML5 引入了多个新的元素用来更加细致的描述页面、文档结构，这些元素包括 header, nav, section, article, aside, footer ，用以替代目前的使用 div 或者 table 的方式。使用这些元素，作者可以让文档页面更加具有语义，更加易读，也可以让搜索引擎更好的理解页面的内容和各个部分之间的关系，应用API也能更容易、更准确细微的访问文档对象。

如下图（来自于[smashing magzine](http://www.smashingmagazine.com/2009/07/16/html5-and-the-future-of-the-web/)）所示，非常清晰的表述了各个元素对应的文档内容关系。注意，这些元素并不包含布局信息。

[![html5_structure](http://public.blu.livefilestore.com/y1pV-nIx56QfrfrZZ5S2i1HZOxD3Q67cwFvQEwAu505CW3MQe2UVjw4uauJl1VS_o0oJwUJp8niWAkTGFzZ21l6aQ/html5_structure.png "html5_structure")](http://public.blu.livefilestore.com/y1pV-nIx56QfrfrZZ5S2i1HZOxD3Q67cwFvQEwAu505CW3MQe2UVjw4uauJl1VS_o0oJwUJp8niWAkTGFzZ21l6aQ/html5_structure.png) 

<span class="Apple-style-span" style="font-weight: bold;">其他变化</span>

HTML5基本上是基于DOM的使用来定义该语言的，而HTML4和之前的版本是基于显示与布局的，所以我们在使用时要注意，出发点的不同会造成开发模式侧重点的不同。

沙箱，iframe的不同。HTML5中的iframe除了保留原有的嵌入网页的功能外，还增加了一个沙箱（sandbox）的新功能。这个沙箱功能使得在iframe中载入的网页能受到一系列限制，从而可以增加安全性和稳定性。使用这个功能，需要在iframe元素中使用”sandbox” 属性（attribut）。

可访问性的增强。增加了一些内建提高访问性（accessibility）的属性（比如hidden）、元素（比如progress）。

交互性增强。增加了命令（command）、菜单（menu）、拖拽（Drag &amp; Drop）、撤销管理（Undo Manager）以及复制粘贴（Copy &amp;&nbsp; Paiste）等元素、属性或特性。

其他的一些变化，请参考spec，如果有时间会在后面的章节中介绍。

HTML5 标准中增强了对于作者（author）和用户代理（user agent）的描述，我将根据不同的上下文，将 author 称为作者、开发人员或者其他，将 user agent 称为客户程序、浏览器、搜索引擎、播放器（浏览器中）或者其他。