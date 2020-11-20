# usefulScripts

### restartApacheOnHighLoad.sh

**What it do** - A bash script to restart apache if cpu load cross a certain threshold. You can edit script and perform any action if cpu load goes high. Simple change the line "/usr/sbin/service apache2 restart" with required action.   
**How to Use** - Change threshold load value and set a cron for script and you are good to go.   

### topResourceConsumingProcesses.sh

**What it do** - A bash script to log top 10 processes cpu and memory wise in case of high load on server.   
**How to use** - Change the load value and log directory path. Set the cron for this script and you are good to go.   

### sslCertificateExpireCheck.sh 

**What it do** - A bash script which check in how many days certificate will expire. It take input as certificate path and number of days for which you want to check.   
**How to use** - Replace the following values according to your requirement in the script

- CERTIFICATE_LOCATION
- NUMBER_OF_DAYS_TO_CHECK_BEFORE_EXPIRE
- YOUR_EMAIL_TO_GET_ALERT

**Example Use** - 
- certificateExpiryChecker "/etc/letsencrypt/live/domainName/fullchain.pem" 30 
You can use this line multiple times to get alerts for multiple domains.


### monitorPostfixQueue.sh    

**What it do** - A bash script to check if postfix email queue crossed a certain threshold and certain action can be taken accordingly.   
** How to use** - Replace queueThreshold with your desired queue limit to monitor and run this script with a cron. Replace emailAlert value with your email.      


   

