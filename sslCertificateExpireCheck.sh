#!/bin/bash

alertEmail="YOUR_EMAIL_TO_GET_ALERT"

certificateExpiryChecker(){
        certLocation=$1
        daysToCheckBeforeExpire=$2

        endTime=`echo "$daysToCheckBeforeExpire*86400" | bc`

        if openssl x509 -checkend $endTime -noout -in $certLocation
        then
                echo "Certificate is valid for $daysToCheckBeforeExpire days."
        else
                echo "Certificate will expire in $daysToCheckBeforeExpire days."
                echo "$certLocation ssl will expire in $daysToCheckBeforeExpire days"|  mail -s "SSL Expiry Notification" $alertEmail
        fi
}

certificateExpiryChecker "CERTIFICATE_LOCATION" NUMBER_OF_DAYS_TO_CHECK_BEFORE_EXPIRE
