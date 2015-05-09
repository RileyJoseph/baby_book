document.addEventListener("DOMContentLoaded", function(event) {

  var container = document.getElementById('visualization');

  var babyInfo = $('.temp_information').data('temp')

  var baby = []
  for (var i = 0; i < babyInfo.length; i++) {
    baby[i] = {}
    baby[i].id = i
    baby[i].content =  "<p class='caption'>" + babyInfo[i].topic + "</p>"
    baby[i].start = babyInfo[i].date
    baby[i].body = babyInfo[i].body
  }

  // var baby = [
  //   {id: 1, content: "<p class='caption'>Asa was born</p>", start: 'October 2, 2013'},
  //   {id: 2, content: "<p class='caption'>Asa smiled for the first time</p>", start: 'November 20, 2013'},
  //   {id: 3, content: "<p class='caption'>He sat up", start: 'March 12, 2014'},
  //   {id: 4, content: "<p class='caption'>Standing up!</p>", start: 'June 19 2014'},
  //   {id: 5, content: "<p class='caption'>Asa's first steps</p>", start: 'August 10, 2014'},
  //   {id: 6, content: "<p class='caption'>First day at daycare</p>", start: 'September 13, 2014'}

  // ]
  // Create a DataSet (allows two way data-binding)
  var items = new vis.DataSet(baby);

  // Configuration for the Timeline
  var options = {
    orientation: "bottom",
    height: 350,
    min: "2013",
    max: "2018",
    start: "2013",
    end: "2015",
    // moveable: false,
    showCurrentTime: true,
    editable: {
      add: true,         // add new items by double tapping
      updateTime: true,  // drag items horizontally
      updateGroup: true // drag items from one group to another
   // delete an item by tapping the delete button top right
    }
  };

  // Create a Timeline
  var timeline = new vis.Timeline(
    container,
    items,
    options
    );

  $(function(){
    $('.item.box').on('click', function(){
      text = $(this).text()
      $("#hidden").slideDown('slow').css("opacity","1")
      $("body").prepend("<div id='PopupMask' style='position:fixed;width:100%;height:100%;z-index:10;background-color:gray;'></div>");
      $("#PopupMask").css('opacity', 0.8);
        for (var i = 0; i < babyInfo.length; i++) {
          if (babyInfo[i].topic === text) {
            $('.blurb').text(babyInfo[i].body)
          }
        }
      })
    $("#off").on('click', function() {
      $("#hidden").slideUp('slow');
      setTimeout(function() {$('#PopupMask').fadeOut()}, 300);
    });
  });

});