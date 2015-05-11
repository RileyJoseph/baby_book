$(function() {

// globally set cloudName
cloudinary.setCloudName('hfi2i1sfv');


  // Open coudinary widget
  // upload to through browser to cloudinary
  // data for media model then added to url[] input field
    $('#upload_widget_opener').click(function(e) {
      e.preventDefault();
      cloudinary.openUploadWidget({
        // widget options
        upload_preset: 'testing',
        folder: 'BabyBookTest',
        form: '#new_medium',
        field_name: 'url[]',
        thumbnails: '.preview',
        // keep_widget_open: true,
        theme: 'white'
      }, function(error, result) {
        console.log(error, result)
      });
    });
  // media model handled in controller

});
