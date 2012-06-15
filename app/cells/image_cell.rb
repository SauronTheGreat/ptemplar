class ImageCell < Cell::Rails

  def fade(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

  def slide(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

  def flat(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

end
