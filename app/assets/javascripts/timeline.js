document.addEventListener("DOMContentLoaded", function(event) {

  var container = document.getElementById('visualization');

  var babyInfo = $('.temp_information').data('temp')


  for(var i = 0; i < babyInfo.length; i++ ) {
    var temp = moment()._d
        if (moment( babyInfo[0].date)._d < temp) {
          temp = moment( babyInfo[0].date)._d
        }
      }

    var start = moment(temp).subtract(90,"days")._d
    var present = moment()._d
    var end = moment(temp).add(5,"years")._d


  var baby = []
  for (var i = 0; i < babyInfo.length; i++) {
    baby[i] = {}
    var showId = babyInfo[i].id
    baby[i].id = i
    baby[i].content = "<p class='caption' data-toggle='modal' data-target='#myModal' href= events/" + showId + ">" +
                        babyInfo[i].topic + "</p>"
    baby[i].start = babyInfo[i].date
    baby[i].body = babyInfo[i].body
  }


  // Create a DataSet (allows two way data-binding)
  var items = new vis.DataSet(baby);

  // Configuration for the Timeline
  var options = {
    orientation: "bottom",
    height: 250,
    min: start,
    max: end,
    start: start,
    end: present,
    moveable: false,
    showCurrentTime: false,
    editable: {
      updateTime: true,  // drag items horizontally
      updateGroup: true

    }
  };

  // Create a Timeline
  var timeline = new vis.Timeline(
    container,
    items,
    options
    );


// Second fixed timeline, activated by user button click
  var container2 = document.getElementById('visualization2');

    var options2 = {
    orientation: "bottom",
    height: 250,
    min: start,
    max: end,
    start: start,
    end: present,
    moveable: true,
    showCurrentTime: false,
    editable: {
      updateTime: true,  // drag items horizontally
      updateGroup: true

    }
  };

  var timeline = new vis.Timeline(
    container2,
    items,
    options2
    );

// User button click to turn off zooming/scrolling
  $('#adjust').on('click', function() {
    if ($('#visualization2').hasClass('selected')) {
      $('#visualization').show()
      $('#visualization2').hide().removeClass('selected')
      $('#adjust').text("Turn on Scrolling").removeClass('btn-danger').addClass('btn-default')
    } else {
      $('#visualization').hide()
      $('#visualization2').show().addClass('selected')
      $('#adjust').text("Turn off Scrolling").removeClass('btn-default').addClass('btn-science')
    }
  });

});