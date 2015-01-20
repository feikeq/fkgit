#废客Git代码仓库快捷操作BAT文件 for Windows

废客联邦官网访问地址：
[http://fk68.net](http://fk68.net)

源码地址
[https://github.com/feikeq/fkgit](https://github.com/feikeq/fkgit)

##使用方法

###使用前请先保证机器上有git
先从 git 官网（ http://git-scm.com/downloads ）上下载 git 并安装到 C 盘.然后将 git 目录下的 bin（如 C:\Program Files (x86)\Git\bin ）添加到 PATH 环境变量。 右击 ThisPC > properties > Adavanced system settings > Environment Variables '' 选择 PATH, 点击 Edit（如红框所示）。将 bin 的路径（ C:\Program Files (x86)\Git\bin ）添加到变量值后面 '' 然后你就可以在 cmd 中使用 git 命令了。

###1: 下载 fkgit.bat 文件并将文档格式存为ANSI(不要用UTF-8!!)
用记事本打开修改配置项：
```javascript
:: Git仓库地址和用户名密码
set Giturl=https://xxx.xx/xx.git
set Username=用户名
set Password=密码
set Email=邮箱
```

###2: 运行 fkgit.bat 程序进行Git相关操作

   操作方法(请选择要进行的操作后按回车)
   
   * 按其他任意键将Git仓库的代码pull到本地目录
   * 按Y键 提交本地代码Push(推送)到Git仓库
   * 按Q键 exit退出