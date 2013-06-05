# get '/' do
#   @urls = Url.all
#   erb :index
# end

# post '/urls' do
#   p @long_url = params[:url]
#   @url = Url.create(:url       => @long_url)
#   @urls = Url.all
#   erb :index
# end

# get '/:short_url' do
#   @url = Url.find_by_url_short(params[:short_url])
#   @url.increment!(:click_count)
#   redirect to("http://#{@url.url}")
# end


# get '/users/:id' do
# end
