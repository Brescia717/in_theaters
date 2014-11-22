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

names = []

puts "In Theaters Now:\n\n"
data_array.each do |movie|
  print "#{movie[:avg_score]} - #{movie[:title]} " +
        "(#{movie[:mpaa_rating]}) starring "
        movie[:cast].each do |item|
          names << item['name']
        end
        print names.join(", ")
        names = []
        puts
end
