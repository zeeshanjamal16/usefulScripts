#!/bin/bash

alternatives --set python /usr/bin/python3
dnf install certbot -y
dnf install python3-certbot-nginx -y
dnf install python3-certbot-dns-cloudflare -y

