require 'mechanize'

CAL = 'cal'
agent = Mechanize.new

# ローソンのおにぎりの情報を取得
page = agent.get('https://www.lawson.co.jp/recommend/original/rice/')
products = page.search('article section ul li')

products.each do |product|
  elements = product.search('p')
  title = product.search('p.ttl').inner_text.gsub("　", "")
  price = product.search('p.price').inner_text

  calorie_element_num = 0

  elements.each.with_index do |element,  index|
    calorie_element_num = index if element.inner_text.include?(CAL) 
  end

  calorie = elements[calorie_element_num].inner_text

  puts "#{ title } #{ calorie } #{ price }"
end