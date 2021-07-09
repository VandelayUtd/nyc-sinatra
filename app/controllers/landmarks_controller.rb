class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do 
    erb :"landmarks/index" 
  end
end
