#= require qiniu_direct_uploader

$(document).ready ->
  photoForm = $("form#photograph-uploader")
  if photoForm.length > 0
    photoForm.QiniuUploader
      autoUpload: true
      singleFileUploads: false
      limitMultiFileUploads: 2
      customCallbackData: {"xyz": 100}
      onFilesAdd: (file) ->
        if file.type != "image/jpeg" and file.type != "image/png" and file.type != "image/gif"
          alert('please select image')
          return false
        else
          return true

    photoForm.bind "ajax:success", (e, data) ->
      console.log('success')
      console.log(data)

    photoForm.bind "ajax:failure", (e, data) ->
      console.log('failure')
      console.log(data)
