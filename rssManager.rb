require 'open-uri'
require 'nokogiri'
require_relative 'rssData.rb'

class Manager
  
  def loadRssChannelFromUrl(rssUrl)
     
      # Read rss from url (using nokogiri library)
      xmlDoc = Nokogiri::XML(open(rssUrl))

      # Get/set rss channel node
      rChannelNode = xmlDoc.root.at_xpath("channel")

      # Create New RSS Channel
      rChannel = RChannel.new
      rChannel.Title =  xmlDoc.root.at_xpath("channel/title").content
      rChannel.Description =  rChannelNode.at_xpath("description").content
      rChannel.Link =  rChannelNode.at_xpath("link").content
      rChannel.PubDate =  rChannelNode.at_xpath("pubDate").content
      rChannel.RItems = loadRssItemsFromUrl(rssUrl)

      return rChannel

  end

  def loadRssItemsFromUrl(rssUrl)

      # Read RSS from url (using nokogiri library)
      xmlDoc = Nokogiri::XML(open(rssUrl))

      # Get Xml Nodes
      rNodes = xmlDoc.root.xpath("channel/item")

      # Store RssItem(s) temporarily
      rsslist = []

      for i in 0..rNodes.length - 1 do
        
        # Create New RSSItem
        rssItem = RItem.new
        rssItem.Title = rNodes[i].at_xpath("title").content
        #rssItem.Description = rNodes[index].at_xpath("description").content
        rssItem.Link = rNodes[i].at_xpath("link").content
        rssItem.Guid = rNodes[i].at_xpath("guid").content
        rssItem.PubDate = rNodes[i].at_xpath("pubDate").content
        # Adds new RSSItem to an array
        rsslist.push(rssItem)

      end

      return rsslist

  end

end
