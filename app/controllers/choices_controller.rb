class ChoicesController < ApplicationController
    def create
        # topicの特定
       @topic = Topic.find_by(id: params[:topic_id])
    #   選択肢の作成
       @choice = Choice.new(
        #   選択肢
           content: params[:content],
        #   投票数
           votes: 0,
        #   topicのid
           topic_id: @topic.id)
        #   choiceの保存
       if @choice.save 
           redirect_to topic_path(@topic)
     
       end
    end
    
    def votes
        # 投票する選択肢の特定
        @choice = Choice.find_by(id: params[:choice_id])
        #１増やす
        @choice.votes += 1
        # topicの特定
        @topic = Topic.find_by(id: @choice.topic_id)
         @done = Done.find_by(
            done_user: session[:user_id], 
            done_topic: @topic.id,
            done: 0)
        if @choice.save 
            # && @done.update(choice_id: @choice.id,done:1)
            redirect_to topic_path(@topic)
        end
    end
    def votes_cancel
        # 投票する選択肢の特定
        @choice = Choice.find_by(id: params[:choice_id])
        # topicの特定
        @topic = Topic.find_by(id: @choice.topic_id)
        #１減らす
        if @choice.votes > 0
            @choice.votes -= 1
        end
        # @done = Done.find_by(
            # done_user: session[:user_id],
            # done_topic: @topic.id,
            # choice_id: @choice.id,
            # done: 1)
        
        if @choice.save 
            # && @done.update(done: 0)
            redirect_to topic_path(@topic)
        end
    end
    # 選択肢の削除
    def destroy
        @choice =Choice.find_by(id: params[:choice_id])
        @topic = Topic.find_by(id: @choice.topic_id)
        # @done = Done.where(
        #     done_topic: @topic.id,
        #     choice_id: @choice.id)
        if @choice.destroy 
            # && @done.destroy_all
            redirect_to topic_path(@topic)
        end
    end
    
end



