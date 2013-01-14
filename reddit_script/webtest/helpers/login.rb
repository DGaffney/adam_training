module LoginHelper
  def logged_in?
    return !session[:user].nil?
  end
end