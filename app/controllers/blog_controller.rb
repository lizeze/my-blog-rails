class BlogController < ApplicationController
  def index

     @blogs=Blog.all
  end

  def show

    renderer=   Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
    blog=Blog.find(params[:id])
    puts '222222222222222222222222222222'
    puts blog.attachment
    file_path = "#{Rails.root}/public#{blog.attachment.to_s}"
    content = File.read(file_path)  
    @html=  markdown.render(content)  
   
  end

  def edit
  end

  def new
    @blog=Blog.new
  end

  def update

   
  end
  def create
    puts '22222222222222222222222222'
  
     @blog=Blog.new(blog_params)
     @blog.save

      
  end
  def destory
  end
   private
     def blog_params
      params.require(:blog).permit(:title,  :attachment)
    
    end
end
