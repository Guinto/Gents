class BlogpostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def index
  end

  def create
    @blogpost = current_user.blogposts.build(params[:blogposts])
    if @blogpost.save
      flash[:success] = "Blogpost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @blogpost.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @blogpost = current_user.blogposts.find_by_id(params[:id])
      redirect_to root_url if @blogpost.nil?
    end
end