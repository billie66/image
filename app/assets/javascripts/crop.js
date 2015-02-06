$(function() {
  var jcrop_api; // Holder for the jcrop API
  var inputFile = $("#fileupload")[0];
  inputFile.addEventListener('click', function() { this.value = null; }, false);
  inputFile.addEventListener('change', readData, false);

  function readData(evt) {
    var file = evt.target.files[0];
    var imageType = /image.*/;
    if (!file.type.match(imageType)) { return; }

    var reader = new FileReader();
    reader.onload = function(e) {
      $('#user-cropbox')[0].src = e.target.result;
      $('#user_dataurl')[0].value = e.target.result;
    }
    reader.readAsDataURL(file);

    if (jcrop_api) {
      jcrop_api.destroy();
    } else {
      init_jcrop();
    }

    $.colorbox({
      href: '#user-crop-modal',
      inline: true,
      onClosed: function(){
        $("#user-cropbox").removeAttr("src");
        $("#user-cropbox").removeAttr("style");
      }
    });
  }

  function init_jcrop() {
    $(document).bind('cbox_complete', function() {
      $('#user-cropbox').Jcrop({  //options
        onChange: update_crop,
        onSelect: update_crop,
        setSelect: [0, 0, 172, 172],  //设置一个初选框的位置
        aspectRatio: 1,  //设置选择框高宽比,默认为任意
        bgColor: 'white'
        }, function(){
        jcrop_api = this;
      });
    });
  };

  function update_crop(coords) {
    $("#user_crop_x").val(Math.round(coords.x));
    $("#user_crop_y").val(Math.round(coords.y));
    $("#user_crop_w").val(Math.round(coords.w));
    $("#user_crop_h").val(Math.round(coords.h));
  }

  $('.modal-footer form').submit(function() {
    $("#user-crop-btn").prop('disabled', true);
  });
});
