require 'rubygems'
require 'bundler/setup'
require 'logger'
Bundler.require(:default)
Dotenv.load

class BusDaemon

  def initialize
    db = Sequel.connect(
      :adapter=>'postgres', :host=>'localhost', :database=>'bus', 
      :user=>'admin', :password=>ENV['DATABASE_PASSWORD'])
    @locations = db[:locations]
    log
  end

  # record values to pg
  #
  def record
    # get all vehicle info
    rows = get

    # for each vehicle
    begin
      rows.each do |row|
        hash = {}
        # create insert hash
        column_names.each do |name|
          hash = hash.merge({ name.downcase => row[name.to_s]})
        end
        # insert vehicle info
        r = @locations.insert(hash)
      end
      #@log.info "recorded"
    rescue 
      @log.error "Rescued. get: #{rows}"
    end
  end

  # location table column names
  #
  def column_names
    [:bearing, :blockID, :delay, :direction, :expires, :extraBlockID,
     :garage, :inCongestion, :lastLocID, :lastStopSeq, :latitude,
     :loadPercentage, :locationInScheduleDay, :longitude, :messageCode,
     :newTrip, :nextLocID, :nextStopSeq, :offRoute, :routeNumber,
     :serviceDate, :signMessage, :signMessageLong, :time, :tripID , :type,
     :vehicleID]
  end

  # get data from trimet
  #
  def get
    url = "http://developer.trimet.org/ws/v2/vehicles?appid=#{ENV['TRIMET_APP_ID']}"
    response = Unirest.get( url )
    if response.code > 200
      # if not a 200 throw the error
      halt response.code, {'Content-Type' => 'text/json'}, response.body.to_s
    end
    response.body['resultSet']['vehicle']
  end

  def log
    path = '/home/todd/log/bus.log' if ENV['TODGRU_ENV'] == 'todgru'
    path = '/Users/todgru/google-drive/pdev/bus-daemon/log/bus.log' if ENV['TODGRU_ENV'] == 'test'
    @log = Logger.new(path, 'daily', 1024000)
    @log.progname = 'bus-daemon'
  end

end
