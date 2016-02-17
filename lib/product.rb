class Product
	@@products = []

	def initialize opts={}
		@@products << self
	end

	def self.all
		@@products
	end
end