#�Ͽ�Git����ֿ��ݲ���BAT�ļ� for Windows

�Ͽ�����������ʵ�ַ��
[http://fk68.net](http://fk68.net)

Դ���ַ
[https://github.com/feikeq/fkgit](https://github.com/feikeq/fkgit)

##ʹ�÷���

###ʹ��ǰ���ȱ�֤��������git
�ȴ� git ������ http://git-scm.com/downloads �������� git ����װ�� C ��.Ȼ�� git Ŀ¼�µ� bin���� C:\Program Files (x86)\Git\bin ����ӵ� PATH ���������� �һ� ThisPC > properties > Adavanced system settings > Environment Variables '' ѡ�� PATH, ��� Edit��������ʾ������ bin ��·���� C:\Program Files (x86)\Git\bin ����ӵ�����ֵ���� '' Ȼ����Ϳ����� cmd ��ʹ�� git �����ˡ�

###1: ���� fkgit.bat �ļ������ĵ���ʽ��ΪANSI(��Ҫ��UTF-8!!)
�ü��±����޸������
```javascript
:: Git�ֿ��ַ���û�������
set Giturl=https://xxx.xx/xx.git
set Username=�û���
set Password=����
set Email=����
```

###2: ���� fkgit.bat �������Git��ز���

   ��������(��ѡ��Ҫ���еĲ����󰴻س�)
   
   * �������������Git�ֿ�Ĵ���pull������Ŀ¼
   * ��Y�� �ύ���ش���Push(����)��Git�ֿ�
   * ��Q�� exit�˳�