class DecorationsController < ApplicationController

  get "/decorations" do
    if logged_in?
      @decorations = Decoration.all
      erb :"decorations/index"
    else
      redirect "/login"
    end
  end

  get "/decorations/new" do
    if logged_in?
      erb :"decorations/new"
     else
      redirect "/login"
    end
  end

  post '/decorations' do
    if logged_in?
      @decorations = Decoration.create(params[:decoration])
      @decorations.user = current_user
      @decorations.save
      redirect "/decorations/#{@decoration.id}"
    else
      redirect "/login"
    end
  end

  get '/decorations/:id' do
    if logged_in?
      @decoration = Decoration.find_by_id(params[:id])
      erb :'decorations/show'
    else
      redirect "/login"
    end
  end

  get '/decorations/:id/edit' do
    if logged_in?
      @decoration = Decoration.find(params[:id])
        erb :'decorations/edit'
    else
      redirect "/login"
    end
  end

  post '/decorations/:id' do
    if logged_in?
    @decoration = Decoration.find(params[:id])

    redirect "/decorations/#{@decoration.id}"
      else
        redirect "/login"
      end
  end

  patch '/decorations/:id' do
    @decoration = Decoration.find(params[:id])
      @decoration.update(dec_name: params[:dec_name], color: params[:color], plant_id: params[:plant_id])
      redirect "/decorations/#{@decoration.id}"
  end

  get '/decorations/:id/delete' do
    if logged_in?
      @decoration = Decoration.find(params[:id])
      @decoration.delete
      redirect "/decorations"
    else
      redirect "/login"
    end
  end


end
