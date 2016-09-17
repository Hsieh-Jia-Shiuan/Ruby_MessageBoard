class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    #前端使用者傳回的資料，建立一個新的 post 物件
    post = Post.new(post_params)
    post.user = current_user

    #如果成功存進資料庫，就導回 index 頁面，失敗就再顯示一次表單
    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  private

	#確保 params 裡面的 post hash 存在，並且允許 title 和 content 被存取
	def post_params
	  params.require(:post).permit(:title, :content, category_ids: [])
	end
end