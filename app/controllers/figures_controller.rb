class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    @figure = Figure.new
    @figure.name = params[:figure][:name]
    @figure.titles = params[:figure][:title_ids]
    @figure.landmarks = params[:figure][:landmark_ids]
    @figure.save
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
end
