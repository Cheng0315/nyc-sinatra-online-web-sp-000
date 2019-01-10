class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  post "/figures" do
    @figure = Figure.new
    @figure.name = params[:figure][:name]
    @figure.titles = params[:title]
    @figure.landmarks = params[:landmark]
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
end
