class PostsController < ApplicationController
	 before_action :authenticate_user!, :only => [:new, :create , :edit, :update , :destroy]
  #métodos que son solo accesibles para el usuario autenticado
  def index
  	@postings = Posting.all.order("created_at ASC")
  	@users = User.all
  end

  def show
    @posting = Posting.find(params[:id])
  end

  def new
  	@posting = Posting.new
  end

  def create
  	@posting = Posting.new(post_params)
      @posting.user = current_user #helper creado
  	if @posting.save
  		redirect_to posts_path, notice: "El post ha sido creado con éxito"
  	else
  		render :new
  	end
  end

  def edit
  	@posting = Posting.find(params[:id])
  end

  def update
  	@posting = Posting.find(params[:id])
  	if @posting.update(post_params)
  		redirect_to posts_path, notice: "El post fué modificado exitosamente"
  	else
  		render :edit
  	end
  end

  def destroy
  	@posting = Posting.find(params[:id])
  	@posting.destroy!
  	redirect_to posts_path, notice: "El post ha sido eliminado con éxito"
  end

  protected
    def post_params
      params.require(:posting).permit(:title, :body, :created_at, :updated_at)
    end
end
