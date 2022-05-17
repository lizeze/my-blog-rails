class BlogController < ApplicationController
  def index

     @blogs=Blog.all
  end

  def show

    renderer=   Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
    # blog=Blog.find(:first,params[:id])
    # blog=  Blog.find(:first, :conditions => [ "id = ?", params[:id]])

    blog = Blog.find_by(:id => params[:id])


    if blog
    file_path = "#{Rails.root}/public#{blog.attachment.to_s}"
    content = File.read(file_path)  
    @html=  markdown.render(content)  
    else
      render :template=>'blog/404'
    end
   
  end

  def edit
  end

  def new
    @blog=Blog.new
  end

  def update
  end
  def create
   
     @blog=Blog.new(blog_params)
     @blog.save
  
  end
      def destroy
        puts '2222222222222删除'
        blog=Blog.find(params[:id])
        blog.destroy
        redirect_to action: 'index'
      end
   private
     def blog_params
      params.require(:blog).permit(:title,  :attachment)
    
    end
end
