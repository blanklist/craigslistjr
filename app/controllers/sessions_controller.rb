get '/sessions/new' do
  erb :'/sessions/new'  
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect "/categories"
  else
    @errors = @user.errors.full_messages['Email or password incorrect.']
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/categories'
end
