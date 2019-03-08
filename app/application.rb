class Application

  def call(env)

    @@items = []

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path==(/item/)
      item_name = req.path.split("items/").last
      if item = @@items.find{|i| i.name == item_name}
      resp.write "You requested the cart"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
