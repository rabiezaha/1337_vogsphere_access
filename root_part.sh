#!/bin/bash

### We set up the kerberos config file to access to 1337's kerberos server.

mv /etc/krb5.conf /etc/krb5.conf_before1337vogsphereaccess

echo "Original /etc/krb5.conf renamed : /etc/krb5.conf_before1337vogsphereaccess" 

cat >> /etc/krb5.conf << EOF
[libdefaults]
    default_realm = 1337.MA
    forwardable = true
    proxiable = true
    dns_lookup_kdc = no
    dns_lookup_realm = no
    allow_weak_crypto = true

[realms]
    1337.MA = {
        kdc = ldap.1337.ma
        admin_server = ldap.1337.ma
        default_domain = 1337.ma
        default_lifetime = 7d
        ticket_lifetime = 7d
    }

[domain_realm]
    .1337.ma = 1337.MA
    1337.ma = 1337.MA
EOF

### We set up the ssh config file to access to 42's git server (vogsphere)
### using your kerberos identification

cat >> /etc/ssh/ssh_config << EOF
Host *.1337.ma
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF

echo "root part finished !"
