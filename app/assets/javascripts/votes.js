$(document).ready(function(){
  $('.upvote').on('ajax:success', increaseVote)
  $('.downvote').on('ajax:success', decreaseVote)
});

var increaseVote = function(e, data, xhr, status) {
  debugger
  e.preventDefault()
  $(this).html(data)
}

var decreaseVote = function(e, data, xhr, status) {
  e.preventDefault()
  $(this).html(data)
}