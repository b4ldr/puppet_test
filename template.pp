$foo = undef
notice(inline_template('<% if $foo %>true<% else %>false<% end %>'))
