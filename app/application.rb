class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split('/items/').last
      i = @@items.find { |i| i.name == item }
      if i.nil?
        resp.write 'Item not found'
        resp.status = 400
      else
        resp.write i.price
      end
    else
      resp.write 'Route not found'
      resp.status = 404
    end
    resp.finish
  end
end