class Application


  @@items = [Item.new("Apples", 5), Item.new("Carrots", 10), Item.new("Salads", 7)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match("/items/")
      item_name = req.path.split("/items/").last
      item = @@items.find{ |i| i.name == item_name}
      if item
        resp.write "#{item.name} cost $#{item.price}."
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