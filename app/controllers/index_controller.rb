require 'redcarpet'
require 'redcarpet/render_strip'
class IndexController < ApplicationController

    def index
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
     
       render :template =>'index' 
    end

  
end
