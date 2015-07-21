title: '>Modified templates & plugins'
tags:
  - Maintaining
  - WordPress
id: 50
categories:
  - 未分类
date: 2006-03-14 16:01:00
---

>对wordpress的模版和插件进行了一些修改，模版使用的是Almost Spring，修改如下：

#### 模版修改如下：

*   ##### comments.php:

        1.  增加每8条注释显示一次adsense#page广告；
[php num=32]
< ?php $comment_count = 0; ?>
[/php][php num=34]
< ?php // display ad every 8 comments
if($comment_count % 8 == 0) :
if(function_exists('adsense_deluxe_ads')) :
adsense_deluxe_ads('page'); endif;
$comment_count .= 1;
endif; ?>
[/php]
    2.  提交注释框上部显示adsense#recommend广告；
[php num=121]
< ?php if(function_exists('adsense_deluxe_ads')) :
adsense_deluxe_ads('recommend'); endif; ?>
[/php]

*   ##### index.php

        1.  修改了作者名显示，日期显示，分类显示等：
[php num=11]

< ?php the_date() ?> @ < ?php the_time() ?>
· < ?php _e('by'); ?> < ?php the_author() ?>
< ?php edit_post_link(__('Edit'), ' · ', ''); ?>

        < ?php _e('Tags:'); ?> < ?php the_category(', ') ?>
[/php]

*   ##### single.php

        1.  修改了作者名显示，日期显示，分类显示等：
[php num=9]

< ?php the_date() ?> @ < ?php the_time() ?>
· < ?php _e('by'); ?> < ?php the_author() ?>
< ?php edit_post_link(__('Edit'), ' · ', ''); ?>

        < ?php _e('Tags:'); ?> < ?php the_category(', ') ?>
[/php]

### 插件修改如下：

*   ##### Adsense-Deluxe:

    安装后，访问有问题；将 adsense-deluxe.php 拿到 plugins/ 下，然后删除目录（仅保留该文件），ok.
*   ##### iG-Syntax_Hilter:

        1.  安 装后，代码内的目录和解压后目录不匹配；将目录名改为 ig_syntax_hilite/，然后将目录里面的 ig_syntax_hilite/ （同名）下的所有文件移动到上一层，删除ig_syntax_hilite/目录；最后的目录结构是 plugins/ig_syntax_hilite/，ok.
    2.  为代码块增加底色，修改 syntax_hilite.php，增加一个层< div calss="alt" > < /div>，**未了避免wordpress编辑器自动转换，我在< 后都加了一个空格**。
[php num=53]
$bBody = "< div class="alt">";
[/php]
<div class="">[php num=79]
$bBody = "n< /div>< /div>< /div>< br />";
[/php]</div>
</strong>