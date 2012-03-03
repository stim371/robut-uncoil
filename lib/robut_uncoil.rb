require 'robut'
require 'uncoil'

class Robut::Plugin::RobutUncoil
  include Robut::Plugin
  
  #
  # @see http://www.rubular.com/?regex=%2F%5Euncoil%20(.%2B)%24%2F
  #
  
  #
  # @return [Array<String>] contains the various types of responses that are
  #   valid usage examples for the RobutUncoil Plugin
  #
  def usage
    [
      "#{at_nick} uncoil http://bit.ly/2EEjBl",
      "#{at_nick} uncoil http://is.gd/gbKNRq"
      ]
  end
  
  #
  # @param [Time] time at which the message has arrived
  # @param [String] sender_nick the sender
  # @param [String] message the message that was sent
  # @example message "format
  #     message # => "@uncoil uncoil http://bit.ly/232f23"
  # @example message "format
  #     message # => "@uncoilbot http://is.gd/u7o5lw"
  # @example message "format
  #     message # => "@uncoilbot http://bit.ly/232f23 http://tinyurl.com/2f23"
  def handle(time, sender_nick, message)
    
    if sent_to_me?(message)
      
      #creates a new instance of the uncoil gem
      @uncoil = Uncoil.new
      
      short_links = words(message, "uncoil")
      link_objects = @uncoil.expand(short_links)
      
      Array(link_objects).flatten.each do |link|
        reply "@#{sender_nick.split.first} #{link.short_url} => #{link.long_url}"
      end
    else
      reply "@#{sender_nick}, something went wrong with your request: '#{message}'"
    end
    
  rescue => exception
    reply "Oh oH! I broke and this is why! #{exception}"
  end
  
  def convert_from_short_url_to_response
    
    # uncoil
    # return response.long_url or nil
  end

end