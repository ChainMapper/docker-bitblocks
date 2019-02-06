#!/bin/bash

cat  << EOF
rpcuser=$USER
rpcpassword=$PASSWORD
rpcallowip=$RPCALLOW
rpcport=6666
txindex=1
maxconnetions=50
addnode=s1.bitblocksproject.com
addnode=s2.bitblocksproject.com
addnode=s3.bitblocksproject.com
addnode=s4.bitblocksproject.com
addnode=s5.bitblocksproject.com
addnode=s6.bitblocksproject.com
addnode=s7.bitblocksproject.com
addnode=s8.bitblocksproject.com
addnode=s9.bitblocksproject.com
addnode=s10.bitblocksproject.com
zmqpubhashblock=tcp://*:5555
EOF