$(document).ready(function() {
	$('.add-question').on('click', addQuestion)
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

function addQuestion(event) {
	event.preventDefault();
	var question = $('[name="new_question"]').val();
	var choice1 = $('[name="choice1"]').val()
	var choice2 = $('[name="choice2"]').val()
	var request = $.ajax({
		url: '/surveys/'+this.id+'/questions', 
		type: 'POST',
		data: {
			new_question: question,
			choice1: choice1,
			choice2: choice2,
		}
	})
	request.done(updateDOM)
}	

function updateDOM(data) {
	var data = JSON.parse(data);
	var newQuestion = "<div class='question-block'><li>" + data.new_question +"</li><ol><li>" + 
	data.choice1 + "</li><li>" + data.choice2 + "</li></ol></div>";
	$('.current-question').append(newQuestion)
	$('form')[0].reset();
}