class IndexController < ApplicationController

    def index
        render :template =>'index' 

    end

     def archive
       render :template=>'archive' 
     end

end
