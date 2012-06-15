class TextlineCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    @textlength=@pdata.data.length
    @fontsize=(@textlength>10 ? [Math.sqrt((@width*@height)/@textlength), 0.9*@height].min : [0.75 * Math.sqrt((@width*@height)/@textlength), 0.9*@height].min)
    @numlines=[(0.6*@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2
    render
  end

  def slide(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    @textlength=@pdata.data.length
    @fontsize=(@textlength>10 ? [Math.sqrt((@width*@height)/@textlength), 0.9*@height].min : [0.75 * Math.sqrt((@width*@height)/@textlength), 0.9*@height].min)
    @numlines=[(0.6*@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2
    render
  end

  def fade(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    @textlength=@pdata.data.length
    @fontsize=(@textlength>10 ? [Math.sqrt((@width*@height)/@textlength), 0.9*@height].min : [0.75 * Math.sqrt((@width*@height)/@textlength), 0.9*@height].min)
    @numlines=[(0.6*@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2
    render
  end

end
