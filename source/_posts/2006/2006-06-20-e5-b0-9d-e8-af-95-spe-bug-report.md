title: '>尝试 SPE & bug report'
tags:
  - Programming
  - python
id: 98
categories:
  - 未分类
date: 2006-06-20 15:48:00
---

>SPE 是python的一个IDE，今天刚刚试用了一下，感觉非常不稳定，经常的crash。

而且SPE好像不支持GUI的断点、单步调试，只能用winpdb；还有代码完成，不可以提示关键字、库，应该是没有自动检索现有的lib和module。

另外还有两个值得试试的IDE，BOA 和 NewEdit，特别是NewEdit，是由国人limodou做的。

给spe的作者发了封email report，不知道信息够不够。
SPE crashed while open files and close files.

Python 2.4.3 (#69, Mar 29 2006, 17:35:34) [MSC v.1310 32 bit (Intel)] on win32
Spe version  0.8.2.a
Python version  2.4.3  (2.3 required)
wxPython version  2.6.3.2\.  (2.6.1.0\. required)

Window XP English version with Chinese Language

SPE is setted to use utf-8.

Plz find attachment for zipped .py files and debug logs .