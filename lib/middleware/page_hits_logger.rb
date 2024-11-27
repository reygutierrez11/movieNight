# app/middleware/page_hits_logger.rb
class PageHitsLogger
  pry
  def initialize(app)
    @app = app
  end

  def call(env)
    # Create a new request object to access request details
    request = Rack::Request.new(env)
  pry
    
    # Extract the request path and other data if needed
    path = request.path
    ip_address = request.ip
    user_agent = request.user_agent

    # Log the page hit using Rails logger
  pry
    Rails.logger.info "Page Hit: Path=#{path}, IP=#{ip_address}, User-Agent=#{user_agent}"

    # Optionally, log to the database (e.g., create a PageHit model)
    # PageHit.create!(path: path, ip_address: ip_address, user_agent: user_agent)

    # Call the next middleware in the stack
    @app.call(env)
  end
end

