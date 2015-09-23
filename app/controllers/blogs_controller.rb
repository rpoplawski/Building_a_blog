class BlogsController < ApplicationController

  def index
      #render text: "params : #{params.inspect}"
      blogs = Blog.all
      respond_to do |f|
      f.html do
        render template: 'blogs/index.html.erb', locals: { blogs: blogs }
    end
      f.json do
        render json: blogs.to_json, status: 200
        end
      end
    end


  def new
      #render text: "params : #{params.inspect}"
      render json: Blog.new
    end

    def show
      #render text: "params : #{params.inspect}"
      blog = Blog.find(params[:id])
      if params[:include_blog]
         render template: 'blog/show.html.erb', locals: { blog: blog }
      else
         render template: 'blog/error.html.erb', locals: { blog: blog }
      end
    end


  def create
    if params[:message].nil? || params[:message].empty?
      render template: '/blog/error.html.erb', locals: { blog: blog }
    else
      blog = Blog.new
      blog.name = params[:message]
      blog.save
      render template: '/blog/create.html.erb', locals: { blog: blog}
    end
  end
end
