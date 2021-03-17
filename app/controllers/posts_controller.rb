class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		
	  @post = Post.create(post_params(:title, :description))
	  redirect_to post_path(@post)
	end

	def update
	 edit
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	def post_params(*arg)
		params.require(:post).permit(*arg)
	end
end
