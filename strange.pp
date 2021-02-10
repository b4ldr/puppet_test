$key_path = '/foo'
$cert_path = '/foo'
$_ca_fil = '/foo'
$_responses_file = '/foo'
$safe_title = 'bar_foo'
$serve_service = 'foo@bar'


$refresh_command = @("CMD"/L)
    /usr/local/sbin/cfssl-ocsprefresh \
    --responder-cert ${cert_path} --responder-key ${key_path} \
    --ca-file ${_ca_file} --responses_file ${_responses_file} \
    --restart-service '${serve_service}' ${safe_title}
    | CMD
notice($refresh_command)
