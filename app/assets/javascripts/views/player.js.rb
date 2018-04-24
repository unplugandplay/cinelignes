require 'browser/animation_frame'
require 'browser/canvas'
require 'browser/dom/element/image'

class PlayerView



  def initialize

    DOM = Browser::DOM
    @canvas = Browser::Canvas.new $document['super-js-adventure']
    @link_image  = $document.create_element('img')
    @link_image[:src] = 'link.png'
    p "@link_image : #{DOM(@link_image)[:src].inspect}"
    promise = load('link.png')
    p "promise #{promise.inspect}"





  end

  def draw


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



    @canvas.begin
    @canvas.rect(200, 200, 50, 50)
    @style.stroke = '#F00'
    @canvas.stroke
    @canvas.close
    @canvas.draw_image @link_image , 80, 80


    Browser::AnimationFrame.new($window) do
      self.draw

    end

  end

end

$document.ready do
  view = PlayerView.new

  p "entering draw #{Time.now}"
  Browser::AnimationFrame.new($window) do
    view.draw
  end




end
