class TitleCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    @textlength=@pdata.data.length

    @fontsize=@pdata.font_size
    @fontfamily=@pdata.font_family
    @fontweight=@pdata.font_weight
    @numlines=[(@textlength*@fontsize.to_i)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize.to_i*1.05*@numlines))/2
    render
  end

  def slide(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    @textlength=@pdata.pdata.length
    @fontsize=[0.75*Math.sqrt((@width*@height)/@textlength), 0.75*@height].min
    @numlines=[(@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2
    render
  end

  def fade(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]
    @textlength=@pdata.pdata.length
    @fontsize=[0.75*Math.sqrt((@width*@height)/@textlength), 0.75*@height].min
    @numlines=[(@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2
    render
  end

  def hidden(args)
      @pdata=args[:pcontents]
      @height=args[:height]
      @width=args[:width]
      @textlength=@pdata.pdata.length
      @fontsize=[0.75*Math.sqrt((@width*@height)/@textlength), 0.75*@height].min
      @numlines=[(@textlength*@fontsize)/@width, 1].max
      @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2
      render
    end

end
