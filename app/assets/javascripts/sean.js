$(function(){

  // Clear modal once modal closes
  $('#myModal').on('hidden.bs.modal', function(){
    $(this).removeData('bs.modal');
  });

  // BABIES INDEX AJAX CALLS

  // AJAX data create for babies
  $('#myModal').on('submit','form',function(event){
    event.preventDefault();
    var form = $(this);
    $.ajax({
      url:form.attr('action'),
      method:form.attr('method'),
      data:form.serialize()
    }).done(function(data){
      $('.babies-row').html(data);
      $('#myModal').modal('hide');
    }).error(function(err){
      alert('Something Broke');
      console.log(err);
    });
  });

  // STATISTICS PAGE AJAX CALLS

  // AJAX data create for stats
  $('#myModal').on('submit', 'form', function(event){
    event.preventDefault();
    var form = $(this);
    $.ajax({
      url:form.attr('action'),
      method:form.attr('method'),
      data:form.serialize()
    }).done(function(data){
      $('.baby-recent tbody').html(data);
      $('#myModal').modal('hide');
    }).error(function(err){
      alert('Something Broke');
      console.log(err);
    });
  });

});