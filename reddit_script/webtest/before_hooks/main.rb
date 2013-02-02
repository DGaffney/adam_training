before do
  redirect "/login" if !logged_in? && !["/login"].include?(request.path)
end

before '/request' do
  content_type :txt
end