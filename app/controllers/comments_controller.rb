class CommentsController < ApplicationController

def index
      #render text: "params : #{params.inspect}"
      comments = Comment.all
      respond_to do |f|
      f.html do
        render template: 'comments/index.html.erb', locals: { comments: comments }
    end
      f.json do
        render json: comments.to_json, status: 200
        end
      end
    end


  def new
      #render text: "params : #{params.inspect}"
      render json: Comment.new
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
    if params[:body].nil? || params[:body].empty?
      render template: '/comment/error.html.erb', locals: { comment: comment }
    else
      comment = Blog.new
      comment.name = params[:body]
      comment.save
      render template: '/comment/create.html.erb', locals: { comment: comment}
    end
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
