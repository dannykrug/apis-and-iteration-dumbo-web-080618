require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  #films_string = RestClient.get('http://www.swapi.co/api/films/')
  #films_hash = JSON.parse(films_string)
  #binding.pry

  # CHARACTERS response_hash["results"][0]["films"]
  # MOVIES response_hash["results"][0]["title"]

  #if (character) is the same as character in the hash then return the film links
  # take the film lengths and get the titles

  response_hash["results"].each do |char|
    if char["name"] == character
      #binding.pry
      char["films"]
      return char["films"]

         #for each link use restclient and then parse and then find title


      #binding.pry
      end
    # puts response_hash["results"].each


      # movie = RestClient.get('http://www.swapi.co/api/films/')
      # movie_hash = JSON.parse(movie)
      # binding.pry
    end
  end
  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def print_movies(films_hash)
#binding.pry
  films_hash.each do |film|

  # some iteration magic and puts out the movies in a nice list
  movie = RestClient.get(film)
  movie_hash = JSON.parse(movie)
  puts movie_hash["title"]


  #movie_hash["results"].each do |title|
  end

end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end




## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
