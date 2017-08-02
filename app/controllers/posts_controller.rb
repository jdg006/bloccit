class PostsController < ApplicationController
  def index
    @posts = Post.all
    censor
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def censor 
    
    Post.all.each_with_index do |post, index|
      if index %5 == 0
      @posts[index][:title] = 'SPAM'
      end
    end
      
    
  end
end

