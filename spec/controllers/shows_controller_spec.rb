require 'spec_helper'

describe ShowsController do

  describe "#index" do
    before do
      @show = FactoryGirl.create(:show)
    end

    it "should be successful" do
      get :index

      response.should be_success
      assigns[:shows].should include(@show)
    end
  end

  describe "#new" do
    it "should be successful" do
      get :new

      response.should be_success
    end

    it "should create a new instance of a Show" do
      get :new

      assigns(:show).should be_an_instance_of(Show)
    end
  end

  describe "#edit" do
    before :each do
      @show = FactoryGirl.create(:show)
    end

    def perform
      get :edit, :id => @show.id
    end

    it "should redirect to the edit show" do
      perform
      response.should be_success
      assigns(:show).should eq(@show)
    end
  end


  describe "#create" do
    def perform
      post :create, :show => {:name => "Family Guy", :picture => "http://something.com/pic.png", :episode_duration => "45 min",
        :genre => "Comedy", :started_year => "2008"}
    end

    it "should redirect to the shows index" do
      perform

      response.should be_redirect
      response.location.should == shows_url
    end

    it "should create a Show" do
      lambda do
        perform
      end.should change(Show, :count).by(1)

      show = Show.last
      show.name.should == "Family Guy"
      show.picture.should == "http://something.com/pic.png"
      show.episode_duration == '45 min'
      show.genre == "Comedy"
      show.started_year = "2008"
    end

    describe "when passing invalid input" do
      it "should not create a show" do
        lambda do
          post :create, :show => {:name => "Family Guy"}
        end.should_not change(Show, :count)

        response.should_not be_success
      end
    end
  end

  describe "#update" do
    before :each do
      @show = FactoryGirl.create(:show)
    end

    def perform
      put :update, :id => @show.id, :show => {:name => "Family Guy2", :picture => "http://something.com/pic.png2", :episode_duration => "42 min",
        :genre => "Comedy2", :started_year => "2009"}
    end

    it "should redirect to the shows index" do
      perform

      response.should be_redirect
      response.location.should == shows_url
    end

    it "should update a Show" do
      perform
      @show.reload
      @show.name.should == "Family Guy2"
      @show.picture.should == "http://something.com/pic.png2"
      @show.episode_duration.should == '42 min'
      @show.genre.should == "Comedy2"
      @show.started_year.should == 2009
    end

    describe "when passing invalid input" do
      it "should not update a show" do
        lambda do
          put :update, :id => @show.id, :show => {:name => "Family Guy2", :picture => ''}
        end

        response.should_not be_redirect
        @show.reload
        @show.name.should == "Family Guy"
      end
    end
  end

  describe "#show" do
    before :each do
      @show = FactoryGirl.create(:show)
    end

    def perform
      get :show, :id => @show.id
    end

    it "should redirect to the shows detail page" do
      perform

      response.should be_success
      assigns(:show).should eq(@show)
    end

  end

  describe "#destroy" do
    before :each do
      @show = FactoryGirl.create(:show)
    end

    def perform
      delete :destroy, :id => @show.id
    end

    it "should redirect to the shows index" do
      perform

      response.should be_redirect
      response.location.should == root_url
    end

    it "should delete a Show" do
      lambda do
        perform
      end.should change(Show, :count).by(-1)
    end
  end

end