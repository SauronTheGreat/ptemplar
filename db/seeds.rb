# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if !User.find_by_email("admin@ptotem.com")
  User.create!(:email => 'admin@ptotem.com', :password => 'p20o20e13', :password_confirmation => 'p20o20e13', :admin => true)
end

#seeding pwidgets
Pwidget.destroy_all
Pwidget.create!(name:"Image", builder: "<div><% @pcontent[index].passets.build %> <%= f.fields_for :passets do |asset| %> <% if asset.object.new_record? %> <%= asset.file_field :media_passet %> <% end %> <%= asset.label :caption %> <%=asset.text_field :caption %> <% end %> </div> ")


Pwidget.create!(name:"Video", builder:"<div><% @pcontent[index].passets.build %> <%= f.fields_for :passets do |asset| %> <% if asset.object.new_record? %> <%= asset.file_field :media_passet %> <% end %> <%= asset.label :caption %> <%=asset.text_field :caption %> <% end %> </div> ")


Pwidget.create!(name:"Audio", builder:"<div><% @pcontent[index].passets.build %> <%= f.fields_for :passets do |asset| %> <% if asset.object.new_record? %> <%= asset.file_field :media_passet %> <% end %> <%= asset.label :caption %> <%=asset.text_field :caption %> <% end %> </div> ")


Pwidget.create!(name:"Title", builder:"<div> <%= f.text_field :markup, :class => 'span5' %>  </div>")


#TODO:have an add another link in the form builder itself.
Pwidget.create!(name:"Clickbullet", builder:"<div><% @pcontent[index].passets.build %> <%= f.fields_for :passets do |asset| %> <% if asset.object.new_record? %> <%= asset.file_field :media_passet %> <% end %> <%= asset.label :caption %> <%=asset.text_field :caption %> <% end %> </div> ")


Pwidget.create!(name:"Slidecard", builder:"<div><%=f.text_field :markup %><% @pcontent[index].passets.build %> <%= f.fields_for :passets do |asset| %> <% if asset.object.new_record? %> <%= asset.file_field :media_passet %> <% end %> <%= asset.label :caption %> <%=asset.text_field :caption %> <% end %> </div>")

Pwidget.create!(name:"Modal",builder:"<div>
                          <% @pcontent[index].passets.build %>
                          <div class='newPaperclipFiles'>
                            <%= f.fields_for :passets do |asset| %>
                                <% if asset.object.new_record? %>
                                    Add Image:    <%= asset.file_field :media_passet %>
                                <% end %>
                            <% end %>
                          </div>

                          <div class='existingPaperclipFiles'>
                            <% f.fields_for :passets do |asset| %>
                                <% unless asset.object.new_record? %>
                                    <div class='thumbnail'>
                                      Change
                                      Image:   <%= link_to(image_tag(asset.object.image.url(:thumb)), asset.object.image.url(:original)) %>
                                      <%= asset.check_box :_delete %>
                                    </div>
                                <% end %>
                            <% end %>
                          </div>
                          <% @htmlid= 'htmlarea_'+ index.to_s %>
                          <script type='text/javascript'>
                              $(function () {
                                  $('#<%= @htmlid %>').tinymce({
                                      theme:'advanced'
                                  });
                              });
                          </script>
                          <%= f.text_area :markup, :style => 'width:97%;height:300px;', :id => @htmlid %>
                        </div>")



Pwidget.create!(name:"Html",builder:"<div>  <% @htmlid= 'htmlarea_'+ index.to_s %>
                          <script type='text/javascript'>
                              $(function () {
                                  $('#<%= @htmlid %>').tinymce({
                                      theme:'advanced'
                                  });
                              });
                          </script>
                          <%= f.text_area :markup, :style => 'width:97%;height:300px;', :id => @htmlid %>
                        </div>")

Pwidget.create!(name:"Youtube",builder:"<div>
                          Put in a Youtube embed link
                          <%= f.text_field :markup, :class => 'span5' %>
                        </div>")


Pwidget.create!(name:"Textline",builder:"<div>
                          <%= f.text_field :markup, :class => 'span5' %>
                        </div>")

#TODO:make a add new link in the form itself thus user can add as many images he/she wants
Pwidget.create!(name:"Gallery",builder:"<div><% @pcontent[index].passets.build %> <%= f.fields_for :passets do |asset| %> <% if asset.object.new_record? %> <%= asset.file_field :media_passet %> <% end %> <%= asset.label :caption %> <%=asset.text_field :caption %> <% end %> </div> ")



#TODO:sort out accordion


#
#Pwidget.create!(name:"Accordion",builder:"<div>
#                          Add Accordion data in the format (Title | HTML)
#                          <br/>
#                          <% 50.times do %>
#                              <% aphoto = @pcontent[index][index].entries.build %>
#                          <% end %>
#                          <%= f.fields_for :entries do |entry| %>
#                              <% if entry.object.new_record? %>
#                                  Data: <%= entry.text_area :pmatter, :rows => 3, :class => 'span5' %>
#                              <% end %>
#                              <br/>
#                          <% end %>
#                        </div>")

Pwidget.create!(name:"Sub-Ptemplate",builder:'<%= form_tag extract_psections_from_ptemplate_path do %> <%= hidden_field_tag :current_psection_id,current_psection_id %> <% Ptemplate.all.each do |ptemplate| %> <div class="field" style="float:left;margin-right: 10px;"> <%= radio_button_tag :ptemplate_id, ptemplate.id %> <%= ptemplate.name %> <div class="mini-slide"> <% ptemplate.psections.each do |section| %> <div style="background-color:#ffffff ;line-height: 10px;border-radius: 2px;text-align:center;font-size:10px;padding:0px;border:solid 1px;;position:absolute;left:<%=section.xpos.to_i/5%>px;top:<%= section.ypos.to_i/5 %>px;width:<%= section.width.to_i/5 %>px;height:<%= section.height.to_i/ 5 %>px"> <div style="margin-top: 3px;"><%= section.pwidget.name %></div> </div> <% end %> </div> </div> <% end %> <div class="actions"> <%= submit_tag "SUBMIT OK",:class=>"btn btn-info"%> </div> <% end %> ')

Pevent.create!(:name=>"Click")
Pevent.create!(:name=>"Tick")
Pevent.create!(:name=>"Click and Tick")

Pfragment.create(:name=>"FadeIn",:markup=>".fadeIn()")
Pfragment.create(:name=>"FadeOut",:markup=>".fadeOut()")