# app/middleware/page_hits_logger.rb
class PageHitsLogger
  # pry
  def initialize(app)
    @app = app

    # create logger
    @logger = ActiveSupport::Logger.new(Rails.root.join('log', 'hits.log'), 5, 10.megabytes)
  end

  def call(env)
    # Create a new request object to access request details
    request = Rack::Request.new(env)
    # binding.pry
  # pry
    
    # Extract the request path and other data if needed
    path = request.path
    url = request.url
    user_agent = request.user_agent

    # Log the page hit using Rails logger
    @logger.info "Page Hit: Date=#{Date.today}, Path=#{path}, URl=#{url}, User-Agent=#{user_agent}"

    # Optionally, log to the database (e.g., create a PageHit model)
    # PageHit.create!(path: path, ip_address: ip_address, user_agent: user_agent)

    # Call the next middleware in the stack
    @app.call(env)
  end
end

