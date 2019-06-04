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
  		if cart.keys.include?(item[:item])
        # puts cart.class
  			cart[item[:item]][:count] = cart[item[:item]][:count] - item[:num]
  			coupon_str = item[:item] + " W/ COUPON"
  			cart[coupon_str] = {
	  			:price 		=> item[:cost], 
	  			:clearance 	=> cart[item[:item]][:clearance], 
	  			:count 		=> coupons.count(item)
  				}
  		end
  	end
  	# puts cart.keys.include?("AVOCADO W/ COUPON")
   #  binding.pry
    return cart

end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # calculate total cost of cart and apply discounts/coupons
end


# binding.pry
