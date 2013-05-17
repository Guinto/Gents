class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @blogpost = current_user.blogposts.build
      @feed_items = current_user.feed.paginate(page: params[:args])
    end
  end
end
