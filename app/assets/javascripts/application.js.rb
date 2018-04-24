# Require the opal runtime and core library
require 'opal'

# For Rails 5.1 and above, otherwise use 'opal_ujs'
#require 'rails_ujs'

# Require of JS libraries will be forwarded to sprockets as is
require 'turbolinks'

# a Ruby equivalent of the require_tree Sprockets directive is available
require_tree '.'

# == Print something in the browser's console
puts "Hello world of Cinelignes !"

require 'console'
#$console.log %w[Hello world!]

# == Use Native to wrap native JS objects, $$ is preconfigured to wrap `window`
require 'native'
#$$.alert "Hello world!"


#require 'opal-browser'
# opal-browser demo
#$document.ready do
#  alert "yo dawg, I'm all loaded up in here"
#end
#



#require 'opal-actioncable'
# actioncable demo
# class TestChannel < ActionCable::Subscription
# def connected
#   perform 'send', {data: 23}
# end
#
# def disconnected
# end
#
# def received data
# end
# end
#
# consumer = ActionCable.createConsumer
# consumer.subscriptions.create TestChannel
#
# # or
#
# ChatChannel =  TestChannel
# consumer.subscriptions.create ChatChannel, {channel: 'Chat', room: 'default'}


