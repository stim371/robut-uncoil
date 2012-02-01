require 'robut'
require 'uncoil'

class Robut::Plugin::RobutUncoil
  include Robut::Plugin
  
  QUESTION_REGEX = /^uncoil (.+)$/
  
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
  #
  def handle(time, sender_nick, message)
    
    #creates a new instance of the uncoil gem
    @uncoil = Uncoil.new
    
    if sent_to_me? message # and is_valid_input? message
      
      short_links = words(message, "uncoil")
      link_objects = @uncoil.expand(short_links)
      
      Array(link_objects).flatten.each do |link|
        reply "@#{sender_nick}, #{link.short_url} goes to #{link.long_url}"
      end
    else
      reply "@#{sender_nick}, something went wrong with your request: '#{message}'"
    end
  end
  
  def is_valid_input? message
    return true if QUESTION_REGEX =~ message
  end
  
end