---
layout: post
title:  vscode配置snippets
subtitle: snippets
date: 2020-02-29 23:47:52
tags: vscode snippets
description: test
color: 'rgb(154,133,255)'
#cover: ''
---

# Vscode 配置snippets

由于需要使用jekyll，通过markdown来生成网站的博文。为了方便，于是决定使用vscode的snippets来生成markdown文件的配置信息。

## 配置snippet

最终的配置结果见下：

```json
{
	"jekyll": {
	"prefix": "jekyll",
	"body": [
		"---",
		"layout: post",
		"title:  $1",
		"subtitle: $2",
		"date: $CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE $CURRENT_HOUR:$CURRENT_MINUTE:$CURRENT_SECOND",
		"tags: $3",
		"description: $4",
		"color: '${5|rgb(154\\,133\\,255)},rgb(255\\,90\\,90),rgb(255\\,210\\,32)|}'",
		"---",
		"$0"
	],
	"description": "jekyll template",
	}
}
```

注意，body中的color field使用了vscode snippet的选择格式，由于color方案中包含空格，因此需要使用`\\`符号对逗号`,`进行转义。

## 自动弹出候选框

通过上述配置之后，在编辑markdown文件之后，需要通过命令才能弹出候选框（Windows下`ctrl+space`, MacOS下`cmd+space`），为了使候选框能够自动弹出，对vscode进行设置（修改settings.json文件）：

```json
{
    "editor.tabCompletion": "on",
    "[markdown]": {
    "editor.quickSuggestions": {
        "other": true,
        "comments": false,
        "strings": true
    },
    "editor.snippetSuggestions": "top"
    }
}
```

通过这样的配置，在markdown文件中，输入`jekyll`即可自动弹出候选框。