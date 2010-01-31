require 'nokogiri'
require 'open-uri'

class EmptyAddress < StandardError; end

class GmapsProxy
  
  GOOGLE_MAPS_URL = "http://maps.google.com/?hl=iw&q="
  attr_accessible :address
  
  def initialize(address = "Israel")
    @address = "Israel"
  end
  
  protected
  
  def pull
    doc = Nokogiri::HTML(open(url_with_address))
    tiles = doc.at_css("#inlineTiles")
  end
  
  def url_with_address
    ensure_valid_address!
    [GOOGLE_MAPS_URL,self.address].join
  end
  
  def ensure_valid_address!
    raise EmptyAddress if (self.address.nil? || self.address.blank?)
  end
end