puts 'Creating categories'

15.times do
  ItemCategory.create(
      name: Faker::Commerce.department(max: 1, fixed_amount: true),
      description: Faker::Lorem.paragraph
  )
end

categories = ItemCategory.pluck(:id)

puts 'Creating products'

1000.times do
  AccessoryItem.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      price_cents: (Faker::Commerce.price * 100).to_i,
      stock: rand(0..100),
      item_category_id: categories.sample
  )
end

if User.count == 0
  puts 'Creating a default user'
  
  User.create(email: 'shop@example.com', password: 'qwerty', admin: true)
end

puts 'Creating orders for the first user'

items = AccessoryItem.pluck(:id)
user = User.first

100.times do
  user.reload
  
  rand(1..25).times do
    item = AccessoryItem.find(items.sample)
    
    if item.stock > 0
      user.cart.add_item(item, rand(1..item.stock))
    end
  end
  
  order = Order.from_cart(user.cart, address: Faker::Address.full_address)
  order.save
  
  user.cart.reload
  user.cart.destroy!
end
