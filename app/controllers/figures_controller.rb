class FiguresController < Sinatra::Base
  # add controller methods
  set :views, 'app/views/figures'

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :new
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :edit
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

  post '/figures' do
    @figure = Figure.create(name: params[:name])
    if !params[:new_title].empty?
      @title = Title.create(name: params[:new_title])
      FigureTitle.create(title_id: @title.id,figure_id: @figure.id)
    end
    if !params[:title_ids].empty?
      params[:title_ids].each do |id|
        FigureTitle.create(title_id: id,figure_id: @figure.id)
      end
    end
    if !params[:landmark_ids].empty?
      params[:landmark_ids].each do |id|
        @landmark = Landmark.find(id)
        Landmark.create(name: @landmark.name, year_completed: @landmark.year_completed, figure_id: @figure.id)
      end
    end
    @landmark = Landmark.create(name: params[:new_landmark][:new_name],year_completed: params[:new_landmark][:new_year], figure_id: @figure.id)

    redirect "/figures/#{@figure.id}"
    end

    patch '/figures/:id' do
      binding.pry
      @figure = Figure.find(params[:id])

    end

end
