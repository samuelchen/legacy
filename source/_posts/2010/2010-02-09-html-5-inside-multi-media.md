title: '>HTML 5 Inside – Multi Media 多媒体'
tags:
  - Articles
  - HTML5
  - Programming
  - Web2.0
id: 116
categories:
  - 未分类
date: 2010-02-09 20:47:00
---

> 本文基于 [HTM5 标准草案 2009年8月25日版](http://www.w3.org/TR/2009/WD-html5-20090825/ "W3C Working Draft 25 August 2009")       
> 转载请保留出处：[http://SamuelChen.net](http://SamuelChen.net)

在以前的猫（modem）年代，人们挣扎在以几或者几十 bit 与 byte 来计量的传输速率上。在那个时候，几乎所有的内容都是基于文字的，电子邮件、新闻组、BBS甚至网页。不像现在，我们可以在网页中放入众多的图片、视频甚至游戏，那时候人们常常使用字符阵来组成图像，表达略微丰富一点的内容（在BBS最常见）。即使是这样，都让人欣喜不已。

随着带宽的不断提高，那么何时我们可以在页面中加入图片了呢？我找到了这篇文章 - “[Why do we have an IMG element?](http://diveintomark.org/archives/2009/11/02/why-do-we-have-an-img-element)”。这篇文章记述了 img 标签的来由， img 元素是在1993年的时候才被提议加入HTML的。

今天，在HTML5中，加入了两个新的元素 video 和 audio ，用于视频和音频的呈现，更加的丰富了媒体内容的表达。

那么我也问一下，为什么我们要有 video 和 audio 元素？

首先，带宽的提高，使得视频、音频的在线观看已经很方便。

其次，目前web页面中用以播放视频和音频的主要手段是嵌入第三方插件，坏处显而易见，无论是安全性或者是性能，都不如浏览器原生支持的好。

因此，我们需要在HTML5中引入新的元素来原生支持更多的媒体内容。

#### video 元素 

video 元素是用来在页面中呈现一段视频或者电影的元素。如果浏览器不支持该元素，那么就不应将该元素呈现给用户。

video 元素在内容模型中，同时属于Flow content, Phrase content 和 Embeded content。很好理解，因为它引入其他的资源，所以是Embeded；而Embeded 包含于Phrase，Phrase又包含于Flow。或者这么理解，由于它参与布局（有至少一个text或者embeded子节点），所以是Flow content；它有内容（有至少一个text或者embeded子节点），所以是Phrase content。

如果video包含了**control**属性，那么它是一个Interactive content。同样很好理解，因为有了控制面板，所以可以交互。

下面以一个例子来说明. 

Avatar - Film Clip 

<script src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.0.6-development-only.js"></script>
<script language="javascript">
  if (Modernizr.video) {
    document.write("<video id="avatar" videowidth=320 videoheight=240 controls src="http://www.youtube.com/get_video?video_id=CXF-VZVdR2Y&t=vjVQa1PpcFOgfEMPW684qS5mePzQgVa3Oo4l0YQnvSc%3D&fmt=18 " poster="http://farm3.static.flickr.com/2779/4202108032_3a261b7370.jpg"></video>");
  } else {
    document.write("_浏览器不支持video标签。| Your browser does not support video element._");
  }
</script>

代码如下： 

<pre class="lang:default decode:true " >&lt;video id="avatar" width =320 height=240
  src="http://www.youtube.com/get_video?video_id=CXF-VZVdR2Y&amp;amp;t=vjVQa1PpcFOgfEMPW684qS5mePzQgVa3Oo4l0YQnvSc%3D&amp;amp;fmt=18"  
  controls  autobuffer autoplay loop
  poster="http://farm3.static.flickr.com/2779/4202108032_3a261b7370.jpg"
/&gt;</pre>

与大多数元素一样，video 也可以使用id来定义唯一标识，width和height来定义宽高，以及其他的全局属性（Global attributes），就不再赘述。

代码中第2、3行的几个属性是媒体元素（media element）的通用属性，也就是说，audio也有这几个属性。

与img元素一样，video也是用**src** 属性来用以标识媒体源，其值是一个URL字符串。指定该属性后，浏览器在渲染时就会用原生播放器载入该视频。要注意的是，img不属于媒体内容，因此它的src与这个src本质上是有区别的。

另外的四个标签都是布尔型，分别用来获取或设置播放器的行为，其作用如下：

*   **controls **设置是否显示播放界面，使得用户可以进行播放、暂停、随机浏览或者全屏等操作。标准中提到的这些功能用的是“应该（should）”，那么这些功能就不是必须的，具体的功能和外观依赖于浏览器的实现。*   **autoplay** 设置是否自动播放。当含有此属性时，播放器会在载入呈现之后立即尝试播放指定的媒体资源。*   **autobuffer** 设置是否自动缓存。当含有此属性时，意味着页面制作者提示浏览器（或客户程序）该媒体内容极有可能被用户播放，播放器需要在载入呈现之后开始下载媒体资源并缓存，但并不立即播放。如果video元素同时含有该属性与autoplay属性，该属性必须被忽略，但这不认为是一个错误。*   **loop** 设置是否循环播放。如果该属性被指定，则意味着提示播放器需要在该媒体播放至结尾后重新从头开始播放。

第4行的 **poster** 属性是video的特有属性，用来标识该媒体资源的海报（静态画面，一般来说是显示视频中第一个非空白帧）。如果指定了该属性，那么当媒体内容无效时，会显示指定的图片。该属性值是一个指向图片的URL。经过测试，在没有被缓存或者播放的情况下（内容没有载入时），都会显示该图片。

另外，video 元素还有两个特有的属性 **videowidth** 和 **videoheight** 。这两个属性是只读的，分别用来获取视频固有解析度的宽和高，如果未知则返回0。

#### audio 元素

audio 元素用来在页面中呈现一段音频或音乐。由于同样属于媒体元素，audio具有和video类似的内容模型和属性。与 video 不同的是，audio 是没有 width, height, poster 以及 videowidth 和 videoheight 的。很容易理解，audio 是没有视觉内容的，所以这些和显示有关的属性都没有。

看一个例子：

富士山下 - 陈奕迅 

<script language="javascript">
  if (Modernizr.audio) { 
    document.write("<audio id="mp3" autoplay loop autobuffer controls src="http://event1.wanmei.com/cb/response/upload/audio/witouch/1190691011788.mp3"></audio>");
  } else {
    document.write("_浏览器不支持aideo标签。| Your browser does not support aideo element._");
    }
</script>

<pre class="lang:default decode:true " >&lt;audio id="mp3" 
  src="http://event1.wanmei.com/cb/response/upload/audio/witouch/1190691011788.mp3"  
  controls  autobuffer loop autoplay
/&gt;</pre>

#### source 元素

source 元素是个比较特殊的元素，它是用来指定媒体元素的源信息的，换句话来说就是用以替代 audio 或者 video （或者如果有其他 media element ）中的 src 属性的，它比 src 属性提供了更为丰富的源信息。

source 元素可以为媒体元素指定多个资源，但它本身并不会有任何表现形式。该元素一般作为一个媒体元素的子元素，但也可以独立存在，在标准中并没有提到这一点。当它独立存在时，可以利用DOM和脚本来使用它。

source 元素不属于任何内容模型，它具有 **src**, **type** 和 **media** 这些特有属性。

*   src 属性和 video, audio 的一样，是资源的有效URL，要注意的是，在 source 元素中，src是必须要有的。*   type 属性是用来指定资源类型的，其值应为有效的MIME类型字符串，例如 ”video/mp4” 等，从而帮助播放器判断要播放的媒体内容的类型。该属性有一个参数 **codecs** ，用来指定特定媒体编码解码器，例如 “mp4.v.20.8, mp4a.20.2” 。*   media 属性不是 source 元素特有的属性，也可以用于 link 等元素，它被用来指定一条 MQ （media query）。MQ是用来限定媒体使用的设备以及显示相关等范围的表达式，具体内容请参看 [Mozilla Dev Center](https://developer.mozilla.org/En/CSS/Media_queries) 。

参考示例（该示例来源于Mozilla 网站）

<pre class="lang:default decode:true " >&lt;video controls&gt;  
  &lt;source src="foo.ogg" type="video/ogg"&gt; &lt;!-- Picked by Firefox --&gt;  
  &lt;source src="foo.mov" type="video/quicktime"&gt; &lt;!-- Picked by Safari --&gt;  
  I'm sorry; your browser doesn't support HTML 5 video.  
&lt;/video&gt;  
</pre>

#### Media 元素（DOM）

Media Elements 实际上是 DOM 中这些媒体元素的基类型，audio 和 video 都可以看做是其子类型（但具体的情况要看浏览器的实现）。 src, autobuffer, autoplay, loop 以及 controls 这些个属性都是其共有的。

Media Elements 定义了一个接口，包括各种状态、常量、属性和方法，同时还定义了各种类型的事件，使得大家可以在脚本中很容易的操作。标准定义很长，请参看 [W3C HTML5 - Media Element](http://www.w3.org/TR/html5/video.html#media-elements) ，如果以后有相关的深入研究再写，现在用一个视频播放器的小例子来介绍其主要用法。

![](http://public.blu.livefilestore.com/y1pv9e7KpoL1D8LWu_zrqutD4NkQecbs2UIYz1S7draT-9mj3iY2C5I1t4h5od--v7rFzkh09YVWxY9sQcyaFa0sQ/download.png) HTML5 Media Elements sample - Simple Video Player

#### 安全和隐私

由于 video 和 audio 的资源可以来自其他网站，因此主要的安全与隐私上的考虑和影响是跨站攻击。这是浏览器实现要考虑的问题，就不再赘述。