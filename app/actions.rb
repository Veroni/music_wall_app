# Homepage (Root path)
get '/' do
  @current_user ||= User.find session[:user_id]
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

# helper do
#   def current_user
#     @current_user ||= User.find(session[user_id])
#   end
# end

post '/songs/new' do
  @song = Song.new(
    title:  params[:title],
    author: params[:author],
    url:    params[:url]
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
  user = User.where(user_name: user_name)[0]
  # binding.pry
  if user
    
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

post '/logout' do
  session.clear
end