get '/users/new' do
  erb :'users/new'
end

post '/users' do
  new_user = User.new(params[:user])
  if new_user.save
    redirect '/'
  else
    @errors = new_user.errors.full_messages
    erb :'users/new'
  end
  redirect '/'
end