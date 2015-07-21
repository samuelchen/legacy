title: '>The flow of MVC in Spring -- Part I -- Dispatcher and Controller'
tags:
  - Java
  - Programming
id: 6
categories:
  - 未分类
date: 2004-07-28 09:15:00
---

>From the example on spring official site, I conclude the flow of Spring's MVC.

1\. Request --&gt; org.springframework.web.servlet.**DispatcherServlet** --&gt; parse **[ServletName]-servlet.xml** --&gt; dispatch to Controller
   The “Request” is the “url-patten” mapped in **web.xml** of web application.
   [ServletName] is the name DispatcherServlet mapped (you can also extend it).

2\.  Create your own Controller “MyController“ --&gt; implement Interface org.springframework.mvc.**Controller ** --&gt; write code of  controlling in method **handleRequest()** which inherited from “Controller” --&gt;  return the created model and view obejcts of org.springframework.mvc.**ModelAndView** --&gt; the framework will render it automatically
   The constructor of ModelAndView takes 1 or 3 parameter(s).

   For 3 parameters, first one is the view **path** (The truth path or resolved path. The resolved path is resolved by org.springframework.web.sevrlet.view.InternalResourceViewResolver. I will explain it when I post the next time.).
   The second one is the model object's given name, it's String. This name is NOT the object's variant-name. This name will be used in jsp. You can look it as an **alias**.
   The third one is the model object ( just the variant you will pass to jsp view ).

3\. Ok, Use the returned model **object **in jsp.

I am an beginner of Java, so i can not conclude if the flow is the common MVC flow.

to be continue ...