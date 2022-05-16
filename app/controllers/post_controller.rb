class PostController < ApplicationController
  
    # def index
    #     renderer=   Redcarpet::Render::HTML.new(render_options = {})
    #     markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
    #     content = File.read("md/我的.md")  
    #     @html=  markdown.render(content)  
    #      render :template=>'post/index'
    # end
     def index
        @post=Post.all
     end
     def new
        @post=Post.new
     end
     def update
       @post=Post.find(params[:id]) 
     end
      def create
          
      end
      def edit
          
      end
      def show
        @post = Post.find(params[:id])
      end
     def destroy
        post=Post.find(params[:id])
        post.destroy
        redirect_to  action: 'index', status: :see_other
     end
   
      private
        def post_params
            params.require(:post).permit(:title, :path,:tags,:category)
            
        end
     
end
