$(function() {

// globally set cloudName
cloudinary.setCloudName('hfi2i1sfv');

var options = {
                upload_preset: 'testing',
                multiple: true,
                max_files: 10,
                // folder: 'TestFolder',
                max_image_width: 900,
                max_image_height: 900,
                // form: '#new_medium',
                // field_name: 'url[]',
                thumbnails: '.preview',
                button_class: 'btn btn-success btn-lg',
                button_caption: '+ Pictures',
                // keep_widget_open: true,
                theme: 'minimal'
              };

  // Open coudinary widget
  // upload to through browser to cloudinary
  // data for media model then added to url[] input field
  cloudinary.applyUploadWidget(document.getElementById('upload_widget_opener'), options, function(error, result) {
    console.log(error, result)
    var images = result.map(function(image){
      return image.public_id
    })
    console.log("IMAGES",images);
    // append hidden form field somewhere here
    images.forEach(function(public_id,idx) {
      $('#new_medium').prepend('<input type="hidden" name="url[]" value="' + public_id + '" class="cloudinary-hidden-field" data-cloudinary-public-id="' + public_id + '">');
    });
  });
  // form submit passes data to media controller

});
