class TopicsController < ApplicationController
    # top画面表示
    def index
        @topics = Topic.all.order(created_at: 'desc')
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
    # 自分の作成した記事一覧詳細
    def mytopics
        @mytopics = Topic.where(user_id: session[:user_id])
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
    # 検索機能
    def search 
          @posts = Topic.search(params[:keyword])
          @keyword = params[:keyword]
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
        
    # 投稿詳細
    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
        @topic = Topic.find(params[:id])
        @choices = Choice.where(topic_id: @topic.id)
        @total = Choice.where(topic_id: @topic.id).sum(:votes)
    end
    # 新規投稿作成
    def new
        @topic = Topic.new()
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
       
    end
    def create
         if session[:user_id]
            @user = User.find(session[:user_id])
        end
        # 投稿
        @topic = Topic.new(topic_params)
        # user_idにログインしている人のid
        @topic.user_id = session[:user_id]
        # 保存
        if @topic.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    # 編集画面
    def edit
        @topic = Topic.find(params[:id])
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
    # 更新機能
    def update
        @topic = Topic.find(params[:id])
         if @topic.update(topic_params)
            redirect_to topic_path(@topic)
         else
            render 'new'
         end
    end
    
    # 削除機能
    def destroy
        @topic = Topic.find(params[:id])
        @choices = Choice.where(topic_id: @topic.id)
       if @topic.destroy && @choices.destroy_all
        redirect_to topics_path
       end
    end
    # strong parameter
    private 
    def topic_params
        params.require(:topic).permit(:title, :body)
    end
end
