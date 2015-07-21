title: '>Mysql Bacup & Restore'
tags:
  - Database
  - Maintaining
id: 48
categories:
  - 未分类
date: 2006-03-13 14:24:00
---

>Dreamhost 的mysql状态如下:

Server version:         5.0.18-standard-log
Protocol version:       10
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8

这样的编码在备份和恢复的时候会有问题，因此做了如下测试来保证其正确：

1\. 恢复到原数据库，恢复后编码不变，仍全是utf8。

*   通过后台的worpress database backup 插件备份数据；
*   创建新数据库，此时编码仍全是utf8；
*   使用mysql> . backup.sql 进行恢复，blog浏览显示正常，编码仍全是utf8；
*   插入新数据，浏览正常；
*   插入数据后再次备份，再次使用1、2、3恢复，正常。
2\. 恢复到原数据库，恢复后编码变为server和database编码是utf8，client和conn编码是utf8。

*   通过后台的worpress database backup 插件备份数据；
*   创建新数据库，此时编码仍全是utf8；
*   修改backup.sql，在前面增加
SET CHARACTER_SET_DATABASE = 'utf8';
SET CHARACTER_SET_SERVER = 'utf8';
两行；
*   使用mysql> . backup.sql 进行恢复，blog浏览显示正常，编码变为server和database编码是utf8，client和conn编码是utf8；
*   插入新数据，浏览正常；
*   插入数据后再次备份，再次使用1、2、3恢复，浏览正常。
3\. 恢复到另外一个数据库（目的数据库是4.1.18-nt，window安装时选择了多语言，服务端默认utf8，状态如下）。

Server version:         4.1.18-nt
Protocol version:       10
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8

*   通过 mysql> mysqldump -u ID -p -h hostname.samuelchen.net --default-character-set=utf8
-set-charset=utf8 --skip-opt database_name> backup.sql  备份数据；
*   创建新数据库，server和database编码是utf8，client和conn编码是utf8；
*   修改backup.sql，在最前面增加 SET NAMES 'utf8';
*   使用mysql> . backup.sql 进行恢复，blog浏览显示正常，编码变为server和database编码是utf8，client和conn编码是utf8；
*   插入新数据，正常；
*   插入数据后再次备份，再次恢复，正常。
*   恢复到1,2所示的utf8数据库，无须修伽，正常。
--- Samuel