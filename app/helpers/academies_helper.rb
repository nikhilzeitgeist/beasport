module AcademiesHelper

=begin
  def errors(object)
   if object.errors.any?
     html = "<div> "
     html << " <h2>"
          pluralize(@academy.errors.count, "error")
     html <<    " prohibited this post from being saved:  </h2>"

     html << " <ul>"
         @academy.errors.full_messages.each do |msg|
         html<< " <li>"
          msg
          html<< "</li>"
      end
      html << "</ul>"
     html <<  " </div> "
    end
  end
=end

 end


=begin
 <% if @academy.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@academy.errors.count, "error") %> prohibited this post from being saved:</h2>

       <ul>
       <% @academy.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
=end
