class PostController < ApplicationController
  
    def index
        renderer=   Redcarpet::Render::HTML.new(render_options = {})
      markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
        content = File.read("md/README.md")  
           @html=  markdown.render(content)  
        
           render :template=>'post/index'
    end
end
