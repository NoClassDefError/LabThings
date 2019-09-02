intellij开发环境搭建方法：
1.在intellij下，file->new->project from version control->git，url里填我的git地址，https://github.com/NoClassDefError/LabThings.git，如果时间太长，
直接进入https://github.com/NoClassDefError/LabThings下载代码，下载解压之后使用intellij，file>new->project from existing sources打开，注意勾选maven，Search for projects automatically
2.打开project structure，在其中Facets下分别配置web，spring，struts2框架，即分别点击左边的加号，选择它们，再点击右边的加号，配置文件的路径，
web框架对应main/webapp/WEB-INF/web.xml，spring和struts2的配置文件intellij会自动找到，勾选上即可。
在settings->Builld->Compiler->Java complier配置project bytecode version 为java8。
3.在Aritifacts中创建 artifact，在artifact的WEB-INF下创建lib目录，把右边的依赖文件全部添加到左边的lib中
4.使用src/main/resources/tables.sql在你的电脑上的mysql中建库，不需要管它其中的乱码
5.在src/main/resources/db.properties里修改成你数据库的参数，show_sql改成true
6.点击run configurations,再点击加号，选择本地的tomcat, 在你电脑下新建C:\root\img目录，用于存放图片
7.在intellij tomcat的配置中，点击deployment，一是部署刚刚创建的artifact，二是部署刚刚创建的C:\root文件夹,application Context为/root
8.点击启动就能看到网页了，点击左边的物品分类树可以展开

项目结构：
![img](https://github.com/NoClassDefError/LabThings/a.png)
