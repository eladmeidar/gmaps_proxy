require 'nokogiri'
require 'open-uri'

class EmptyAddress < StandardError; end

class GmapsProxy
  
  GOOGLE_MAPS_URL = "http://maps.google.com/?hl=iw&q="
  attr_accessor :address
  
  def initialize(address = "Israel")
    @address = URI.encode(address)
  end

  def address=(new_address)
    self.address = URI.encode(address)
  end
  
  def pull
    doc = Nokogiri::HTML(open(url_with_address))
    image_tiles = doc.search("#inlineTiles img")
    
    table = ""

    table << "<tr>"
    count = 0
    image_tiles.each do |image_node|



        table << "<td><img src='#{image_node['src']}'/></td>"

        count += 1
        if count == 2
          table << "</tr>"
          table << "<tr>"
          count = 0
        end
    end
    table << "</tr>"

    output =<<-EOS
    <html>
    <head>
    <meta http-equiv=content-type content="text/html; charset=UTF-8" />
    <title>GoogleMaps Proxy</title>
    <style>
    * { margin:0; padding:0;, line-height:0; }
    div {
    	border:0;
    	background:red;
    }
    </style>
    </head>
    <body>
    <table cellpadding="0" cellspacing="0">
    #{table}
    </table>
    </body>
    </html>
    EOS

    return output
    
  end
  
  def url_with_address
    ensure_valid_address!
    [GOOGLE_MAPS_URL,self.address].join
  end
  
  def ensure_valid_address!
    raise EmptyAddress if (self.address.nil? || self.address.empty?)
  end
end