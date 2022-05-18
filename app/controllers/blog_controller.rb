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
    if  @blog.save
      # redirect_to blog_path, notice: "The resume #{@blog.name} has been uploaded."
      # redirect_to :blog_path
      flash[:notice] = "Post successfully created"
       redirect_to @blog
    else
      render 'new'
    end
  
  end
  def destroy
      @blog=Blog.find(params[:id])
      @blog.destroy
      flash.now[:notice]== "We have exactly   books available."
      redirect_to action: 'index'
  end
   private
     def blog_params
      params.require(:blog).permit(:title,  :attachment)
    
    end
end
