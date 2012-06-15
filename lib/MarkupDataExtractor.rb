module MarkupDataExtractor

  Hierarchy_tree="Ptemplate|Psection|Presentation|Pslide"
  #convention: whatever value is empty..please use - instead of a space
  #this is a generic module used to extract data from the amrkup
  #this is a fairly cool idea because is makes the code much more drier and can be very easily managed....
  #remember to restart the server upon making the changes in the module code...

  def js
    self.markup["JS"]
  end

  def xpos
    self.markup["DIM"].split("|")[0].to_i
  end

  def ypos
    self.markup["DIM"].split("|")[1].to_i
  end

  def height
    self.markup["DIM"].split("|")[2].to_i
  end

  def width
    self.markup["DIM"].split("|")[3].to_i
  end

  def background
    #my_position=Hierarchy_tree.split("|").index(self.name)

    if self.markup["BKG"].nil?

      "rgba(255,255,255,1)"
    else
      desired_array=self.markup["BKG"].split("|")
      if  desired_array[0]!="-"
        desired_array[0]
      else
        "rgba(#{desired_array[1]},#{desired_array[2]},#{desired_array[3]},#{desired_array[4]})"
      end



    end
  end

  def opacity
    #my_position=Hierarchy_tree.split("|").index(self.name)

    if self.markup["BKG"].nil?
      1
    else
      desired_array=self.markup["BKG"].split("|")
      if  desired_array[0]!="-"
        desired_array[0]
      else
        "#{desired_array[4]}"
      end


    end
  end

  def color
    #my_position=Hierarchy_tree.split("|").index(self.name)

    if self.markup["FON"].nil?
      "rgb(0,0,0)"
    else
      desired_array=self.markup["FON"].split("|")

        "rgb(#{desired_array[1]},#{desired_array[2]},#{desired_array[3]})"


    end
  end

  def data
    if self.markup["DAT"].nil?
      "Data Unavailable"
    else
      self.markup["DAT"]
    end
  end


  def font_size
    if self.markup["FON"].nil?
      "55"
    else
      self.markup["FON"].split("|")[0].gsub("px","")
    end
  end

  def  font_color
    if self.markup["FON"].nil?
      "rgb(0,0,0)"
    else
      "rgb(#{self.markup["FON"].split("|")[1]},#{self.markup["FON"].split("|")[2]},#{self.markup["FON"].split("|")[3]})"
    end
  end

  def font_family
    if self.markup["FON"].nil?
      "Arial"
    else
      self.markup["FON"].split("|")[5]
    end
  end

  def font_weight
    if self.markup["FON"].nil?
      "normal"
    else
      self.markup["FON"].split("|")[4]
    end
  end

  #TODO:add background image support
  def background_image
    nil
  end

  def start_xpos
    if !self.markup["JS"].nil?
      self.markup["JS"].split("|")[0]
    end

  end

  def start_ypos
    if !self.markup["JS"].nil?
      self.markup["JS"].split("|")[1]
    end

  end

  def end_xpos
    if !self.markup["JS"].nil?
      self.markup["JS"].split("|")[2]
    end

  end

  def end_ypos
    if !self.markup["JS"].nil?
      self.markup["JS"].split("|")[3]
    end

  end





end