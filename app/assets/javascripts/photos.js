// $(function() {
//   $('.imgWrapper > p > a').on('click', function(e) {
//     e.preventDefault();
//     var delBtn = $(this);
//     var myUrl = delBtn.attr('href');
//     console.log(myUrl)
//     if(confirm('Are you sure you want do delete this?')){
//     $.ajax({
//       method: 'DELETE',
//       url: myUrl
//       }).done(function() {
//         delBtn.parent('div').remove();
//       })
//     }
//   })
// })

window.addEventListener("load", function() {
  console.log("JS function working!")
  if (gon.baby) {
    if (gon.baby.gender === "boy") {
      console.log("its a boy")
      $('.slider-btns').css('background-color','black')
      $('.slider-play-toggle').css('background-color','black')
    } else {
      console.log("its a girl")
      $('.slider-btns').css('background-color','black')
      $('.slider-play-toggle').addClass('.girl-btns')
    }
  }
});

$('.prettySocial').prettySocial();
