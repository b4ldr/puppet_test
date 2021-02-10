$foo = {
    'bla' => undef,
}
$bar = false ? {
    true    => '',
    default => nil,
}
$foobar = merge($foo, {'boo' => $bar})
$template = @(TEMPLATE)
<%- @foobar.each_pair do |key, value| -%>
<% if value.nil? %>
<%= key %>: <%= value %> (<%= value.class %>)
<%- end -%>
<%- end -%>
| TEMPLATE
notice(inline_template($template))
