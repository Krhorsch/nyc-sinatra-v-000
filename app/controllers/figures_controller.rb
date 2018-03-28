class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    @figure.title_ids = params["figure"]["title_ids"]
    @figure.landmark_ids = params["figure"]["landmark_ids"]
    if params["title"]["name"]
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end
    if params["landmark"]["name"]
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(name: params["figure"]["name"], title_ids: params["figure"]["title_ids"], landmark_ids: params["figure"]["landmark_ids"])
    if params["title"]["name"]
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end
    if params["landmark"]["name"]
      @landmark = Landmark.create(name: params["landmark"]["name"])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :"/figures/show"
  end
end
