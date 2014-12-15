require 'net/https'
require 'xmlsimple'
require "photo_from_flickr"

class FlickrApi

	def recent_photos_by_tag(tag)
		params = {
			"method" => "flickr.photos.search",
			"tags" => tag
		}
		xml_response = get_response(params)
		convert_xml_to_array (xml_response)
	end

	private
	def convert_xml_to_array(xml)
		photos = []

		XmlSimple.xml_in(xml)['photos'].first['photo'].each do |photo|
			photos << {
							farm: photo['farm'], 
							server: photo['server'], 
							id: photo['id'], 
							secret: photo['secret'], 
							title: photo['title']
							}
		end
		photos
	end

	private
	def get_response(params)
		params.merge!("api_key" => ENV['flickr_api_key'])
		uri = URI("https://www.flickr.com/services/rest/")
		uri.query = URI.encode_www_form(params)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		request = Net::HTTP::Get.new(uri.request_uri)
		http.request(request).body
	end
end