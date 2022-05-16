class PostController < ApplicationController
  
    def index
        renderer=   Redcarpet::Render::HTML.new(render_options = {})
        markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
        content = File.read("md/我的.md")  
        @html=  markdown.render(content)  
         render :template=>'post/index'
    end
    def show
         id=params[:id]
         
         @rows=Post.all
         render :template=>'post/list'
        
    end

    def create
        post=  Post.new(article_params)
        post.save
        redirect_to  action: :show
    end

     
     def new
        render :template=>'post/create'
     end
     def destroy
        @post = Post.find(params[:id])
        @post.destroy
     
        redirect_to action: :show
      end

      private
        def article_params
            params.require(:post).permit(:title, :path,:tags,:category)
            
        end
     
end
