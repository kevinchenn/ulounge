module PostsHelper
  def rating_ballot
    if current_user.nil?
      logger.debug "NIL USER"
      Rating.new
    elsif @rating = current_user.ratings.find_by_post_id(@post.id)
      logger.debug "UPDATE RATING"
      @rating
    else
      logger.debug "NEW RATING"
      logger.debug "#{@post.id}"
      current_user.ratings.new
    end
  end
  
  def current_user_rating
    if current_user.nil?
      0
    elsif @rating = current_user.ratings.find_by_post_id(@post.id)
      @rating.value
    else
      "N/A"
    end
  end
end
