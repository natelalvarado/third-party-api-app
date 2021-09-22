class ArticlesController < ApplicationController
  user_search = params[:search] 
  response = HTTP.get("https://newsapi.org/v2/everything?q=#{user_search}&apiKey=e4459a33cef74ba79600b9084994142f")   
  articles = response.parse(:json)[:articles]
  render json: articles
end
