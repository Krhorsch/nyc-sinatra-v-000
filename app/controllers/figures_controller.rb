class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do

  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :"/figures/edit"
  end

  patch '/figures' do

  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :"/figures/show"
  end
end
