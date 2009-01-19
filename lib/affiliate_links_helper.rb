module Nucleus
  module AffiliateLinksHelper
    
    
    def affiliate_link_amazon_asin(asin)
      return amazon_link(:asin, asin)
    end
    
    def affiliate_link_amazon_isbn(isbn)
      return amazon_link(:isbn, isbn)
    end
    
    def affiliate_link_amazon_search(search, category=nil)
      return amazon_link(:search, URI.escape(search), category)
    end
    
    
    protected
      def amazon_link(type, code, category = nil)
        return AffiliateLinks.get_service_urls('amazon')[type].gsub('**HERE**', code).gsub('**CAT**', category || 'blended')
      end
  end
end