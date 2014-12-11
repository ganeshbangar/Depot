module ProductsHelper
	def format_currency
		price=number_to_currency(@product.price)
	end	
end
