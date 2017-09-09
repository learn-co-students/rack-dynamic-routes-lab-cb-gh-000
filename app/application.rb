class Application

	@@items = []
	def call(env)
		res = Rack::Response.new
		req = Rack::Request.new(env)

		 if req.path.match(/items/)
			name = req.path.split("/items/").last
			puts name
			item_result = @@items.detect {|item| item.name == name}
			if item_result
				res.write(item_result.price)
			else
				res.write("Item not found")
				res.status = 400
			end
		else
			res.write("Route not found")
			res.status = 404
		end
		res.finish
	end

end
