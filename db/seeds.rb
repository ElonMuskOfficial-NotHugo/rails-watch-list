require "json"
require "rest-client"

puts "Cleaning database..."
Movie.destroy_all

api_key = "<your_api_key>"
response = RestClient.get "http://tmdb.lewagon.com/movie/top_rated?api_key=#{api_key}"
data = JSON.parse(response.body)
image_api = "https://image.tmdb.org/t/p/w500"

puts "Creating fake movies..."
data["results"].each do |movie_data|
  title = movie_data["original_title"]
  overview = movie_data["overview"]
  poster_url = "#{image_api}#{movie_data['poster_path']}"
  rating = movie_data["vote_average"]
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "Finished!"
