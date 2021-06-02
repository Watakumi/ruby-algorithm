require 'mechanize'
agent = Mechanize.new

# ローソンのおにぎりの情報を取得
page = agent.get('https://www.lawson.co.jp/recommend/original/rice/')
products = page.search('article section ul li')

products.each do |product|
  puts "#{product.search('p')[1].inner_text } #{product.search('p')[2].inner_text} #{product.search('p')[3].inner_text} #{product.search('p')[4]&.inner_text}"
end