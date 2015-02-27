#= require qiniu_direct_uploader

$(document).ready ->
  photoForm = $("form#photograph-uploader")
  if photoForm.length > 0
    photoForm.QiniuUploader
      autoUpload: true
      singleFileUploads: false
      limitMultiFileUploads: 2
      customCallbackData: { "xyz": 100 }
      onFilesAdd: (file) ->
        types = /(\.|\/)(gif|jpe?g|png)$/i;
        if types.test(file.type) || types.test(file.name)
          $(".fileupload-btn").slideToggle("slow")
        else
          alert("" + file.name + " is not a gif, jpeg, or png image file")

    photoForm.bind "ajax:success", (e, data) ->
      $(".fileupload-btn").slideToggle("slow")

    photoForm.bind "ajax:failure", (e, data) ->
      console.log('failure')
      console.log(data)
