class AccordionCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    render
  end

end
