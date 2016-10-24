configure do
  enable :sessions
end

before "/users/:id" do
  unless session[:id]
    redirect to("/")
  end
end
#primera vista default
get '/' do
  erb :index
end
#se agrega el usuario a la db y lo redirige a su id unico
post '/signup' do
  user = User.new(params[:user])
  if user
   user.id=  session[:user_id]
    redirect to("/users/#{user.id}")
  end
end

get '/signup' do
  erb :signup
end

#muestra el logeo de usuarios ya registrados
post '/login' do
  user = params[:user]
  puts user
  puts  user["email"]
  puts  user["password"]

  user = User.authenticate(user["email"], user["password"])
  if user == nil
    erb :error
  else
erb :bienvenido
  end
end

#despliega la vista login.erb
get '/login' do
  erb :login
end

#salir de la session
get '/logout' do
  session.clear
  redirect to ('/')
end
