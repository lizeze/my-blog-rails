class ResumesController < ApplicationController
  def index
  
    @resumes = Resume.all
   
 end
 
 def new
    @resume = Resume.new
 end
 def edit
 
   @resume=Resume.find(params[:id])
end
def show
  @resume=Resume.find(params[:id])
end
 
 def create
    @resume = Resume.new(resume_params)
    
    if @resume.save
       redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
    else
       render "new"
    end
    
 end
 
 def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
 end
 
 private
    def resume_params
    params.require(:resume).permit(:name, :attachment)
 end
 
end
