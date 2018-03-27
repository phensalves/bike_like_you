class ConsumeApiService
  def initialize(options={})
    @api_key = ENV['SPRINGFIELD_API_KEY']
    @url     = URI.parse("https://springfield-biketipovc.herokuapp.com/trips")
    @trip    = JSON.parse(options)
  end

  def send_start_trip_message
    begin
      connect_to_api(@url)
    rescue Exception => e
      p e.message
    end
  end
  
  private
  def connect_to_api url
    http                      = Net::HTTP.new(url.host, url.port)
    http.use_ssl              = true

    request                   = Net::HTTP::Post.new(url)
    request["Accept"]         = 'application/json'
    request["Content-Type"]   = 'application/json'
    request["Authorization"]  = "Bearer #{@api_key}"
    request["Cache-Control"]  = 'no-cache'

    request.body              = @trip.to_json
    response                  = http.request(request)
    puts response.read_body
  end

end