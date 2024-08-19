# powershell git状态集成与提示符配置
- [powershell git状态集成与提示符配置](#powershell-git状态集成与提示符配置)
  - [前言](#前言)
  - [配置文件链接](#配置文件链接)
  - [powershell提示符颜色设置：](#powershell提示符颜色设置)
  - [提示符外观设置：](#提示符外观设置)
    - [emoji提示符步骤设置](#emoji提示符步骤设置)
  - [git 状态集成](#git-状态集成)
  - [其他](#其他)

## 前言
鉴于在powershell上命令`git status`频繁运行，而oh-posh配置的占用过大（虽然其也能配置git状态集成），因此在Powershell上自己配置了git状态集成，写了以下配置文件。
文件内容部分参考文章 **https://www.lfhacks.com/tech/powershell-prompt-git-branch， 在此感谢作者**
## 配置文件链接
gitee: 
github:
## powershell提示符颜色设置：
配置文件默认把git分支设置为橙色，可以查阅 ***ANSI颜色代码***并阅读相关知识来修改以下代码片段把提示符颜色修改
```powershell
# color setting
$orange =[char]27 + "[33m"
$reset = [char]27 + "[0m"
```
- 路径颜色
  - 最后一行代码`$promptString`前后添加设置好的\$color和\$reset，\$reset不需要重新设置，只用添加自定义的\$color变量, <font color="red">**[char]27不需要改动**</font>,只需改动后面字符串中的**数字**
  - 例如：
  - ```powershell
    # color setting
    $orange =[char]27 + "[33m"
    $reset = [char]27 + "[0m"
    $red =[char]27 + "[31m"
    "$red$promptString$reset))$orange$git_branch$reset >> "
    ```
   - 这将设置路径提示符为**红色**
- 分支颜色
  - 最后一行代码`$git_branch`设置分支提示符颜色，直接修改$orange参数即可

## 提示符外观设置：
由配置文件propmt.ps1可见外观设置为)) 和 >>
![alt text](assets/image.png)
修改最后一行代码`"$promptString))$orange$git_branch$reset >> "`以更改
***

自己可以改用其他符号，甚至使用emoji
![alt text](assets/image1.png)
### emoji提示符步骤设置 
这里我使用网站https://www.emojiall.com/zh-hans
1.查找所要emoji并复制其十进制编码

![alt text](assets/image2.png)
2.复制十进制的**前面四个字符**9889
3.把$emoji加入到最后一行的输出中，最终如下，同样可自己定制颜色
```powershell
$emoji = [char]9889
"$promptString))$orange$git_branch$reset >>$yellow$emoji$reset "
```
## git 状态集成
"*"表示处于工作目录更改，但是未提交到staging area，
"*+"表示已经提交到staging area，但是尚未commit

## 其他
本人学术尚浅，可以预见代码中还有很多不足，欢迎提issue.