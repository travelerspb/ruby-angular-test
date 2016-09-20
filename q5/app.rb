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
  raw_data = TREE_DATA.split("\n").map { |i| i.split(',')}

  map = {}

  raw_data.each do |x|
    map[x[0]] = x
  end

  tree = {}

  raw_data.each do |x|
    pid = x[2]
    if pid == nil || !map.has_key?(pid)
      (tree[raw_data[0]] ||= []) << x
    else
      (tree[map[pid]] ||= []) << x
    end
  end
  tree.to_json
end


