@echo off
title 废客Git代码仓库快捷操作BAT文件 www.FK68.net
color 0A
cls

:: Git仓库地址和用户名密码
set Giturl=Git仓库网址
set Username=用户名
set Password=密码
set Email=邮箱
 
:: 删除原始配置文件
del %USERPROFILE%\.git-credentials
:: 替换 '//'为 '//Username:Password@'
call set VAT=%%Giturl://=//%Username%:%Password%@%%
:: 将文件写入到C:\Users\用户名\.git-credentials内容为：https://用户名:密码@你的GIT网址
echo %VAT%>>%USERPROFILE%\.git-credentials
:: git凭证存储(默认所有都不缓存。 每一次连接都会询问您的用户名和密码。)
git config --global credential.helper store


:: 1.创建项目目录 master
mkdir master
:: 2.进入项目目录
cd master
:: 3.设置Git中你的标识 因为Git是分布式版本控制系统，所以，每个机器都必须自报家门：你的名字和Email地址。
git config --global user.name "%Username%"
:: 4.设置Git中你的邮箱 注意git config命令的--global参数，用了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置，当然也可以对某个仓库指定不同的用户名和Email地址。
git config --global user.email "%Email%"
:: 5.初始化空的 git 仓库
git init
:: 5.添加一个名为 origin 的远端（ url 为 git 地址）的项目配置。
git remote add origin %Giturl%



:start
echo ----------------------------------------------
echo    操作方法(请选择要进行的操作后按回车)
echo ----------------------------------------------
echo    [*] 按其他任意键将Git仓库的代码pull到本地目录
echo    [Y] 按Y键 提交本地代码Push(推送)到Git仓库
echo    [Q] 按Q键 exit退出

SET verybat=
SET /P verybat=
IF /I '%verybat%'=='y' GOTO push
IF /I '%verybat%'=='q' GOTO quit

:pull
echo 工作目录：%CD%
echo Git仓库地址：%VAT%
:: 取回远程主机master分支的更新（取得远程代码库的一份本地拷贝）
git pull origin master

echo.
echo.
GOTO start

:push
echo 工作目录：%CD%
echo Git仓库地址：%VAT%
:: 1.询问git的状态 显示你上次提交更新至后所更改或者写入缓存的改动
git status
:: 2.让Git加载（Stage）所有项目文件添加到暂存区 “.”=“所有文件、文件夹和子文件夹”
git add .
set /p cho=提交修改说明：
:: 3.提交已加载（Stage）的文件并附带着有意义的注释
git commit -am "%cho% by %Username%"
:: 3.将该目录下的文件推送到远端（origin）上的 "master" 分支
git push -u origin master
:: git push的两种方式SSH和HTTPS：当建立了本机密钥之后，使用ssh方式实际上是不需要再次认证的，而https则每次需要输入密码。

echo.
echo.
GOTO start

:quit
eixt

::一般也就常用git clone/fetch/push/pull/merge/rebase/reset/checkout/branch
::http://gogojimmy.net/2012/01/17/how-to-use-git-1-git-basic/