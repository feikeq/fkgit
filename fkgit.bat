@echo off
title �Ͽ�Git����ֿ��ݲ���BAT�ļ� www.FK68.net
color 0A
cls

:: Git�ֿ��ַ���û�������
set Giturl=Git�ֿ���ַ
set Username=�û���
set Password=����
set Email=����
 
:: ɾ��ԭʼ�����ļ�
del %USERPROFILE%\.git-credentials
:: �滻 '//'Ϊ '//Username:Password@'
call set VAT=%%Giturl://=//%Username%:%Password%@%%
:: ���ļ�д�뵽C:\Users\�û���\.git-credentials����Ϊ��https://�û���:����@���GIT��ַ
echo %VAT%>>%USERPROFILE%\.git-credentials
:: gitƾ֤�洢(Ĭ�����ж������档 ÿһ�����Ӷ���ѯ�������û��������롣)
git config --global credential.helper store


:: 1.������ĿĿ¼ master
mkdir master
:: 2.������ĿĿ¼
cd master
:: 3.����Git����ı�ʶ ��ΪGit�Ƿֲ�ʽ�汾����ϵͳ�����ԣ�ÿ�������������Ա����ţ�������ֺ�Email��ַ��
git config --global user.name "%Username%"
:: 4.����Git��������� ע��git config�����--global���������������������ʾ����̨���������е�Git�ֿⶼ��ʹ��������ã���ȻҲ���Զ�ĳ���ֿ�ָ����ͬ���û�����Email��ַ��
git config --global user.email "%Email%"
:: 5.��ʼ���յ� git �ֿ�
git init
:: 5.���һ����Ϊ origin ��Զ�ˣ� url Ϊ git ��ַ������Ŀ���á�
git remote add origin %Giturl%



:start
echo ----------------------------------------------
echo    ��������(��ѡ��Ҫ���еĲ����󰴻س�)
echo ----------------------------------------------
echo    [*] �������������Git�ֿ�Ĵ���pull������Ŀ¼
echo    [Y] ��Y�� �ύ���ش���Push(����)��Git�ֿ�
echo    [Q] ��Q�� exit�˳�

SET verybat=
SET /P verybat=
IF /I '%verybat%'=='y' GOTO push
IF /I '%verybat%'=='q' GOTO quit

:pull
echo ����Ŀ¼��%CD%
echo Git�ֿ��ַ��%VAT%
:: ȡ��Զ������master��֧�ĸ��£�ȡ��Զ�̴�����һ�ݱ��ؿ�����
git pull origin master

echo.
echo.
GOTO start

:push
echo ����Ŀ¼��%CD%
echo Git�ֿ��ַ��%VAT%
:: 1.ѯ��git��״̬ ��ʾ���ϴ��ύ�������������Ļ���д�뻺��ĸĶ�
git status
:: 2.��Git���أ�Stage��������Ŀ�ļ���ӵ��ݴ��� ��.��=�������ļ����ļ��к����ļ��С�
git add .
set /p cho=�ύ�޸�˵����
:: 3.�ύ�Ѽ��أ�Stage�����ļ����������������ע��
git commit -am "%cho% by %Username%"
:: 3.����Ŀ¼�µ��ļ����͵�Զ�ˣ�origin���ϵ� "master" ��֧
git push -u origin master
:: git push�����ַ�ʽSSH��HTTPS���������˱�����Կ֮��ʹ��ssh��ʽʵ�����ǲ���Ҫ�ٴ���֤�ģ���https��ÿ����Ҫ�������롣

echo.
echo.
GOTO start

:quit
eixt

::һ��Ҳ�ͳ���git clone/fetch/push/pull/merge/rebase/reset/checkout/branch
::http://gogojimmy.net/2012/01/17/how-to-use-git-1-git-basic/