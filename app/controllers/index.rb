get '/' do
	erb :index
end

get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  Survey.create(params)
  redirect '/surveys/:id/edit'
end

get '/surveys/:id/edit' do
  erb :edit_survey
end
