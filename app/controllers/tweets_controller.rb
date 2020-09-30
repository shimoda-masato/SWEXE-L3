class TweetsController < ApplicationController
  def index
     @Tweets = Tweet.all
  end
  
  def new
     @Tweet = Tweet.new
  end
  
  def create
    @Tweet = Tweet.new(message: params[:tweet][:message])
    if @Tweet.save
      flash[:notice] = "1レコード追加しました"
       redirect_to '/'
    else
       render 'new'
    end
    
  end
  
  def show
    @Tweet = Tweet.find(params[:id])
  end
  
  def edit
    @Tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(message: params[:tweet][:message])
    flash[:notice] = "更新しました"
    redirect_to '/'
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = "1レコード削除しました"
    redirect_to '/'
  end
end
