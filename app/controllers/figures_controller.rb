class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do 
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do 
    erb :"figures/new"
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id' do 
    # binding.pry
    
    # unless params[:figure].keys.include("landmark_ids")
    #   params[:figure][:landmark_ids] = []
    # end
    

    @updated_figure = Figure.find(params[:id])
   
    @updated_figure.name = params[:figure][:name]
    
    @updated_figure.save
    redirect to "/figures/#{@figure.id}"
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])
  #  binding.pry
    unless params[:title][:name].empty?    
      @figure.titles << Title.create(params[:title])
    end
    

    unless params[:landmark][:name].empty?    
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect '/figures'
  end

end
