class CommentsController < ApplicationController
before_action :authenticate_user!

	def new
		@comments = Comment.new
	end

	def create
	    @posting = Posting.find(params[:posting_id])
	    @comment = @posting.comments.create(comments_params)
	    redirect_to post_path(@posting), notice: "El comentario ha sido creado con éxito"	
	end

	def show
  	@comments = Comment.find(params[:posting_id])
  	end

	def edit
  	@comments = Comment.find(params[:posting_id])
  	end

	private
	  def comments_params
	    params.require(:comment).permit(:body).merge(user: current_user) #verificado devise utiliza el helper current_user
	  end
end
