class StaticPagesController < ApplicationController
  def home
  	 if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @feed_all = Micropost.all
  end

  def help
  end

  def about
  end

  def contact
  end
end
