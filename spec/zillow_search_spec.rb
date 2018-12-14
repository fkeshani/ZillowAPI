describe 'Zillow Search Body Respond' do
    
      let!(:base_url) { 'http://www.zillow.com/webservice' }
      let!(:connection) do
       Faraday.new(url: base_url) do |faraday|
          faraday.request :json
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter Faraday.default_adapter
        end
    end

    ##  These string should be URL encoded. [ zws-id , address , citystatezip] 

    context 'Search Criteria' do
        let!(:endpoint) { 'GetSearchResults.htm?zws-id=X1-ZWz187t6ccv4ln_3s95g&address=2114+Bigelow+Ave&citystatezip=Seattle%2C+WA' }
        let!(:response) { connection.get endpoint }
    
        it 'Responds API Search contain Adresss : 2114 Bigelow Ave ' do
            expect(response.body).to include("2114 Bigelow Ave")
        end

        it 'Responds API Search contain City : SEATTLE ' do
            expect(response.body).to include("SEATTLE")
        end

        it 'Responds API Search contain ZipID : 48749425 ' do
            expect(response.body).to include("48749425")
        end

        it 'Responds API Search for Home Detail Link : https://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid ' do
            expect(response.body).to include("https://www.zillow.com/homedetails/2114-Bigelow-Ave-N-Seattle-WA-98109/48749425_zpid/")
        end
    end
 
end
