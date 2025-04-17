#!/bin/bash

source .env

URL="smtps://smtp.gmail.com:465"

if [ $(($#)) -ne 3 ]; then
    echo "Usage: " $0 " <recipient> <subject> <body, in a file>"
    exit 1
fi

echo "Sending the email at $3, with subject $2 to $1."
echo
echo "Contents of $3: "
cat $3
echo


while [ $inp != "y" ];
do
    read -p "Would you like to send (y/n)? " inp
    echo $inp
    if [ "$inp" == "n" ]; then
        exit 0
    fi
    if [ "$inp" == "y" ]; then
        break
    fi
done

curl --ssl-reqd \
--url "$URL" \
--user "$GMAIL_USERNAME:$GMAIL_PASSWORD" \
--mail-from $GMAIL_USERNAME \
--mail-rcpt $1 \
--upload-file - << EOF
From: Alex Trumier <$GMAIL_USERNAME>
To: Recipient <$1>
Subject: $2

`cat $3`

EOF
