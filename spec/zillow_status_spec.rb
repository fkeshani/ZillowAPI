describe 'Zillow Status API Requests' do

  let!(:base_url) { 'http://www.zillow.com/webservice' }
  let!(:connection) do
   Faraday.new(url: base_url) do |faraday|
      faraday.request :json
      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end

  context 'Check Zillow API Status' do
    let!(:endpoint) { 'GetSearchResults.htm' }
    let!(:response) { connection.get endpoint }

    it 'Responds with a 200 Success' do
      expect(response.status).to eq 200
    end
  end
end


