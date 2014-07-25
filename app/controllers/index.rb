# Splash Page =================
get '/' do
  @surveys = Survey.all
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

get '/surveys/:id' do
  @survey=Survey.find(params[:id])
  @questions = @survey.questions
  erb :take_survey
end

post '/surveys/:id/questions' do
	# params (id, question, answer[0], answer[1])
	p "SHOW ME THE PARAMS"
	p params
	survey = Survey.find(params[:id])
	survey.questions << Question.new(question: params[:new_question])

	# params[:answer].each do |choice|
	# 	survey.questions.last.choices << Choice.new(choice: choice)
	# end
	survey.questions.last.choices << Choice.new(choice: params[:choice1])
	survey.questions.last.choices << Choice.new(choice: params[:choice2])
	params.to_json
	# redirect "/surveys/#{params[:id]}/edit"
end

post '/test' do
	# binding.pry
	params.each do |question_id, answer|
		Question.find(question_id).find_choice(answer).increment_count
	end
	# p params {"22" => "yes", "23" => "you"}
end