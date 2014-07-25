# Splash Page =================
get '/' do
	erb :index
end

# Create Survey (title) =======
get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  survey = Survey.create(params)
  redirect "/surveys/#{survey.id}/edit"
end

# Edit Survey Questions =======

get '/surveys/:id/edit' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :edit_survey
end

post '/surveys/:id/questions' do
	p params
	# params (id, question, answer[0], answer[1])
	survey = Survey.find(params[:id])
	survey.questions << Question.new(question: params[:new_question])

	# params[:answer].each do |choice|
	# 	survey.questions.last.choices << Choice.new(choice: choice)
	# end
	survey.questions.last.choices << Choice.new(choice: params[:choice1])
	survey.questions.last.choices << Choice.new(choice: params[:choice2])

	redirect "/surveys/#{params[:id]}/edit"
end
