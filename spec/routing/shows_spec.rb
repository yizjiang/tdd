require 'spec_helper'

describe "shows" do
  it "should route the root to shows#index" do
    {:get => "/"}.should route_to(:controller => "shows", :action => "index")
  end

  it "should route /shows to shows#index" do
    {:get => '/shows'}.should route_to(:controller => "shows", :action => "index")
  end

  it "should route /shows/new to shows#new" do
    {:get => '/shows/new'}.should route_to(:controller => "shows", :action => "new")
  end

  it "should route /shows to shows#create" do
    {:post => '/shows'}.should route_to(:controller => "shows", :action => "create")
  end

  it "should route /shows to shows#destroy" do
    {:delete => '/shows/1'}.should route_to(:controller => "shows", :action => "destroy", :id => "1")
  end

  it "should route /shows to shows#edit" do
    {:get => '/shows/1/edit'}.should route_to(:controller => "shows", :action => "edit", :id => "1")
  end

  it "should route /shows to shows#update" do
    {:put => '/shows/1'}.should route_to(:controller => "shows", :action => "update", :id => "1")
  end

  it "should route /shows to shows#show" do
    {:get => '/shows/1'}.should route_to(:controller => "shows", :action => "show", :id => "1")
  end
end