class FiguresController < ApplicationController

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    @figure = Figure.create(params[:figure])
    if !params[:landmark][:name].empty? && !params[:landmark][:year_completed].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    if !params[:title][:name].empty?
      @title = Title.create(params[:title][:name])
      @figure.landmarks << @landmark
    end
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
end
