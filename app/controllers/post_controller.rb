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
       puts '修改了222222222222222'
        @post=Post.find(params[:id])
        if @post.update(post_params)
         redirect_to @post
       else
         render :edit, status: :unprocessable_entity
       end


     end
      def create
         @post = Post.new(post_params)
         @post.save
         redirect_to @post
      end
      def edit
         @post=Post.find(params[:id]) 
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
