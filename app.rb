require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"
require "./models"

enable :sessions

set :database, "sqlite3:app.db"

get "/" do
  if session[:user_id]
    erb :profile
  else
    erb :index
  end
end


get "/sign-in" do

  erb :sign_in
end


post "/sign-in" do

  @user = User.find_by(email: params[:email])
  puts "this better be my user: #{@user.inspect}"
  if @user && @user.password == params[:password]

    session[:user_id] = @user.id

    redirect "/profile"
  else

    flash[:warning] = "Your username or password is incorrect"


    redirect "/"
  end
end


get "/sign-up" do
  def username
    @name = params[:username]
  end

  erb :sign_up
end

post "/sign-up" do
  @user = User.create(
    username: params[:username],
    lastname: params[:lastname],
    password: params[:password],
    email: params[:email],
    birthday: params[:birthday],
    gender: params[:gender],
    propic: params[:propic]
  )
  @name = params[:username]

  session[:user_id] = @user.id

  redirect "/profile"
end


get "/sign-out" do

  session[:user_id] = nil

  redirect "/"
end

get "/new-post" do

  erb :new_post
end

post "/new-post" do
  @post = Post.create(
    title: params[:title],
    content: params[:content],
    image: params[:image]
  )
  session[:post_id] = @post.id

  redirect "/profile"
end

get "/profile" do

  @user = User.find(session[:user_id])
  @name = @user.username
  @propic = @user.propic
  @posts = @user.posts
  puts "i want my #{@posts}"
  # @posts = @user.profile.posts

  erb :profile
end

post "/profile" do

end
