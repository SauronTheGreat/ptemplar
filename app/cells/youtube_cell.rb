class YoutubeCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents].data
    @height=args[:height]
    @width=args[:width]
    render
  end

  def autostart(args)
    @pdata=args[:pcontents].data
    @height=args[:height]
    @width=args[:width]
    render
  end

end
