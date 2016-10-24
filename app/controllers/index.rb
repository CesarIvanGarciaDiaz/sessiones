enable :sessions
before "/profile/:id" do
  unless session[:id].inspect
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
  if user.save
    session[:id].inspect = user.id
    redirect to("/profile/#{user.id}")
  end
end

get '/signup' do
  erb :signup
end

#despliega la vista bienvenido una vez logeado con el id


#muestra el logeo de usuarios ya registrados
post '/login' do
user =params[:user]
user = User.authenticate(user["email"],user["password"])
  #user = User.authenticate(user["em
puts user
  if user== nil
    erb:error
  else
    id = user.id
    session[:id] = id
    redirect to("/profile/#{id}" )

end
end
before "/profile/:id" do
  unless session[:id].inspect
    redirect to("/")
  end
end

get '/profile/:id'do
erb :bienvenido
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
