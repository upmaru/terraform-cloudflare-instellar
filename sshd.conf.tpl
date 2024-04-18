PubkeyAuthentication yes
TrustedUserCAKeys /etc/ssh/ca.pub

Match User ubuntu
  AuthorizedPrincipalsCommand /bin/bash -c "echo '%t %k' | ssh-keygen -L -f - | grep -A1 Principals"
  AuthorizedPrincipalsCommandUser nobody