require 'robut'
require_relative 'robut-uncoil/version'

class Robut::Plugin::RobutUncoil
  include Robut::Plugin
  
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
  
  # other methods here

  # look at burtlo's to see threading and queueing
  
  
end