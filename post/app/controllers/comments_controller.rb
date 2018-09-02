class CommentsController < ApplicationController
before_action :authenticate_user!


	def create

	  @posting = Posting.find(params[:posting_id])
	  @comment = @posting.comments.create(comments_params)
	    if @comment.save
	    redirect_to post_path(@posting), notice: "El comentario ha sido creado con éxito"	
		else
	    # puts " el id del post del momento es #{@posting.id}"
	    redirect_to post_path(@posting),alert: "el comentario no puede estar vacío"
		end
    end
	

	private
	  def comments_params
	    params.require(:comment).permit(:body,:posting_id,:user_id).merge(user: current_user) #verificado devise utiliza el helper current_user
	  end
end
