class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      price = 0
      item_name = req.path.split("/items/").last

      @@items.each do |item|
        if item.name == item_name
          puts "HERE ==========="
          puts "#{item_name} ====="
          puts "#{item.name} ====="
          price = item.price
          # resp.status = 200
        end
      end

      if price != 0
        resp.write price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end


end
