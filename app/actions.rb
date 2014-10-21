# Homepage (Root path)
get '/' do
  # @current_user ||= User.find session[:user_id]
  current_user
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

get '/users/new' do
  erb :'users/new'
end

get '/login' do
  erb :'login/index'
end

helpers do
  def current_user
    @current_user = session[:user_id] ? User.find(session[:user_id]) : nil
  end
end

post '/songs/new' do
  # song_user = current_user ? current_user.id : nil

  @song = Song.new(
    title:   params[:title],
    author:  params[:author],
    url:     params[:url],
    user:    current_user
    )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

post '/users/new' do
  @user = User.new(
    user_name: params[:user_name],
    email:     params[:email],
    password:  params[:password]
    )
  @user.save
  redirect '/'
end

post '/login' do
  user_name = params[:user_name]
  password = params[:password]
  user = User.where(user_name: user_name, password: password).first
  # binding.pry
  if user
    
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end