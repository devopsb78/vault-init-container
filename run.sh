vault login $VAULT_TOKEN &>/dev/null
mkdir /data
vault  kv get $SECRET_NAME  | sed -n -e '/= Data =/,$ p' | grep -Ev '= Data =|^Key|^--' | awk '{print "export "$1"="$2""}' >/data/secrets

