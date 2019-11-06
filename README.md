# 16级3班1组-在线售票网站

### 项目介绍
本 在线售票网站 是一款旨在帮助用户解决线下抢票难、购票不易甚至是一票难求多种情况，同时又以各类演出活动及体育比赛项目运作、
策划  
和相关票务营销为主体的综合性网络平台。在线售票网是以丰富的演出活动为基础，强大的网络销售为保障，专业的服务体系为核
心的票务销  
售平台。业务涵盖了各类文体票务的销售（如：演出票务、体育票务等）；为文体项目提供分析、策划、营销等配套解决方
案。在线售票网系  
集网上票务查询、网上订购与按需配送为一体的专业化票务电子商务网站。网站覆盖全国范围内的电子票务互联网体系，
本网站秉承“准确、  
方便、快捷的服务宗旨,致力于互联网电子票务事业的发展,竭力为广大国内外消费者提供优质的一站式在线票务服务。

### 项目使用效果图

![Alt text](https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573060635351&di=b347c803c14372c76ca5e8f65e148445&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F9c16fdfaaf51f3de8a23dee795eef01f3b29799b.jpg)

  
  
---
### 软件架构
本 在线售票网站 基于SSM(Spring+SpringMVC+MyBatis) 框架开发  

本 框架图解如下：
 
 ![Alt text](https://images2017.cnblogs.com/blog/1322207/201801/1322207-20180127191002115-1771211757.png)

### 必要条件
* 操作系统：Windows 10 Pro
* jdk需求:1.8.0_144
* 服务器需求：tomcat 9.0
* 数据库需求：mysql 5.7.18
### 项目特点

1.  新用户的注册、登录功能

2.  在线浏览演出情况及票务信息

3.  提供用户在线反馈、投诉功能

4.  提供现售、预售票务的同步在线购票功能

5.  提供用户管理票务的功能，允许用户在不违反售票规则的情况下退票、转票、换票的功能

6.  提供根据日历将演出时间可视化的票务日历功能

7.  提供按多分类查询票务的功能，帮助用户更方便快捷查到需要的票务

8.  提供忘记密码重置功能，避免出现账号自锁死。

9.  提供锁票功能，确保用户“一人一票”，避免出现票务重复销售的情况

10. 允许票务管理员对票务销售相关页面的增加、删除、查询等操作

11. 允许票务管理员对票务销售相关页面的编辑、修改、再发布等操作

12. 允许票务管理员查看用户的在线反馈、投诉功能

13. 提供给票务管理员多种票务销售数据统计功能


### 集成方式
您可以通过以下链接来下载 在线售票网站：<https://gitee.com/sdfuful/onlineshoupiao160301.git>

### 使用方法
#### Q&A  作为 用户 我该如何使用本网站？  

1.用户的注册：  

 您需要先下载本项目（项目地址：<https://gitee.com/sdfuful/onlineshoupiao160301.git>）并将其部署，之后您需要执行以下步骤来完成用户的注册：
* 填写用户名、手机号、密码

* 填写 真实姓名 及 身份证号码 来实名注册

* 二次确认您的密码及身份信息

* 完成注册  
  
2.票务的购买：  

登录用户并选择您希望订购的票务，您需要执行以下步骤来完成票务的购买：
* 通过直接在 搜索框 中搜索您希望订购的票务或者通过票务分类快速找到相关票务

* 选择您需要的 场次、票面、票面数量、选座情况、票据是否配送 等详细信息，并点击提交，系统会根据您的提交信息进行反馈

* 请您根据系统的反馈信息进行二次信息确认

* 请在30分钟内扫码完成票务支付

* 完成购买  
    
3.用户的票务管理操作：  
* 请您点击 个人中心 来进入 订单管理 

* 在 订单管理 栏目中，您可以对订单进行退票、转票、换票等多种操作，以 退票为例：

* 对目标票务点击 退票 按钮，根据提示引导开始执行退票进程

* 输入用户密码确认退票，由系统判定退票开始的资金返还进程

* 完成退票  
  
      
3.用户的在线反馈与投诉功能：  
* 请您点击 在线反馈 进入反馈页面

* 在弹出的文字菜单栏中，输入 您的问题 或者 您对本网站的任何宝贵的意见或看法

* 填写您的联系方式，方便我们进一步的联系您（选填）

* 完成提交
  
####Q&A  作为 票务管理员 我该如何使用本网站？  

票务管理员账号是由票务出售方提供的管理账号，在您担任票务管理员期间，您被授权可以执行以下功能:
* 对票务销售页面的图文添加与删除操作

* 对票务销售页面的更改编辑操作

* 对用户的增、删、改、查操作

* 对订单的增、删、改、查操作

* 对票务售卖情况的统计操作

* 对每日订单数量的统计操作

* 对每日订单成交量的统计操作

* 对每日订单成交额的统计操作

* 查看用户提交的在线反馈与投诉

以 对票务销售页面的更改编辑 为例，您需要执行以下步骤完成更改编辑：
* 通过直接在 搜索框 中搜索您希望更改的编辑的页面，点击编辑按钮

* 填写您需要编辑的内容

* 确认无误后，单击 保存并更新 按钮 来完成票务销售页面的内容更新

* 内容编辑再发布完成 
### 参与贡献

1.  李磊    - ER Diagram Design

2.  孙瑞斌  - Core Developer/Technical Writer

3.  王金伟  - Developer

4.  闫东琦  - Developer

5.  张益豪  - Developer/Lead


### 所有项目参与人员（字母顺序排名）

1.  李磊  

2.  孙瑞斌

3.  王金伟

4.  闫东琦

5.  张益豪


### 鸣谢

本文参考了purpleBooth的README-template.md和AWeiLoveAndroid的开发工具总结（9）之开源项目的README文档的最全最规范写法  
感谢这两位原创作者们的共享.


