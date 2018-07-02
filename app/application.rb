class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = Items.find{|i| i.name = item_name}
      if !item
        resp.status = 400
        resp.write "Item not found"
      item.price
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end


end
