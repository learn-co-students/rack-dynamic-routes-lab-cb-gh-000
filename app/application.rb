class Application

  @@items = Array.new

  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match("/items/")
      item_name = request.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}

      if item
        response.write item.price
        response.status = 200
      else
        response.write "Item not found"
        response.status = 400
      end
    else
      response.write "Route not found"
      response.status = 404
    end

    response.finish

  end

end
