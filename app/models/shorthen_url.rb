class ShorthenUrl < ApplicationRecord

	def bitly_shorten
		debugger
    client = Bitly.client 
    urls = URI.extract(self.content) 
     urls.each do |url|
        self.content.gsub(url, client.shorten(url).short_url) 
    end
  end
end
