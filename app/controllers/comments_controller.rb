class CommentsController < ApplicationController

  def index
      #render text: "params : #{params.inspect}"
        render template: 'comments/index.html.erb', locals: { comments: Comment.all}
    end

  def new
    #render text: "params : #{params.inspect}"
    user_options = User.all.map { |u| [u.name, u.id] }
    render tempate: 'comments/new.html.erb', locals: {
      comment: Comment.new,
      user_options: user_options
    }
  end

  def show
    #render text: "params : #{params.inspect}"
    comment = Comment.find(params[:id])
    if params[:include_comment]
       render template: 'comment/show.html.erb', locals: { comment: comment }
    else
       render template: 'comment/error.html.erb', locals: { comment: comment }
    end
  end

  def create
    comment = Comment.new
    comment.message   = params.fetch(:comment).fetch(:body)
    comment.published = false
    if comment.save
      redirect_to comment_path(comment)
    else
      redirect_to comments_path
    end
  end

  def update
  end

  def destroy
    if Comment.exists?(params[:id])
       Comment.destroy(params[:id])
    end
    redirect_to comments_path
  end
end

#def destroy
#    #render text: "params : #{params.inspect}"
#    if Comment.exists?(params[:id])
#      comment = Comment.find(params[:id])
#      comment.destroy
#      render template: { message: "User Deleted Successfully." }, status: 200
#    else
#      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
#    end
#  end


 #  if params[:body].nil? || params[:body].empty?
 #     render template: '/comment/error.html.erb', locals: { comment: comment }
 #   else
 #     comment = Comment.new
 #     comment.name = params[:body]
 #     comment.save
 #     render template: '/comment/create.html.erb', locals: { comment: comment}
 #   end
 # end
