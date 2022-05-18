class BlogController < ApplicationController
  def index

     @blogs=Blog.all
  end

  def show

    renderer=   Redcarpet::Render::HTML.new(render_options = {})
    markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
  
    blog = Blog.find_by(:title => params[:id])
    if blog
      file_path = "#{Rails.root}/public#{blog.attachment.to_s}"
      exist= File.exist?(file_path)
      if exist
        content = File.read(file_path)  
        @html=  markdown.render(content)
        @title=blog[:title]
        @blog=blog
      else
         render :template=>'blog/404'
       end
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
       redirect_to  action: 'index'
    else
    
      render :new, status: :unprocessable_entity
    end
  
  end
  def destroy
      @blog=Blog.find(params[:id])
      @blog.destroy
      # flash.now[:error] = "Could not save client" 
      flash[:notice] = "删除数据成功！"   
      redirect_to action: 'index'
  end
   private
     def blog_params
      params.require(:blog).permit(:title,  :attachment)
    
    end
end
