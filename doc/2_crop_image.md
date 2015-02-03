### 安装 Jcrop

项目中使用的图片裁剪工具是 [Jcrop](http://deepliquid.com/content/Jcrop.html)。

在 Gemfile 文件中添加如下一行代码，运行 bundle 命令安装：

    gem 'jcrop-rails-v2', '~> 0.9.12'

### 使用 Jcrop

在 application.js 文件中添加：

    //= require jquery.Jcrop.min

在 application.css 文件中添加一行代码：

    *= require jquery.Jcrop.min

这样就可以在项目中使用 Jcrop 提供的功能了。

项目中裁剪图片的流程是，编辑课程时，若上传了图片，则会渲染 crop 模板，
裁剪下面代码对应的图片：

    <%= image_tag @course.cover_url(:large), id: "cropbox" %>

同时会显示裁剪区域，相关代码查看 crop.html.erb 文件

为了保存所裁剪区域的坐标，需要给课程添加四个属性，因为它们不与数据库字段关联，故使用 attr_accessor 方法，

    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

在 Rails 4 中，还需要白名单化上面四个属性。

选择好合适的裁剪区域之后，点击裁剪按钮，这时会执行一个 callback：

    def crop_cover
      cover.recreate_versions! if crop_x.present?
    end

根据裁剪区域重新生成图片的 thumb 版本。

最后需要注意，若 Carrierwave 中设置了上传文件的 filename 是随机的，使用这个 recreate_versions! 方法会有问题，
解决方法查看 uploader_helper.rb 文件中 filename 方法的定义，[参考文档](https://github.com/billie66/image/issues/8)。

另外，png 透明背景的图片裁剪之后，图片背景变成黑色，为解决这个问题，把上传图片的文件扩展名设定为 png 格式。
