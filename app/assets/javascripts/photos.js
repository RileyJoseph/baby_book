$(function() {
  $('.imgWrapper').on('click', function(e) {
    e.preventDefault();
    var delBtn = $(this);
    var myUrl = '/maps/' + delBtn.attr('data');
    console.log(myUrl)
    if(confirm('Are you sure you want do delete this?')){
    $.ajax({
      method: 'DELETE',
      url: myUrl
      }).done(function() {
        delBtn.parent('div').remove();
      })
    }
  })
})

