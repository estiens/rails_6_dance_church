class DjsController < ApplicationController
  def show
    @dj = Dj.find(params[:id])
    @archives = @dj.archives
  end
end
  