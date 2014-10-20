# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  erb :'messages/index'
end

get '/messages' do
  @messages = Messages.all
  erb :'messages/index'
end

post '/messages' do
  @message = Message.new(
    subject: params[:subject],
    content: params[:content],
    author:  params[:author]
  )
  @message.save
  redirect '/messages/new'
end
