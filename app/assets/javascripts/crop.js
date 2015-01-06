$(function(){
  var showCoords = function(coords) {
    $('#course_crop_x').val(coords.x);
    $('#course_crop_y').val(coords.y);
    $('#course_crop_w').val(coords.w);
    $('#course_crop_h').val(coords.h);
  };

  $('#cropbox').Jcrop({
    bgColor: '',
    onChange: showCoords,
    onSelect: showCoords
  });
});
