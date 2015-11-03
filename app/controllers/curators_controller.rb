class CuratorsController < ApplicationController

  def show
    @curator = Curator.find(params[:id])
    @collections = @curator.collections.order(updated_at: :desc)
  end

  def search
    @curators = Curator.search_curator(params[:c])
  end

  def profile
    @user = current_user
    render "show"
  end

  def update
    @curator = Curator.find(current_user.id)
    if @curator.update_attributes(valid_params)
    else
      flash[:errors] = "Curator cannot be saved!"
      redirect_to root_path
    end
    redirect_to curator_path(@curator)
  end

  private

  def valid_params
    params.require(:curator).permit(:username)
  end
end
