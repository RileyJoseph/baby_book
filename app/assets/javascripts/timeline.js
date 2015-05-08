document.addEventListener("DOMContentLoaded", function(event) {

  var container = document.getElementById('visualization');

  // Create a DataSet (allows two way data-binding)
  var items = new vis.DataSet([
    {id: 1, content: "<p class='caption'>Asa was born</p>", start: 'October 2, 2013'},
    {id: 2, content: "<p class='caption'>Asa smiled for the first time</p>", start: 'November 20, 2013'},
    {id: 3, content: "<p class='caption'>He sat up", start: 'March 12, 2014'},
    {id: 4, content: "<p class='caption'>Standing up!</p>", start: 'June 19 2014'},
    {id: 5, content: "<p class='caption'>Asa's first steps</p>", start: 'August 10, 2014'},
    {id: 6, content: "<p class='caption'>First day at daycare</p>", start: 'September 13, 2014'}

  ]);

  // Configuration for the Timeline
  var options = {
    orientation: "bottom",
    height: 370,
    min: "2013",
    max: "2018",
    start: "2013",
    end: "2015",
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
      $("#hidden").slideDown('slow').css("opacity","1")
    })
    $("#off").on('click', function() {
      $("#hidden").slideUp('slow');
    });
  });

});