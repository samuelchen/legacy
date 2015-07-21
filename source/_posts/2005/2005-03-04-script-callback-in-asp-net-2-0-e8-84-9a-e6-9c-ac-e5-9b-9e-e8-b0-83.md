title: '>Script Callback in ASP.NET 2.0 (脚本回调)'
tags:
  - Articles
  - Microsoft
  - Programming
  - Web2.0
id: 24
categories:
  - 未分类
date: 2005-03-04 07:27:00
---

>

*   原作者：Dino Esposito
*   出处：codeguru
*   http://www.codeguru.com/columns/Experts/article.php/c9321/
*   发表时间：2005-2-28 于 alphatom.com （此站点已关闭）
*   翻译：Samuel Chen (http://SamuelChen.Net)
让我们面对这个事实吧：Web开发人员愿意付出一切来换取一种可以让他们避免页面刷新的开发工具。想想这个常见的情景：你在一个ASP.NET页面上添加了一个grid控件(control)用来显示用户导航栏。每当用户为了显示几行新的数据而点击时，页面将回传(postback)服务器，由服务器处理后又原封不动地重现(除了grid控件(control)中的几行新数据)。这个过程导致了严重的性能问题，尤其是对于复杂的大页面。开发者们不禁要问：为什么每次处理用户事件都非要下载50Kb的内容(而且还得上传其中的相当一部分同样多次)？

  不用回传(postback)整个页面就能上传客户端数据是web开发者们一个期待已久的梦想。理想情况下，他们应该能触发客户端代码调用服务器来处理事件，并用返回的数据仅仅更新页面中受影响的部分。

  ASP.NET 1.x 以及传统的 ASP 都可以实现这个功能，但开发人员必须使用ActiveX控件(ActiveX control)或者至少是Java小程序(Java applet)来做中介(intermediary)。这种中介(intermediary)的作用是接收客户端脚本的调用，并建立一个并行而不被用户察觉的连接到某个服务器页面。服务器页面根据接收到的输入产生相应输出。输出经连接返回到客户端，客户端便可通过DHTML对象模型(Dynamic HTML object model)来更新页面显示。

  ASP.NET 2.0 抽象了建立服务器连接并解析返回数据的逻辑。ASP.NET 2.0中的脚本回调(script callback)提供了一种成熟而立即可用的机制，从而大大简化了上面的过程。更为重要的是，脚本回调(script callback)隐藏了很多实现细节并且帮我们解决了一大堆浏览器兼容性问题。

### 使用脚本回调(script callback)的要求
ASP.NET脚本回调(script callback)的核心包括一些客户端JavaScript，用来安并排处理程序中客户端和服务器间的数据往返。所以，使用脚本回调(script callback)的先决条件是服务段代码侦听客户端的调用。回调由客户端的中介(intermediary)处理，而用户可以继续进行操作。回调并不立即影响当前的页面，给用户造成一种假象，仿佛所有的一切都像是在传统的桌面应用程序中。因此，第二个要求就是浏览器支持DHTML并实现了高级的文档对象模型(DOM)。没有这些功能，多数下载下来的数据都没什么用。

在微软的世界里，第一次回调(callback)的实现是Remote Scripting (RS)。RS使用Java小程序(Java applet)连接服务器并要求用一个ASP页面来处理请求。另外，此ASP页面提供一个量身定做的对象模型(object model)——一种共有的通用接口—— 为了让交互启效。在ASP.NET中，总体上模型很相似，但使用的工具有所不同。

### ASP.NET脚本回调(script callback)的工作原理
ASP.NET 2.0脚本回调(script callback)用XmlHttpRequest DOM对象(XmlHttpRequest DOM object)来建立连接。(对Internet Explorer来讲，脚本回调(script callback)要求版本至少是5.0) 远程调用的目标可以是某个特定的Server Control(例如，新的GridView控件(GridView control))，也可以是页面本身。通常，此目标必须是个实现了ICallbackEventHandler的对象。

  下面几段向您展示怎样增强你的页面使其支持脚本回调(script callback)。

  第一步是标识触发操作的HTML元素(HTML element)。典型情况下，此元素(element)是一个可供用户点击的按钮(button)或链接(link)。关键的一点是此元素(element)引发的事件不会被浏览器自动处理并导致一次回调(postback)。例如，你不能用<asp:button>元素(element)来触发回调(callback)，因为<asp:button>会产生一个提交按钮(submit button)。如果你想用一次按钮点击来开始一次操作，下面的代码非常不错：
<code50>
< runat="server" id="callbackStarter" value="View Details" type="button">
</code50>
这个按钮(button)——HtmlInputButton控件(HtmlInputButton control)的实例——需要一些特定的JavaScript代码来处理点击(click)事件。你可以添加如下代码到Page_Load事件中：
<code50>
callbackStarter.Attributes["onclick"] = String.Format("JavaScript:{0}",       callbackRef);
</code50>
怎样确定将事件绑定到那个脚本函数呢？要靠Page类中的GetCallbackEventReference函数。看这个例子：
<code50>
string callbackRef = GetCallbackEventReference(
this, "document.all['cboEmployees'].value", "UpdateEmployeeViewHandler", "null", "null");
</code50>
GetCallbackEventReference函数的第一个参数制定了服务器端将要处理回调的目标对象。如果传入的是this，则表示页面本身。也可以传入任何实现了ICallbackEventHandler的页面控件(page control)的引用。在任何情况下，客户端的提交动作(submit action)会提交至和标准回传(postback)机制相同的ASPX页面。

  第二个参数是一个JavaScript常量表达式，表示传给服务器的输入数据。在上面的代码中，一个下拉列表(dorp-down list)当前选中元素(element)的值被传入。

  第三个参数是一个用户定义在<script></script>块中的JavaScript回调(callback)函数名。回调(callback)执行后，此函数最终负责页面的更新。最后两个可选参数可用来指定错误处理函数(error handler)和上下文对象(context object)。

  GetCallbackEventReference函数将产生如下的脚本调用：WebForm_DoCallback(    pageID, input, UpdateEmployeeViewHandler, null, null);

此函数的代码会自动下载到客户端并通过<script></script>标签添加到页面响应(page's response)中。WebForm_DoCallback 使用XmlHttpRequest DOM对象(XmlHttpRequest DOM object)回调(call back)当前页面的URL。与此同时，它会添加一些额外的隐藏域(hidden field)以便服务器区分更简单的轻量级回调(callback)请求和一般回传(postback)请求。

  处理请求时，ASP.NET运行时(runtime)标识出调用的目标对象(传给GetCallbackEventReference的第一个参数)，确认它实现了ICallbackEventHandler接口后调用RaiseCallbackEvent方法：
<code50>
public virtual string RaiseCallbackEvent(string eventArgument){
// Do something with the input and generate the output
return ProcessTheCall(eventArgument);
}
</code50>
RaiseCallbackEvent的接收参数和返回值均为字符串(string)类型。它也包含任意处理客户端输入并返回响应(response)的代码。客户端和服务器间的数据交换仅能通过字符串(string)进行。一个字符串(string)可包含任何信息，包括序列化的对象(serialized object)。其格式可由你随心所欲指地定。的返回值将被传入客户端的JavaScript回调(callback)函数(前面代码中的UpdateEmployeeViewHandler函数)。这里是其必须的原形(prototype)：
<code50>
function UpdateEmployeeViewHandler(result, context){
// "result" is the return value of RaiseCallbackEvent
// TO DO: Process the string and update the page using DHTML
}
</code50>
上面说过，脚本回调(script callback)并不适用于所有浏览器，尽管最新的浏览器，包括Internet Explorer 5+, Netscape 6+, and Safari 1.2+都能行。Microsoft在ASP.NET 2.0中加入了两个新的browser bapabilities：SupportsXmlHttp 与SupportsCallback以便开发人员检查方案的可行性。

### 一条让页面刷新更快的告诫
尽管脚本回调(script callback) 定义在ASP.NET 2.0中，要使其在ASP.NET 1.1里工作也并不很困难。在ASP.NET 2.0中，很多服务器控件(server control)借助脚本回调(script callback)提供了更迅速的页面刷新。最突出的例子也许是GridView控件(GridView control)，作为DataGrid的接班人，选择性地运用脚本回调(script callback)实现分页显示记录。

  正如前面所说，脚本回调(script callback)依赖于文档对象模型(DOM)的XmlHttpRequest对象。在Internet Explorer中，此文档对象模型对象(DOM object)通过ActiveX控件(ActiveX control)实现——Microsoft.XmlHttp。在IE中浏览这样的页面时，你必须适当降低安全设置以允许ActiveX控件(ActiveX control)能被脚本调用。在其他以同样方式实现XmlHttpRequest文档对象模型对象(DOM object)的浏览器中，这是不必要的。事实上，基于Mozilla的浏览内置支持了HTTP请求功能器，而没用使用ActiveX控件(ActiveX control)——这也是在Internet Explorer 7.0中被寄予厚望的功能。