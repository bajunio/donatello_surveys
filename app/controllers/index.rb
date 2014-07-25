# Splash Page =================
get '/' do
	erb :index
end

# Create Survey (title) =======
get '/surveys/new' do
  erb :create_survey
end

post '/surveys/new' do
  Survey.create(params)
  redirect '/surveys/:id/edit'
end

# Edit Survey Questions =======

get '/surveys/:id/edit' do
  erb :edit_survey
end

post '/surveys/:id/questions' do
	# params (id, question, answer[0], answer[1])
	survey = Survey.find(params[:id])
	survey.questions << Question.new(question: params[:new_question])

	# params[:answer].each do |choice|
	# 	survey.questions.last.choices << Choice.new(choice: choice)
	# end
	survey.questions.last.choices << Choice.new(choice: choice1)
	survey.questions.last.choices << Choice.new(choice: choice2)

	redirect '/surveys/:id/edit'
end
