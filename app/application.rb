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
      else
        item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end


end
