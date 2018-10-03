class SavedSearchesController < ApplicationController
  def new
    @saved_search = current_user.saved_searches.build
  end

  def create
    @saved_search = current_user.saved_searches.build(saved_search_params)
    if @saved_search.save
      redirect_to settings_path, notice: 'Search saved'
    else
      render :new
    end
  end

  def edit
    @saved_search = current_user.saved_searches.find(params[:id])
  end

  def update
    @saved_search = current_user.saved_searches.find(params[:id])
    if @saved_search.save
      redirect_to settings_path, notice: 'Search updated'
    else
      render :new
    end
  end

  def destroy
    @saved_search = current_user.saved_searches.find(params[:id])
    @saved_search.destroy
    redirect_to settings_path, notice: 'Search deleted'
  end

  def index
    redirect_to settings_path
  end

  def show
    redirect_to settings_path
  end

  private

  def saved_search_params
    params.require(:saved_search).permit(:query, :name)
  end
end
