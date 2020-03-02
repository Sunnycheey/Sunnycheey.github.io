---
layout: post
title:  vscode task
subtitle: task usage
date: 2020-03-02 22:57:56
tags: vscode
description: tech
color: 'rgb(255,210,32)'
---

# VScode中task的利用

在`VScode`中，可以利用task来通过快捷键触发一些列命令。在编辑本站的时候，我就通过vscode的task来简化`jekyll build`, 以及`git`相关的命令。

task是与`VScode`的`workspace`相关的，具体来说，在使用task时，需要在当前文件夹下新建`.vscode`文件夹，在文件夹下新建`tasks.json`文件。之后即可根据需求定义自己的task。

在部署本网站时，`tasks.json`的配置如下：

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "publish",
            "type": "shell",
            "command": "./publish.sh",
            "args": ["${input:1}"],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        }
    ],
    "inputs": [
        {
            "id": "1",
            "type": "promptString",
            "description": "git commit message",
            "default": "publish post"
        }
    ]
}
```

设置中的`command`设置执行的shell命令，`args`字段指定命令行参数。设置为task之后，默认通过`cmd+shift+b`触发任务。

## publish.sh

publish执行的流程主要包括：

1. 运行jekyll build命令
2. git push

相关代码如下：

```bash
#!/bin/bash
read -p "Are you sure build? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker run --rm \
    --volume="$PWD:/srv/jekyll" \
    -it myjekyll:1.1.0 \
    jekyll build
fi
read -p "Are you sure generate new readme?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # we also need replace the number of post in readme
    # the location of `number of post` is marked in the
    # format `NUM_OF_POSTS`
    file_number=$(ls _posts | wc -l)
    echo "The number of total post is$file_number"
    sed -E "s/-[ ]+[0-9]-/-$file_number-/" README.md > tmp
    mv tmp README.md
fi

read -p "Are you sure commit " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add .
    echo 'git add successfully!'
    git commit -m "$1"
    echo 'git commit successfully'
    git push
fi
```

在上述代码中，还加入了统计网站总文章数的功能。