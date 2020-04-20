class ArchivesController < ApplicationController
  def index
    @archives = Archive.order(date: :desc).first(4)
    @djs = Dj.all
  end
end
  