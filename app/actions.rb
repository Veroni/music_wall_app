# Homepage (Root path)
get '/' do
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
  @likes = @song.upvotes.count
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
  current_user 
  redirect '/'
end

post '/login' do
  user_name = params[:user_name]
  password = params[:password]
  user = User.where(user_name: user_name, password: password).first
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

post '/songs/:id/like' do
  if current_user
    upvote = Upvote.new(
      user: current_user,
      song_id: params[:id]
      )
    upvote.save
    redirect "/songs/#{params[:id]}"
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end