$(function() {

// globally set cloudName
cloudinary.setCloudName('gregorywyz');


  // Open coudinary widget
  // upload to through browser to cloudinary
  // data for media model then added to url[] input field
    $('#upload_widget_opener').click(function(e) {
      e.preventDefault();
      cloudinary.openUploadWidget({
        // widget options
        upload_preset: 'testtest',
        folder: 'widgetTest',
        form: '#new_medium',
        field_name: 'url[]',
        thumbnails: '.preview',
        theme: 'white',
        keep_widget_open: true
      }, function(error, result) {
        console.log(error, result)
      });
    });
  // media model handled in controller

});
