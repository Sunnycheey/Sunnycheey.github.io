---
layout: post
title:  beautifulsoup content missing
subtitle: content missing
date: 2020-03-05 19:51:42
tags: beautifulsoup lxml
description: tech
color: 'rgb(255,90,90)'
---

# beautifulsoup内容缺失

## 记录

在完成项目时，用`beautuifulsoup`来解析xml文件，所用的解析引擎为`lxml`，但发现在解析的过程中，有些特定的标签会缺失（例如`header`标签）

相关代码见下：

```python
s = Beautifulsoup(filename, 'lxml')
```

之后在网上发现了相关的[解释](http://blog.thehumangeo.com/2015/07/09/no-soup-for-you-when-beautiful-soup-doesnt-like-your-xml/)，总而言之，通过更换代码为：

```python
s = Beautifulsoup(filename, 'xml')
```
即可解决。