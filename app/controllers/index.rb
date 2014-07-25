get '/' do
	erb :index
end

get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  survey = Survey.create(params)
  redirect "/surveys/#{survey.id}/edit"
end

get '/surveys/:id/edit' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :edit_survey
end
