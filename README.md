# usefulScripts

### restartApacheOnHighLoad.sh

**What it do** - A bash script to restart apache if cpu load cross a certain threshold. You can edit script and perform any action if cpu load goes high. Simple change the line "/usr/sbin/service apache2 restart" with required action.   
**How to Use** - Change threshold load value and set a cron for script and you are good to go.   

### topResourceConsumingProcesses.sh

**What it do** - A bash script to log top 10 processes cpu and memory wise in case of high load on server.   
**How to use** - Change the load value and log directory path. Set the cron for this script and you are good to go.   
