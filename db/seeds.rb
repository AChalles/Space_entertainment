# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Faker::Name.unique.clear #clear used values
Faker::UniqueGenerator.clear

Character.delete_all
Location.delete_all
Episode.delete_all
Show.delete_all
increment = 1
9.times do
  sWCharacterapi = "https://swapi.dev/api/people/?page=#{increment}"
  response = RestClient.get sWCharacterapi
  characters = JSON.parse response
  if !characters.nil?
    characters["results"].each do |c|
      show = Show.find_or_create_by(name: "Star Wars")
      if show && show.valid?
        homeworld = c["homeworld"]
        resp = RestClient.get homeworld
        home = JSON.parse resp
        birthPlace = ""
        if !home.nil?
          birthPlace = home["name"]
        end
        character = show.characters.create(
          name:         c["name"],
          gender:       c["gender"],
          birth_place:  birthPlace
        )
      end
    end
  end
  increment = increment + 1
end
increment = 1
6.times do
  sWLocationapi = "https://swapi.dev/api/planets/?page=#{increment}"
  response = RestClient.get sWLocationapi
  location = JSON.parse response
  if !location.nil?
    location["results"].each do |l|
      show = Show.find_or_create_by(name: "Star Wars")
      if show && show.valid?
        location = show.locations.create(
          name:   l["name"],
          dimension: "Star Wars Universe"
        )
      end
    end
  end
  increment = increment + 1
end

sWFilmsApi = 'https://swapi.dev/api/films'
response = RestClient.get sWFilmsApi
episodes = JSON.parse response
if !episodes.nil?
  episodes["results"].each do |e|
    show = Show.find_or_create_by(name: "Star Wars")
    if show && show.valid?
      episode = show.episodes.create(
        name:   e["title"],
        air_date:   e["release_date"],
        episode_number: e["episode_id"]
      )
    end
  end
end

increment = 1
7.times do
  RMLocationapi = "https://rickandmortyapi.com/api/location?page=#{increment}"
  response = RestClient.get RMLocationapi
  location = JSON.parse response
  if !location.nil?
    location["results"].each do |l|
      show = Show.find_or_create_by(name: "Rick & Morty")
      if show && show.valid?
        location = show.locations.create(
          name:       l["name"],
          dimension:  l["dimension"]
        )
      end
    end
  end
  increment = increment + 1
end

increment = 1
3.times do
  rMFilmsApi = "https://rickandmortyapi.com/api/episode?page=#{increment}"
  response = RestClient.get rMFilmsApi
  episodes = JSON.parse response
  if !episodes.nil?
    episodes["results"].each do |e|
      show = Show.find_or_create_by(name: "Rick & Morty")
      if show && show.valid?
        episode = show.episodes.create(
          name:   e["name"],
          air_date:   e["air_date"],
          episode_number: e["episode"]
        )
      end
    end
  end
  increment = increment + 1
end

increment = 1
5.times do
  rMCharacterapi = "https://rickandmortyapi.com/api/character?page=#{increment}"
  response = RestClient.get rMCharacterapi
  characters = JSON.parse response
  if !characters.nil?
    characters["results"].each do |c|
      show = Show.find_or_create_by(name: "Rick & Morty")
      if show && show.valid?

        character = show.characters.create(
          name:         c["name"],
          gender:       c["gender"],
          birth_place:  c["origin"]["name"]
        )
      end
    end
  end
  increment = increment + 1
end

100.times do
  character = Character.find(rand(182) + 1)
  location = Location.find(rand(184) + 1)
  episode = Episode.find(rand(57) + 1)
  show = Show.find(rand(2) + 1)
  user = User.find_or_create_by(
    full_name:  Faker::Name.unique.name,
    username:   Faker::Internet.unique.username,
    character:  character,
    location:   location,
    episode:    episode,
    show:       show,
    )


end