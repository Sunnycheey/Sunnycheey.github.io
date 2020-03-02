---
layout: post
title:  Shell引用变量写法之间的区别
subtitle: Shell
date: 2020-03-01 15:34:48
tags: Shell
description: tech
color: 'rgb(255,90,90)'
---

# 记录

在Shell中引用一个变量有若干中不同的写法

```bash
var='hello'
echo $var; echo "$var"; echo "{var}"
```

在大多数的情况下，`$var`和`${var}`是相同的，二者只用于区分具有二义性的变量。E.g., `$varl`, `${var}l`。

而`$var`与`"$var"`区别在于：

**当var变量中存在空格时，前者会将变量按空格划分为不同的几部分，而后者会将变量作为一个整体**