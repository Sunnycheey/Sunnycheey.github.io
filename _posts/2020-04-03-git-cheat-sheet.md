---
layout: post
title:  git-cheat-sheet
subtitle: git
date: 2020-04-03 22:08:31
tags: git
description: tech
color: 'rgb(154,133,255)'
---

# git命令记录

* `git diff` 查看暂存区内容与工作区文件之间的差异(尚未暂存的文件进行了哪些修改)。
    > **注意**：git diff 本身只显示尚未暂存的改动，而不是自上次提交以来所做的所有改动。 所以有时候你一下子暂存了所有更新过的文件，运行 git diff 后却什么也没有，就是这个原因。
* `git diff --staged`将对比已暂存文件与上一次提交文件之间的差异
* `git commit -a`选项能够跳过`git add`步骤，而将所有已跟踪的文件暂存起来并一起提交。
* 使用`git rm`1）从工作目录中删除文件；2）不再跟踪对应文件；或者仅不再跟踪对应文件。若只想不再跟踪文件，而想在工作目录中仍保存文件，则可以使用`git rm --cached`
* 在git系统中进行文件的移动操作可以通过`git mv`实现。
* 使用`git commit --amend`来修正最近一次的提交（最后在log中仅存在一次提交记录）：
  
  ```shell
    $ git commit -m 'something'
    $ git add forgotten_file
    $ git commit --amend
  ```

* 使用`git reset HEAD file`以及`git checkout -- file`分别将文件从暂存区移出以及放弃在工作区的修改。
* 在`git merge`存在冲突时，解决冲突之后需要使用`git add`标识冲突已解决
* `git base`变基:
    ```shell
        $ git checkout exp
        $ git rebase master
        $ git checkout master
        $ git merge exp
    ```
    > 总的原则是，只对尚未推送或分享给别人的本地修改执行变基操作清理历史， 从不对已推送至别处的提交执行变基操作，
## todos
- [ ] 强制使用git
