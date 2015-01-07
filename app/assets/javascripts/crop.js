$(function(){
  var showCoords = function(coords) {
    $('#course_crop_x').val(coords.x);
    $('#course_crop_y').val(coords.y);
    $('#course_crop_w').val(coords.w);
    $('#course_crop_h').val(coords.h);
  };

  $('#cropbox').Jcrop({
    bgColor: '',
    aspectRatio: 1,
    setSelect: [0, 0, 200, 236],
    onChange: showCoords,
    onSelect: showCoords
  });
});
