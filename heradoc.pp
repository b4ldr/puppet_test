define foo (
  #Stdlib::Unixpath $command,
  Pattern[/\A(.+)*\z/] $command,
) {
  notice($command)
}
$foo = 'test'
$bar = @('BAR')
        adasd
        ${foo}
        asd
    | 'BAR'
#notify{$bar:}
$output_dir = '/foo'
$large_cleanup_cmd = @("CLEANUP_CMD")
/usr/bin/find ${output_dir} -mindepth 1 -maxdepth 1 -type d -ctime +7 -exec du -ks {} + | \
  awk '\$1 >= 1000000 {print \$2}' | \
  xargs rm -rf
| CLEANUP_CMD
foo {'test':
  command => $large_cleanup_cmd,
}

#notice(inline_template('<%= @large_cleanup_cmd %>'))
