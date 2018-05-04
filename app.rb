require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"
# require "imgur-api"
require "./models"

enable :sessions

configure :development do
  set :database, "sqlite3:app.db"
end

configure :production do
  set :database, ENV["DATABASE_URL"]
end

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
  @filename = params[:propic][:filename]
  file = params[:propic][:tempfile]

  File.open("./public/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end
  @user = User.create(
    username: params[:username],
    lastname: params[:lastname],
    password: params[:password],
    email: params[:email],
    birthday: params[:birthday],
    gender: params[:gender],
    propic: @filename
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
  @filename = params[:image][:filename]
  file = params[:image][:tempfile]

  File.open("./public/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end
  @user = User.find(session[:user_id])
  @post = Post.create(
    title: params[:title],
    content: params[:content],
    image: @filename,
    user_id: @user.id
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


  erb :profile
end

post "/profile" do

end

get "/settings" do
  @user = User.find(session[:user_id])
  @name = @user.username + " " + @user.lastname
  @propic = @user.propic
  @email = @user.email
  @gender = @user.gender
  @birthday = @user.birthday
  # @delete = @user.destroy
  erb :settings
end

post "/settings" do
  @user = User.find(session[:user_id])

  @delete = @user.destroy
  @delete
  session[:user_id] = nil
  @user = @delete

  redirect "/"
end
