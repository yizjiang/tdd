require 'spec_helper'


describe "Add new show" do

  it "should be able to add new shows" do
    visit "/"

    page.should have_content("Shows List")

    click_link("New Show")

    page.should have_content("New Show")

    fill_in "Name", :with => "Family Guy"
    fill_in "Picture", :with => "http://somephoto.com"
    fill_in "Duration of each episode", :with => "45 min"
    fill_in "Genre", :with => "Comedy"
    fill_in "Year of start", :with => "2008"

    click_button "Submit"

    page.should have_content "Shows List"
    page.should have_content "Family Guy"
    page.should have_content "http://somephoto.com"
    page.should have_button("Delete")
  end
end

describe "Update existing show" do
  #let(:show) { FactoryGirl.create(:show) }

  before do
    @show = FactoryGirl.create(:show)
  end

  it "should be able to edit a show" do
    visit "/"
    page.should have_content("Shows List")
    page.should have_button("Update")
    #within "#show_#{show.id}" do
    #  expect { click_button('Delete') }.to change(Show, :count).by(-1)
    #end
    click_button('Update', :match => :first)
    current_path.should == edit_show_path(@show.id)
    page.should have_content("Edit Show")
    page.should have_field("Name", :with => "Family Guy")
    page.should have_field("Picture", :with => "http://someplace.com/somepic.png")
    page.should have_field("Duration of each episode", :with => "45 min")
    page.should have_field("Genre", :with => "Comedy")
    page.should have_field("Year of start", :with => "2008")
  end

  it "should be able to update a show" do
    visit edit_show_path(@show.id)
    page.should have_content("Edit Show")
    fill_in "Name", :with => "Family Guy2"
    fill_in "Picture", :with => "http://somephoto.com2"
    fill_in "Duration of each episode", :with => "42 min"
    fill_in "Genre", :with => "Comedy2"
    fill_in "Year of start", :with => "2009"

    click_button('Update', :match => :first)

    page.should have_content "Shows List"
    page.should have_content "Family Guy2"
    page.should have_content "http://somephoto.com2"
    click_on('Family Guy2')
    page.should have_content('Duration of each episode: 42 min')
    page.should have_content('Genre: Comedy2')
    page.should have_content('Year of start: 2009')
  end
end

describe "Delete existing show" do
  before do
    FactoryGirl.create(:show)
  end

  it "should be able to delete a show" do
    visit "/"
    page.should have_content("Shows List")
    page.should have_button("Delete")
    #within "#show_#{show.id}" do
    #  expect { click_button('Delete') }.to change(Show, :count).by(-1)
    #end
    expect { click_button('Delete', :match => :first) }.to change(Show, :count).by(-1)
  end
end

describe "List show details" do
  before do
    @show = FactoryGirl.create(:show)
  end

  it "should be able to show a show details" do
    visit "/"
    page.should have_content("Shows List")
    page.should have_content("Family Guy")
    click_on('Family Guy')
    page.should have_content('Family Guy: Details')
    #page.should have_xpath('//img[@src="http://someplace.com/somepic.png"]') does not work....
    page.should have_content('Duration of each episode: 45 min')
    page.should have_content('Genre: Comedy')
    page.should have_content('Year of start: 2008')

  end
end