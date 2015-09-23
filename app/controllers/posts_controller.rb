class PostsController < ApplicationController

  def index
      #render text: "params : #{params.inspect}"
    render template: 'posts/index.html.erb', locals: { posts: Post.all}
  end


  def new
      #render text: "params : #{params.inspect}"
    render tempate: 'posts/new.html.erb', locals: { post: Post.new }
  end

  def show
    #render text: "params : #{params.inspect}"
   render template: 'posts/show.html.erb', locals: { post: Post.find(params[:id])}
  end

  def create
    # message, user_id
    post = Post.new
    post.title     = params.fetch(:post).fetch(:title)
    post.body      = params.fetch(:post).fetch(:body)
    post.published = false
    post.save
    if post.save
      redirect_to post_path(post)
    else
      redirect_to post_path
    end
  end
end
