require 'pry'

def consolidate_cart(cart)
  con_cart = Hash.new
  cart.each do |item|
  	con_cart[item.keys.join] = item[item.keys.join]
  	con_cart[item.keys.join][:count] = cart.count(item)
  end
  # puts con_cart
  return con_cart

  # binding.pry
end

def apply_coupons(cart, coupons)
  	coupons.each_with_index do |item,i|
      # binding.pry
  		if cart.keys.include?(item[:item]) && cart[item[:item]][:count] >= item[:num]
  			cart[item[:item]][:count] = cart[item[:item]][:count] - item[:num]
  			coupon_str = item[:item] + " W/COUPON"
        
        if cart[coupon_str] == nil
          cart[coupon_str] = Hash.new
        end
	  		
        cart[coupon_str][:price] = item[:cost]
	  		cart[coupon_str][:clearance] = cart[item[:item]][:clearance]

        if cart[coupon_str].fetch(:count,0) == 0
          cart[coupon_str][:count] = 1
          # binding.pry
        else 
          cart[coupon_str][:count] += 1
          # puts "another coupon applied"
          # binding.pry
        end

        # binding.pry
  		end
  	end

    # binding.pry
    cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item, item_hash|
    # binding.pry
    if item_hash[:clearance] == true
      item_hash[:price] = (item_hash[:price] * 0.80).round(2)
    end
  end
  cart
  # binding.pry
end

def checkout(cart, coupons)
  # calculate total cost of cart and apply discounts/coupons
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  cart.each do |item, item_hash| 
    total += (item_hash[:price] * item_hash[:count])
    # binding.pry
  end

  if total >= 100
    total = total * 0.9
  end

  total
  # binding.pry
end


# binding.pry
