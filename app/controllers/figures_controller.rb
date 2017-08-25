class FiguresController < ApplicationController


  get '/' do
    erb :index
  end

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:figure][:title] != ""
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:figure][:title] != ""
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    erb :'figures/show'
  end

end
