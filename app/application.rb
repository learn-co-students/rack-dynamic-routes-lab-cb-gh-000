class Application

  @@items = [Item.new("Figs",3.42),Item.new("juice",300)]
  def call(env)
    resp = Rack::Response.new
req = Rack::Request.new(env)
if req.path.match(/items/)
  item_name = req.path.split("/items/").last #turn /items/juice => juice
  item = nil
    item =@@items.find{|i| i.name == item_name}
if item != nil
  resp.write "#{item.price}"
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
