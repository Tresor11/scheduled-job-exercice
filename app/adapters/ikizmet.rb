 class Ikizmet

  API_URL = 'https://dashboard-qa.ikizmet.com/api/v2/tests'

  def initialize
  end

  def clients_info
    request = get("#{API_URL}/client_info.json")
    request.run
    request.response
  end

  def clients_sales
    request = get("#{API_URL}/client_sales.json")
    request.run
    request.response
  end

  private

  def get(url)
    request(url)
  end

  def request(*options)
    Typhoeus.before do |request|
      request.on_complete do |response|
        if response.success? && response.body.present?
          JSON.parse(response.body)
        else
          {}
        end
      end
    end

    Typhoeus::Request.new(*options)
  end

 end