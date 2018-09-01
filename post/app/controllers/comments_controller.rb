class CommentsController < ApplicationController

	def create

		# posting = Posting.find(params[:posting_id])
		# posting.comments.create(comments_params)
		# redirect_to posting

	    @posting = Posting.find(params[:posting_id])
	    @comment = @posting.comments.create(comments_params)
	  
	    redirect_to post_path(@posting)
	end

	private
	  def comments_params
	    params.require(:comment).permit(:body).merge(user: current_user) #verificado devise utiliza el helper current_user
	  end
end
