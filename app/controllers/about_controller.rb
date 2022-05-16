class AboutController < ApplicationController

    def index
        render :template=>'about/index'
    end
    def show
        @article = Article.find(params[:id])
    end
end
