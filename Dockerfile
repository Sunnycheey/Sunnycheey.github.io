ARG VERSION=latest
FROM jekyll/jekyll:${VERSION}
RUN gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/ \
bundle config mirror.https://rubygems.org http://mirrors.tuna.tsinghua.edu.cn/rubygems \
bundle update