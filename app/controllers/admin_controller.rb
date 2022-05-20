class AdminController < ApplicationController
  def index
    @blogs=Blog.all
    puts @blogs[0].describe
  end

  def create
  end

  def edit
  end

  def update
  end

  def new
  end
end
