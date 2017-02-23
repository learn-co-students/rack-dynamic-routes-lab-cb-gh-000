class Application

  @@items = []

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last
      item = @@items.find{ |i| i.name.eql?(search_term) }
      if item.nil?
        res.write "Item not found"
        res.status = 400
      else
        res.write "#{item.price}"
      end
    else
      res.write "Route not found"
      res.status = 404
    end

    res.finish
  end
end
