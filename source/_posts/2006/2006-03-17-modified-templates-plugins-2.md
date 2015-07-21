title: '>Modified templates & plugins'
tags:
  - Maintaining
  - WordPress
id: 52
categories:
  - 未分类
date: 2006-03-17 13:07:00
---

>改了太多的地方，比如为iG_Syntax_Hilite插件显示的代码加上底色，修改meta顺序，文字等，就不再一一写了。总之得记住备份wp-content/。

修改了模版，使用：

[php]

< ?php // random display ads
if(function_exists('adsense_deluxe_ads')) {
__("
<p align="center">");
srand((double)microtime()*1000000);
$switcher = rand(0, 6);
switch ($switcher) {
case 0:
adsense_deluxe_ads('comment_link');
break;
case 1:
case 2:
adsense_deluxe_ads('recommend');
break;
case 3:
adsense_deluxe_ads('recommend_adsense');
break;
default:
adsense_deluxe_ads('comment');
}
__("

");
}?>
[/php]

的形式来随机显示google adsense广告，避免出现太多。