class HeloController < ApplicationController
  layout 'helo'

  def index
    @header = "layouts sample"
    @footer = "copyright SYODA-Tuyano 2018"
    @title = "New Layouts"
    @msg = "this is sample page!"
  end
end
