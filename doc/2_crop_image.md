### 安装 Jcrop

项目中使用的图片裁剪工具是 [Jcrop](http://deepliquid.com/content/Jcrop.html)。

在 Gemfile 文件中添加如下一行代码，运行 bundle 命令安装：

    gem 'jcrop-rails-v2', '~> 0.9.12'

然后在 application.js 文件中添加：

    //= require jquery.Jcrop.min

在 application.css 文件中添加一行代码：

    *= require jquery.Jcrop.min

这样就可以在项目中使用 Jcrop 提供的功能了。

### 使用 Jcrop
