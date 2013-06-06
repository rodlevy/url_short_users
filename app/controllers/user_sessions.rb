post '/create_user' do
  new_user = User.create(params[:user])
  session[:user_id] = new_user.id
  redirect '/'

end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:user])
  if @user
     session[:user_id] = @user.id
    redirect to '/'
  else
    redirect to '/'
  end
end

# get '/secret_page' do
#   if current_user
#     erb :secret_page
#   else 
#     redirect '/'
#   end
# end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

get '/' do
  @urls = Url.all
  p @urls
  erb :index
end

post '/urls' do
  p @long_url = params[:url]
  if current_user
    @url = Url.create(:url       => @long_url,
                      :user_id   => current_user.id )
  else
    @url = Url.create(:url       => @long_url)
  end

  @error = @url.errors.messages[:url]

  if @url.invalid?
    erb :error
  else
    @urls = Url.all
    erb :index
  end
end

get '/:short_url' do
  @url = Url.find_by_url_short(params[:short_url])
  @url.increment!(:click_count)
  redirect to("http://#{@url.url}")
end


get '/users/:id' do
  @urls = Url.find_all_by_user_id(current_user.id)
  p @urls
  erb :my_urls
end

