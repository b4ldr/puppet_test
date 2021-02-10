$test = @(ERB)

Foo
<%- if true %>
Bar
<% end -%>
| ERB
notice(inline_template($test))
