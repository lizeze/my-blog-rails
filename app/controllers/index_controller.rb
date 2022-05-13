require 'redcarpet'
require 'redcarpet/render_strip'
class IndexController < ApplicationController

    def index
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
       @html= Markdown.new("**This** _is_ an [example](http://example.org/).").to_html
       render :template =>'index' 
    end

  
end
