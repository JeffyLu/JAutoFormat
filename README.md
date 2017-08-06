# JAutoFormat
###### 作者：[JeffyLu](https://jeffylu.github.io/)

- - -

### 环境依赖
##### [vim](https://github.com/vim/vim)
- 检查vim是否支持python

```shell
$ vim --version | grep +python

+cryptv          +linebreak       +python          +viminfo
```

- ```+python```或者```+python3```都可以

##### [vundle](https://github.com/VundleVim/Vundle.vim)
- 可选项
- vundle是一款强大的插件管理工具，建议装一个一劳永逸


### 配置安装
##### 未安装vundle
- ```git clone```或者将插件直接下载到本地，这里自由发挥
- vim命令模式下输入```source /path/to/JAutoFormat.vim```可临时使用，窗口关闭即失效
- 在vim配置文件```~/.vimrc```中添加```source /path/to/JAutoFormat.vim```可长久使用
- 将```JAutoFormat.vim```拷贝到```~/.vim/plugin```也可长久使用

##### 安装vundle
- 在```~/.vimrc```中添加```Bundle 'jeffylu/JAutoFormat'```
- 在vim命令模式下输入```PluginInstall```等待vundle自动下载安装插件结束后新建窗口即可使用


### 使用方法
1. 选中文本字符串
2. 在命令模式下输入相对应的命令和参数

##### To JSON
- 命令

```shell
JToJson arg1 arg2
    - arg1为键与值之间的字符串
    - arg2为键值对之间的字符串或者行结束字符串
    - arg1和arg2之间用空格相隔
    - 若参数中带有空格之类的符号需要加上转义符，如‘,\ ’
    - 若arg2为空可随意输入与arg1不冲突的字符，建议使用‘\n’
```

- 举例
1. 多行键值对的键与值之间由‘, ’相隔
![image](https://user-images.githubusercontent.com/16357973/29001380-aae17386-7abb-11e7-9dad-a1e6a13972a5.png)
![image](https://user-images.githubusercontent.com/16357973/29001405-724bfd42-7abc-11e7-9495-a3426724eb89.png)

2. 键与值之间由‘: ’相隔，键值对之间由‘, ’相隔
![image](https://user-images.githubusercontent.com/16357973/29001474-114c8172-7abe-11e7-86d3-27dc3fba6d70.png)
![image](https://user-images.githubusercontent.com/16357973/29001441-3e4d14bc-7abd-11e7-8eb7-7a693da1d180.png)

##### To List
- 命令

```shell
JToList arg1 arg2
    - arg1为元素之间的字符串
    - arg2为行结束字符串
    - arg1和arg2之间用空格相隔
    - 若参数中带有空格之类的符号需要加上转义符，如‘,\ ’
    - 若arg2为空可随意输入与arg1不冲突的字符，建议使用‘\n’
```

- 举例
1. 元素之间由‘, ’相隔
![image](https://user-images.githubusercontent.com/16357973/29001535-8c404c5a-7abf-11e7-90c7-7cfeb94303cf.png)
![image](https://user-images.githubusercontent.com/16357973/29001539-b813c6fe-7abf-11e7-898f-40f23cae742e.png)

2. 元素之间由‘, ’相隔，转换结果过长将自动换行
![image](https://user-images.githubusercontent.com/16357973/29001554-1ef59096-7ac0-11e7-9cab-87d5c64fee8a.png)
![image](https://user-images.githubusercontent.com/16357973/29001564-5761556e-7ac0-11e7-9d32-0f7572384e8a.png)

### 其他
- 爬虫时经常需要复制```request headers```改写成字典，于是突发奇想写了这个插件
- bug应该有不少，功能也不完善，后续再更新吧
- 以后有别的灵感也会更新进来
- vim插件开发文档挺难找的 :(