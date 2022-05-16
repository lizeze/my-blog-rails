class PostController < ApplicationController
  
    def index
        renderer=   Redcarpet::Render::HTML.new(render_options = {})
        markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
        content = File.read("md/我的.md")  
        @html=  markdown.render(content)  
         render :template=>'post/index'
    end
    def show

         render :template=>'post/list'
        
    end

    def create
        post=  Post.new(params.permit(:tags, :title,:category,:path))
        post.save
        redirect_to  action: :show
    end

     def post_add
       
        render :template=>'post/create'
         
     end
     def new
        redner json:['222']
     end
     
end
