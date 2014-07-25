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

post '/surveys/:id' do
  responses = params.select{ |key, value| !key.to_i.zero? }
	responses.each do |question_id, answer|
		Question.find(question_id).find_choice(answer).increment_count
	end
	redirect '/'
end

post '/surveys/:id/questions' do
	survey = Survey.find(params[:id])
	survey.questions << Question.new(question: params[:new_question])

	survey.questions.last.choices << Choice.new(choice: params[:choice1])
	survey.questions.last.choices << Choice.new(choice: params[:choice2])
	params.to_json

end


get '/surveys/:id/results' do
  @survey=Survey.find(params[:id])
  @questions = @survey.questions
  erb :survey_results
end
