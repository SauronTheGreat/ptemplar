class SlidecardCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    @textlength=@pdata.data.length

    if @height/@width>0.5
      @fontsize=(@textlength>10 ? [Math.sqrt((@width*@height)/@textlength), 0.9*@height].min : [0.75 * Math.sqrt((@width*@height)/@textlength), 0.9*@height].min)
    else
      @fontsize=(@textlength>10 ? [0.75 *Math.sqrt((@width*@height)/@textlength), 0.9*@height].min : [0.60 * Math.sqrt((@width*@height)/@textlength), 0.9*@height].min)
    end
    @numlines=[(0.6*@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2
    render
  end
end
