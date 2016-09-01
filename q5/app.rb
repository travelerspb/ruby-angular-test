require 'bundler'
Bundler.require

TREE_DATA = File.open("data.txt").read

get '/*.css' do
  content_type 'text/css', charset: 'utf-8'
  filename = params[:splat].first
  scss filename.to_sym, views: "css"
end

get '/*.js' do
  content_type 'application/javascript', charset: 'utf-8'
  filename = params[:splat].first
  if File.exists?(File.join("js", "#{filename}.coffee"))
    coffee filename.to_sym, views: "js"
  else
    File.open(File.join("js", "#{filename}.js")).read
  end
end

get '/*.html' do
  filename = params[:splat].first
  File.open(File.join("html", "#{filename}.html")).read
end

get '/' do
  File.open(File.join("html", "app.html")).read
end

get '/data' do
  TREE_DATA
end
