$(function(){

  // Clear modal once modal closes
  $('#myModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
  });

  // AJAX data create for stats
  $('#myModal').on('submit', 'form', function(event){
    event.preventDefault();
    var form = $(this);
    $.ajax({
      url:form.attr('action'),
      method:form.attr('method'),
      data:form.serialize()
    }).done(function(data){
      $('.baby-stats').html(data);
      $('#myModal').modal('hide');
    }).error(function(err){
      alert('Something Broke');
      console.log(err);
    });
  });

});