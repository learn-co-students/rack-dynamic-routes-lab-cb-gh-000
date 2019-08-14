class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    uri_match = req.path.match(/items/)
    if uri_match
      item = req.path.split("/items/").last
      item = @@items.find { |el| el.name == item }
      if item
        resp.write item.price
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
