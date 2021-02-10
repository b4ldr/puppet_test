$chain = @("CHAIN")
${file('/tmp/foo.pem')}
${file('/tmp/bar.pem')}
| CHAIN
notice($chain)
