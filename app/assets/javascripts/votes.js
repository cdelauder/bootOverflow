$(document).ready(function(){
  $(".voting-controls").on('ajax:success', '.upvote', increaseVote)
  $(".voting-controls").on('ajax:success', '.downvote', decreaseVote)
});

var increaseVote = function(e, data, xhr, status) {
  e.preventDefault()
  $(this.parentElement).html(data)
}

var decreaseVote = function(e, data, xhr, status) {
  e.preventDefault()
  $(this.parentElement).html(data)
}