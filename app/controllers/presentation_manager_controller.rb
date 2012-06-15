class PresentationManagerController < ApplicationController


  def edit_presentation
    @presentation=Presentation.find(params[:id])
    @pslides=@presentation.pslides
    @pslide=Pslide.new
    @pslide_bank=Pslide.find_all_by_user_id_and_in_bank(current_user.id, true)
    if @presentation.pslides.count>0
      @pslide_html_data=@presentation.pslides.first.data
    end
    @presentation_pslide=PresentationsPslide.new
  end

  def add_slide

    @presentation=Presentation.find(params[:id])
    if params[:slide]=="existing"
      redirect_to add_existing_slide_path(@presentation)
    end


  end

  def add_existing_slide
    @presentation=Presentation.find(params[:id])
    @existing_pslides=@presentation.pslides
    @pslides=Pslide.all-@existing_pslides

  end

  def update_presentation_slides

    @presentation=Presentation.find(params[:id])
    @existing_pslides=@presentation.pslides
    @pslides=Pslide.all-@existing_pslides
    @pslides.each do |pslide|
      if params[pslide.id.to_s]
        @presentation_pslide=PresentationPslide.new
        @presentation_pslide.presentation_id=@presentation.id
        @presentation_pslide.pslide_id=pslide.id
        @presentation_pslide.save!
      end
    end

    redirect_to view_presentation_path(@presentation)


  end

  require 'rubygems'
  #require 'zip/zip'
  require 'find'
  require 'fileutils'

  #require 'zip/zipfilesystem'
  include FileUtils

  def package_as_html
    @presentation=Presentation.find(params[:id])
    system("rm -rf #{Rails.root}/presentation_packages/#{@presentation.name}")
    system "mkdir #{Rails.root}/presentation_packages/#{@presentation.name}"
    system "mkdir #{Rails.root}/presentation_packages/#{@presentation.name}/assets"
    #making the required folder structure
    system "mkdir #{Rails.root}/presentation_packages/#{@presentation.name}/assets/media"



    #this is the code to create the files for assets (js,css and images)

    src_dir=Dir.new("#{Rails.root}/app/assets")
    src_dir.each do |file|
      if !File.directory?(file)
        cp_r("#{Rails.root}/app/assets/#{file}/.", "#{Rails.root}/presentation_packages/#{@presentation.name}/assets")
      end
    end


    #the code to create side panel

    @title_widget=Pwidget.find_by_name("Title")
    @slide_name=Array.new
    @presentation.pslides.each do |pslide|
      @title_section=Psection.find_by_ptemplate_id_and_pwidget_id(pslide.ptemplate_id, @title_widget.id)
      if @title_section.nil?
        @slide_name[pslide.id]="#{PresentationsPslide.find_by_presentation_id_and_pslide_id(@presentation.id, pslide.id).sequence_number}_Slide"
      else
        @slide_name[pslide.id]="#{PresentationsPslide.find_by_presentation_id_and_pslide_id(@presentation.id, pslide.id).sequence_number}_#{Pcontent.find_by_pslide_id_and_psection_id(pslide.id, @title_section.id).data}"
      end
      @slide_name[pslide.id]=@slide_name[pslide.id].gsub("?", "")
      @slide_name[pslide.id]=@slide_name[pslide.id].gsub(" ", "")
      @slide_name[pslide.id]=@slide_name[pslide.id].gsub(":", "")
      @slide_name[pslide.id]=@slide_name[pslide.id].gsub("/", "")
    end


    @presentation.pslides.each do |pslide|
      @pslide=pslide


      #now create html files

      ####this is the code to create the side panel####
      side_panel=""


      side_panel=side_panel+"<a class='btn btn-success span2 ' href=#{@slide_name[pslide.id]}.html>#{@slide_name[pslide.id]}</a><br>"

      ####end oof code to create side panel


      ###this is the code to create next and prev button
      next_prev=""


      ###end of code to create next and prev button


        f = File.open("#{Rails.root}/presentation_packages/#{@presentation.name}/#{@slide_name[pslide.id]}.html", "w+") { |file|
          html_data=pslide.data
          html_data=html_data.gsub("/assets", "assets")

          #if this is the first slide, it shud have only "next" link and no "prev" link.
          #   if PresentationPslide.find_by_pslide_id_and_presentation_id(pslide.id,@presentation.id).sno==1
          #    html_data="<a href=#{PresentationPslide.find_by_pslide_id_and_presentation_id_and_sno(pslide.id,@presentation.id,sno+1).id}.html> Next</a>"

          #if its the last slide, it shud have only the prev link and no next link

          # end


          #html_data="<a href=#{PresentationPslide.find_by_pslide_id_and_presentation_id_and_sno(pslide.id,@presentation.id,sno+1).id}.html> Next</a>"

          ###uncomment the following 2 lines if you want to have side-panel
          #html_data=html_data+"<div id='side_panel' style='background: #000000; width:250px'>"

          #  html_data=html_data+side_panel
          ###end

          #add media pertaining to the presentation
          src_dir=Dir.new("#{Rails.public_path}/system/passets/media_passets/000/000")
          #cp_r("#{Rails.public_path}/system/pfiles/#{pslide.id}", "#{Rails.root}/presentation_packages/#{@presentation.name}/assets/system/pfiles")
          pslide.pcontents.each do |pcontent|
            pcontent.passets.each do |asset|
              cp_r("#{asset.media_passet.path}", "#{Rails.root}/presentation_packages/#{@presentation.name}/assets/media")
              html_data=html_data.gsub("#{asset.media_passet.url}", "assets/media/#{asset.media_passet_file_name}")

            end
          end

          if @presentation.pslides.count>1
          #code for next-prev button
          @pres_pslide=PresentationsPslide.find_by_pslide_id_and_presentation_id(pslide.id, @presentation.id)

          if @pres_pslide.sequence_number==1
            html_data=html_data+ "<div style='position:absolute; top:40%;right:20px'><a href= '"+%Q(#{@slide_name[@presentation.pslides[@pres_pslide.sequence_number].id]}.html)+"'><img src='assets/next.png'/></a></div>"
          elsif @pres_pslide.sequence_number==@presentation.pslides.count
            html_data=html_data+" <div style='position:absolute; top:40%;left:20px'><a href= '"+%Q(#{@slide_name[@presentation.pslides[@pres_pslide.sequence_number-2].id]}.html)+"'><img src='assets/previous.png'/></a></div>"
          else
            html_data=html_data+"<div style='position:absolute; top:40%;right:20px'><a href= '"+%Q(#{@slide_name[@presentation.pslides[@pres_pslide.sequence_number].id]}.html)+"'><img src='assets/next.png'/></a></div>"
            html_data=html_data+" <div style='position:absolute; top:40%;left:20px'><a href= '"+%Q(#{@slide_name[@presentation.pslides[@pres_pslide.sequence_number-2].id]}.html)+"'><img src='assets/previous.png'/></a></div>"
          end
          end


          file.puts html_data

        }
      end

      Dir.chdir("#{Rails.root}")
      Dir.chdir("presentation_packages")
      system("sass #{Rails.root}/presentation_packages/#{@presentation.name}/assets/welcome.css.scss  #{Rails.root}/presentation_packages/#{@presentation.name}/assets/welcome.css")
      system("sass #{Rails.root}/presentation_packages/#{@presentation.name}/assets/silverspoon.css.scss  #{Rails.root}/presentation_packages/#{@presentation.name}/assets/silverspoon.css")
      system("sass #{Rails.root}/presentation_packages/#{@presentation.name}/assets/scaffolds.css.scss  #{Rails.root}/presentation_packages/#{@presentation.name}/assets/scaffolds.css")
      system("sass #{Rails.root}/presentation_packages/#{@presentation.name}/assets/pslide.css.scss  #{Rails.root}/presentation_packages/#{@presentation.name}/assets/pslide.css")

      system("zip -r  #{@presentation.name} , #{@presentation.name}")

      send_file "#{Rails.root}/presentation_packages/#{@presentation.name}.zip"

      system("rm #{Rails.root}/presentation_packages/#{@presentation.name}.zip")
      system("rm -rf #{Rails.root}/presentation_packages/#{@presentation.name}")

  end

  def pslide_html_data


    render :text => Pslide.find(params[:id]).data

  end


  def update_list
    @presentation=Presentation.find(params[:presentation_id])


    params["list"].count.times do |i|
      @presentation_pslide=PresentationPslide.find_by_presentation_id_and_pslide_id(@presentation.id, params["list"][i])
      @presentation_pslide.sno=i+1
      @presentation_pslide.save!

    end

  end

  def add_from_bank

    @pslide = Pslide.find(params[:fields][0])
    @presentation = Presentation.find(params[:id])
    @presentation_pslide=PresentationPslide.new
    @presentation_pslide.pslide_id=@pslide_id
    @presentation_pslide.pslide_id=@pslide_id

    @pslide.save

    render :nothing => true

  end
end