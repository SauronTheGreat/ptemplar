class GalleryCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

  def orman(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

  def pascal(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

  def cycler(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

  def anything(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

  def metallic(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

end
