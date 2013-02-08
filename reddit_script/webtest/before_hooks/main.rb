before do
  redirect "/login" if !logged_in? && !["/login"].include?(request.path)
end