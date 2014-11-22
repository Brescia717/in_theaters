#!/usr/bin/env ruby
require 'json'
require 'pry'

movie_data = JSON.parse(File.read('in_theaters.json'))

data_array = []
i = 0

movie_data['movies'].each do |movie|
  data_array << {title: movie['title'],
                 mpaa_rating: movie['mpaa_rating'],
                 year: movie['year'],
                 avg_score: ((movie['ratings']['critics_score'] +
                  movie['ratings']['audience_score']) / 2),
                 cast: movie['abridged_cast'][0..2].each {|actor| actor['name']}
               }
end
# a = data_array
# first_actors = []
# second_actors = []
# movie_data['movies'].each do |movie|
#   first_actors << movie['abridged_cast'][0]
#   second_actors << movie['abridged_cast'][1]
  # a[i].store(:first_cast_member, movie['abridged_cast'][0]['name'])
  # a[i].store(:second_cast_member, movie['abridged_cast'][1]['name'])
  # a[i].store(:third_cast_member, movie['abridged_cast'][2]['name'])
  # i += 1
# end

# top_three_actors = []
# data_array.each do |movie|
#   top_three_actors << movie[:title]

# actors_array = []
# top_three_actors = data_array.each do |movie|
#   movie[:cast][0..2].each do |actor|
#     actors_array << actor['name']
#   end
# end
binding.pry
