class ModalCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents]
    @height=0.9*args[:height]
    @width=0.9*args[:width]
    render
  end

end
