$(function() {
  $('.new-course').fileupload({
    dataType: "script",
    add: function(e, data) {
      var file, types;
      types = /(\.|\/)(gif|jpe?g|png)$/i;
      file = data.files[0];
      if (types.test(file.type) || types.test(file.name)) {
        data.submit();
      } else {
        alert("" + file.name + " is not a gif, jpeg, or png image file");
      }
    }
  });
});
