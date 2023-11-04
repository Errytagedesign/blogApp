<!DOCTYPE html>

<html>
  <head>
    <title>BlogApp</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <%= stylesheet_link_tag "style", "data-turbo-track": "reload" %>
    <%= javascript_importmap_tags %>
  </head>

   <body>

      <div id = "container">
        <%= yield -%>
      </div>

   </body>

</html>
