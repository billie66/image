前面两篇文章中，分别介绍了图片上传和裁剪功能，而这篇文章简述一下前端特效的实现。
目前裁剪图片的流程是图片更新后跳转到一个新的页面才能剪裁，过程有点繁琐，目前比较流行的方式
是上传图片，在当前页面就能裁剪图片，正如 Twitter 图片上传效果。

现在移步到首页，看到一个绿色的上传按钮，点击按钮，选择要上传的图片，图片会覆盖在当前页面之上且能剪裁。
实现这个效果需要用到 js [colorbox](http://www.jacklmoore.com/colorbox/) 以及
HTML5 的[文件接口](https://developer.mozilla.org/en-US/docs/Using_files_from_web_applications)

### 安装使用 colorbox

在 Gemfile 中添加如下一行，并运行 bundle 命令：

    gem 'jquery-colorbox-rails'

Colorbox 提供了五种样式，这里选择第一个 example1，在 application.css 中：

    *= require jquery.colorbox-example1

在 application.js 文件中包含 colorbox js 代码：

    //= require jquery.colorbox

### 使用 HTML 5 的文件接口
