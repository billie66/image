$(function() {
  var jcrop_api; // Holder for the jcrop API
  var inputFile = $("#fileupload")[0];
  inputFile.addEventListener('click', function() {this.value = null;}, false);
  inputFile.addEventListener('change', readData, false);

  function readData(evt) {
    evt.stopPropagation();
    evt.preventDefault();

    var file = evt.dataTransfer !== undefined ? evt.dataTransfer.files[0] : evt.target.files[0];
    var reader = new FileReader();

    if (!file.type.match(/image.*/)) { return; }

    reader.readAsDataURL(file);

    reader.onload = function() {
        $('#course-cropbox')[0].src = this.result;
        $('#course_dataurl')[0].value = this.result;
      }

    if (jcrop_api) {
      jcrop_api.destroy();
    } else {
      init_jcrop();
    }

    $.colorbox({
      href: '#course-crop-modal',
      inline: true,
      onClosed: function(){
        $("#course-cropbox").removeAttr("src");
        $("#course-cropbox").removeAttr("style");
      }
    });
  }

  function init_jcrop() {
    $(document).bind('cbox_complete', function() {
      $('#course-cropbox').Jcrop({  //options
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
    $("#course_crop_x").val(Math.round(coords.x));
    $("#course_crop_y").val(Math.round(coords.y));
    $("#course_crop_w").val(Math.round(coords.w));
    $("#course_crop_h").val(Math.round(coords.h));
  }

  $('.modal-footer form').submit(function() {
    $("#course-crop-btn").prop('disabled', true);
  });
});
