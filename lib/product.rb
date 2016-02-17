class Product
	attr_reader :title, :price, :stock
	@@products = []

	def initialize options={}
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.find_by_title product_title
		@@products.each {|product| return product if product.title == product_title }
		raise NoRecordFoundError, "'#{product_title}' does not exist."
	end

	def in_stock?
		@stock > 0
	end

	def deduct_stock amount
		@stock -= amount
	end

	def self.in_stock
		@@products.map {|product| product if product.in_stock? }
	end

	private

	def add_to_products
		@@products.any? {|product| product.title.include?(@title)} ? (raise DuplicateProductError, "'#{@title}' already exists.") : @@products << self 
	end
end