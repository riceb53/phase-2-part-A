enable :sessions

get '/' do
  p session[:user_id]
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:email])
  p @user
  p params
  if @user == nil || @user.password != params[:password]
    @fail = "Your email or password is incorrect"
    erb :login
  else
    session[:user_id] = @user.id
    session[:user_email] = @user.email
    p session[:user_id]
    redirect '/'
  end
end

post '/logout' do
  session[:email] = nil
  session[:user_id] = nil
  redirect '/login'
end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.create(params)

  p @user
  redirect '/login'
end

get '/homepage' do
  if session[:user_id]
    @items = Item.all
    erb :homepage
  else
    redirect '/login'
  end
end


get '/items/new' do
  erb :new_item
end

post '/items/new' do
  @item = Item.create(params)
  p @item
  redirect '/homepage'
end

get '/items/:id' do
  @item = Item.find(params[:id])
  erb :item
end

get '/items/:id/edit' do
  @item = Item.find(params[:id])
  erb :edit_item
end

put '/items/:id/edit' do
  @item = Item.find(params[:id])
  @item.update_attributes(title: params[:title], description: params[:description])
  redirect '/homepage'
end

get "/items/:id/delete" do
  @item = Item.find(params[:id])
  @item.destroy
  redirect '/homepage'
end
