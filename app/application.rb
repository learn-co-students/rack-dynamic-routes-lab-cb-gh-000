
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_ = req.path.split("/items/").last
      if it = @@items.find {|i| i.name == item_}
        resp.write it.price
      else
        resp.write("Item not found\n")
        resp.status = 400
      end
    else
      resp.write(req.path)
      resp.write("Route not found.\n")
      resp.status = 404
    end
    resp.finish
  end

end
