require 'opal-browser'
require 'browser/http'
require 'browser/canvas'

#var canvas  = document.getElementById('super-js-adventure');
#var ctx     = canvas.getContext('2d');
#var width   = 256;
#var height  = 224;

#@window_height  = `$(window).height()`
#@window_width   = `$(window).width()`

module Browser; class Canvas


  class Style < StyleObject

    class Rect < StyleObject
      attr_reader :width, :height, :x, :y, :style

      def width=(value)
        `#@native.lineWidth = #{@width = value}`
      end


      def fillRect(value = '#f00')
        `#@native.fillStyle = #{@style = value}`
        `#@native.fillRect(0, 0, 50, 50)`
      end
    end
  end
end
end



$document.ready do
  #Browser::HTTP.get "/something.json" do
  #  on :success do |res|
  #    alert res.json.inspect
  #  end
  #end

  @canvas  = `document.getElementById('super-js-adventure')`
  #@context = `#{@canvas}.getContext('2d')`
  #canvas_height  = 256
  #canvas_width   = 224

  @canvas  = Browser::Canvas.new $document['super-js-adventure'] # Browser::Canvas.element('super-js-adventure')


  @canvas.rect(0, 0, 50, 50) #(x, y, width, height)

  @style = @canvas.style
  #p "canvas style : #{.inspect}"
  @style.fill='#F00'
  @style.stroke='#F00'

  @canvas.fill
  @canvas.stroke
  @canvas.begin

  @canvas.rect(100, 100, 50, 50)
  @style.stroke='#000'
  @canvas.stroke
  @canvas.close


  @canvas.begin
  @canvas.rect(200, 200, 50, 50)
  @style.stroke='#F00'
  @canvas.stroke
  @canvas.close


  #p "@context : #{@context}"
  #Browser::Canvas::Style::Image.new(@context)
  #Browser::Canvas::Style::Rect.new(@context).fillRect
end

=begin
  class PlayerView
    # We should have <body class="controller-<%= controller_name %>"> in layouts
    def initialize(selector = 'body.controller-player')
      @selector = selector
    end

    def setup
      on(:click, 'a', &method(:link_clicked))
    end

    def link_clicked(event)
      event.prevent
      puts "Hello! (You just clicked on a link: #{event.current_target.text})"
    end


    private

    attr_reader :selector, :element

    # Uncomment the following method to look for elements in the scope of the
    # base selector:
    #
    # def find(selector)
    #   Element.find("#{@selector} #{selector}")
    # end

    # Register events on document to save memory and be friends to Turbolinks
    def on(event, selector = nil, &block)
      Element[`document`].on(event, selector, &block)
    end
  end

  PlayerView.new.setup
=end