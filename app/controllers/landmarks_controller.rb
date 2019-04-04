class LandmarksController < ApplicationController
  # add controller methods
  set :views, 'app/views/landmarks'

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    Landmark.update(params[:id], name: params[:name], year_completed: params[:year_completed].to_i)
    redirect "/landmarks/#{params[:id]}"
  end

end
