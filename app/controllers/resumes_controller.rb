class ResumesController < ApplicationController
  def index
    puts '2222222222222'
    puts  Resume.all.size
    @resumes = Resume.all
   
 end
 
 def new
    @resume = Resume.new
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
