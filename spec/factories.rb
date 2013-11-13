require_relative 'spec_helper'

FactoryGirl.define do
  factory :show do
    name 'Family Guy'
    picture 'http://someplace.com/somepic.png'
    episode_duration '45 min'
    genre 'Comedy'
    started_year 2008
#    initialize_with {Show.find_or_create_by_name(name)}
  end
end