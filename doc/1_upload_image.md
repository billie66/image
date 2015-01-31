### 新建项目

首先新建一个 Rails 应用，名为 image。代码如下:

    rails new image

### 使用 CarrierWave

先创建一个 model 名为 course，有两个属性，一个是 name，另一个为 cover。

    rails g model Course name:string cover:string
    rake db:create
    rake db:migrate

接下来安装 [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)，
在 Gemfile 文件中添加如下一行，并运行 bundle 命令安装。

    gem 'carrierwave', '~> 0.10.0'

下面为课程创建一个 uploader 名为 Cover，运行下面的命令：

    rails generate uploader Cover

命令执行完毕会生成一个名为 app/uploaders/cover_uploader.rb 的文件。打开文件，可以看到一些默认配置，
每条配置的含义，参阅 carrierwave 的文档。若应用中有多个 uploader 且共享一些配置信息的话，可以创建
一个名为 app/uploaders/uploader_helper.rb 的文件存放这些配置，
然后在每个 uploader 中包含这个文件，配置就能生效。比如，修改 cover_uploader.rb 文件，添加一行代码：

    include UploaderHelper

然后把这个 uploader 挂载到课程的 cover 属性下，在 course.rb 文件添加一行代码

    mount_uploader :cover, CoverUploader

### 使用 MiniMagick 定制图片大小

在一个应用中，因使用场景不同，会用到各种版本的图片。Carrierwave 就能完成这个工作，
不过需要借助另外一个工具 [MiniMagick](https://github.com/minimagick/minimagick)。

MiniMagick 依赖于 ImageMagick 命令行工具，所以要先安装 ImageMagick，检查一下是否安装了，
运行命令：

    $ convert -version
    Version: ImageMagick 6.7.7-10 2014-03-06 Q16 http://www.imagemagick.org
    Copyright: Copyright (C) 1999-2012 ImageMagick Studio LLC
    Features: OpenMP

若没有得到以上类似的输出结果，则需要安装：

    $ suod apt-get update
    $ sudo apt-get install imagemagick

然后就可以安装 MiniMagick 了，在 Gemfile 中添加下面一行，运行 bundle 命令：

    gem 'mini_magick', '3.7.0', require: false

接下来修改 cover_uploader.rb 文件，取消下面一行代码的注释符（#）：

    # include CarrierWave::MiniMagick

本项目中要生成一个 200*200 的图片版本，还需要添加代码：

    version :thumb do
      process :resize_to_fill => [200, 200]
    end

到目前为止，关于 Carrierwave 的内容就介绍这些。

### 用户交互界面

先创建 course controller，运行：

    rails g controller courses index show new create

这里主要注意的是
