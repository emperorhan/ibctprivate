INIT_ACCOUNT="$( jq -r '.INIT_ACCOUNT' "00_CONFIG.conf" )"
INIT_PUB_KEY="$( jq -r '.INIT_PUB_KEY' "00_CONFIG.conf" )"
INIT_PRIV_KEY="$( jq -r '.INIT_PRIV_KEY' "00_CONFIG.conf" )"

./cleos.sh system newaccount --stake-net "50000000.0000 CR" --stake-cpu "50000000.0000 CR" --buy-ram "100.0000 CR" eosio $INIT_ACCOUNT $INIT_PUB_KEY $INIT_PUB_KEY -p eosio

sleep 2s

./cleos.sh transfer eosio $INIT_ACCOUNT "24989900.0000 CR" "init" -p eosio

sleep 2s

./cleos.sh system regproducer $INIT_ACCOUNT $INIT_PUB_KEY https://ibct.io/ -p $INIT_ACCOUNT

sleep 10s

./cleos.sh system delegatebw $INIT_ACCOUNT $INIT_ACCOUNT "1000000.0000 CR" "1000000.0000 CR"

sleep 2s

./cleos.sh system voteproducer $INIT_ACCOUNT $INIT_ACCOUNT "1000.0000 CR"

sleep 2s

./cleos.sh system listproducers