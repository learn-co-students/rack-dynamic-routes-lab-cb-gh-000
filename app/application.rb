class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    request = Rack::Request.new(env)

    if request.path.match(/items/)
      name = request.path.split("/items/").last
      if @@items.collect(&:name).include?(name)
        resp.write @@items.detect{|item| item.name == name}.price
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
