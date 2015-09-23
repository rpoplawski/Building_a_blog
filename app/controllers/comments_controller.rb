class CommentsController < ApplicationController

  def index
      #render text: "params : #{params.inspect}"
        render template: 'comments/index.html.erb', locals: { comments: Comment.all}
  end

  def new
    #render text: "params : #{params.inspect}"
    x = Post.all.map { |p| [p.name, p.title] }
    render tempate: 'comments /new.html.erb', locals: { comment: Comment.new, post_options: x }
  end

  def show
    #render text: "params : #{params.inspect}"
    render template: 'comments/show.html.erb', locals: { comment: Comment.find(params[:id])}

  end

  def create
    # message, user_id
    comment = Comment.new
    comment.message   = params.fetch(:comment).fetch(:message)
    comment.save
    redirect_to posts_path
  end
end
