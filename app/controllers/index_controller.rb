require 'redcarpet'
require 'redcarpet/render_strip'
class IndexController < ApplicationController

    def index
      @rows = Array[]
      bar = Bar.new
      bar.name = 1
      @rows << bar
      render :template =>'index'   
    end

  
end
