get '/' do
	erb :index
end

get '/survey/new' do
  erb :create_survey
end



