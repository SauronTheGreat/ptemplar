class ClickbulletCell < Cell::Rails

  def flat(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]

    @textlength=@pdata.data.length
    @fontsize=[0.75*Math.sqrt((@width*@height)/@textlength), 0.75*@height].min
    @numlines=[(@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2

    render
  end

  def together(args)
    @pdata=args[:pcontents]
    @height=args[:height]
    @width=args[:width]

    @textlength=@pdata.data.length
    @fontsize=[0.75*Math.sqrt((@width*@height)/@textlength), 0.75*@height].min
    @numlines=[(@textlength*@fontsize)/@width, 1].max
    @paddingtop=(@height-10-(@fontsize*1.05*@numlines))/2

    render
  end
end
