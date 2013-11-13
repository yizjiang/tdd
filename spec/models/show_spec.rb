require 'spec_helper'

describe Show do
  it { should validate_presence_of(:name).with_message("Please specify a name.") }
  it { should validate_presence_of(:picture).with_message("Please specify a picture.") }

  it "should be valid" do
    show = Show.new
    show.should respond_to :name
    show.should respond_to :picture
    show.should respond_to :episode_duration
    show.should respond_to :genre
    show.should respond_to :started_year
    show.valid?
  end
end