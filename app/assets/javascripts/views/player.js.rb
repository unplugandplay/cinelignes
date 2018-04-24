require 'browser/animation_frame'
require 'browser/canvas'
require 'browser/dom/element/image'
require 'browser/event_source'


class PlayerView


  def initialize

    DOM = Browser::DOM
    @canvas = Browser::Canvas.new $document['super-js-adventure']
    @link_image = $document.create_element('img')
    @link_image[:src] = 'link.png'
    p "@link_image : #{DOM(@link_image)[:src].inspect}"
    promise = load('link.png')
    p "promise #{promise.inspect}"

    @key = [0, 0, 0, 0, 0];

    @player = OpenStruct.new(x: 80, y: 80)

  end

  def draw
    @canvas.clear

    @canvas.rect(20, 20, 50, 50) #(x, y, width, height)

    @style = @canvas.style

    @style.fill = '#F00'
    @style.stroke = '#F00'

    @canvas.fill
    @canvas.stroke
    @canvas.begin

    @canvas.rect(100, 100, 50, 50)
    @style.stroke = '#000'
    @canvas.stroke
    @canvas.close


    @canvas.draw_image @link_image, @player.x, @player.y


    $document.on :keydown do |e|
      p "$document keydown : #{e.code}"
      #change_key
      change_key(e.code, 1)
      $document.off :keydown
    end


    $document.on :keyup do |e|
      p "$document keyup : #{e.code}"
      #change_key
      change_key(e.code, 0)
      $document.off :keydown
    end

    # Handle the Input

    @player.y -= 4 if @key[2] > 0

    @player.y += 4 if @key[3] > 0

    @player.x -= 4 if @key[0] > 0

    @player.x += 4 if @key[1] > 0


    #  $window.on :click do |e|
    #  alert "click #{e.data}"
    #  end


    Browser::AnimationFrame.new($window) do
      self.draw
    end

  end

  private def change_key(used_key, to)


    case used_key
      # left
      when 65, 37 then
        @key[0] = to

      # up
      when 87, 38 then
        @key[2] = to

      # right
      when 68, 39 then
        @key[1] = to

      # down
      when 83, 40 then
        @key[3] = to

      # space bar
      when 32 then
        @key[4] = to
        p 'space'

    end
  end


end

$document.ready do
  view = PlayerView.new

  p "entering draw #{Time.now}"
  view.draw


end
