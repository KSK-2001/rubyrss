# Require the rssManager.rb and rssData.rb file
require_relative 'rssManager.rb'
require_relative 'rssData.rb'

class Application

   def Execute
   
      # Rss feed url from yahoo news!
      rssUrl = "https://news.yahoo.com/rss"
      
      # Create new RssManager which is imported from rssManager.rb
      rManager = Manager.new
      
      # Load RSS Feed from url, to an RChannel data model
      rChannel = rManager.loadRssChannelFromUrl(rssUrl)
      
      # Print channel info
      puts rChannel.Title
      puts rChannel.Description
      puts rChannel.Link
      puts rChannel.PubDate

      # Print RssItem(s) from an RChannel
      for i in 0..rChannel.RItems.length - 1 do
        puts rChannel.RItems[i].Title
        #puts rChannel.RItems[index].Description[0..20] # Show 20 characters
        puts rChannel.RItems[i].Link
        puts rChannel.RItems[i].Guid
        puts rChannel.RItems[i].PubDate
      end

   end

end

# Run application
application = Application.new
application.Execute
