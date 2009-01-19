module Nucleus
  class AffiliateLinks
    
    @@affiliate_links_conf = 
      File.exists?("#{RAILS_ROOT}/config/affiliate_links.yml") ? YAML.load_file("#{RAILS_ROOT}/config/affiliate_links.yml") : nil
      
      # singleton methods
      class << self
        
        def get_service_urls(service)
          
          # check is we need to do a GeoIP lookup
          
          # if not, read country defined in config
          country = 'UK'
          
          case service
            
          when 'amazon'
            case country
            when 'UK'
              {
                :isbn   => "http://www.amazon.co.uk/gp/product/**HERE**?ie=UTF8&tag=#{@@affiliate_links_conf['AmazonTag']}",
                :asin   => "http://www.amazon.co.uk/gp/product/**HERE**?ie=UTF8&tag=#{@@affiliate_links_conf['AmazonTag']}",
                :search => "http://www.amazon.co.uk/gp/search?ie=UTF8&keywords=**HERE**&tag=#{@@affiliate_links_conf['AmazonTag']}&index=**CAT**"
              }
            when 'US'
              {
                :isbn => "http://www.amazon.com/exec/obidos/ISBN/**HERE**/#{@@affiliate_links_conf['AmazonTag']}",
                :asin => "http://www.amazon.com/exec/obidos/ASIN/**HERE**/#{@@affiliate_links_conf['AmazonTag']}"
              }
            end
              
          end
        end
        
      end
  end
end
