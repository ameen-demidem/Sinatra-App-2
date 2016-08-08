# Homepage (Root path)
get '/' do
  erb :index
end

get "/songs" do
  @songs = Song.all
  erb :"songs/index"
end

get "/songs/new" do
  @song = Song.new(title: "title", author: "author")
  erb :"songs/new"
end

post "/songs" do
  puts params
  @song = Song.create(params)
  @song.persisted? ? redirect("/songs") : erb(:"songs/new")
end
