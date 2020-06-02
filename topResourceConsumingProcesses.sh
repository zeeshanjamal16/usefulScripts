#!/bin/bash

currentCpuLoad=$(uptime | cut -d ',' -f 3 | awk '{print $3}')
cpuThreshold=10.00
logDirectoryName="topResourceUsageProcesses"
logDirectoryPath="/root/$logDirectoryName"
memoryLogFile="$logDirectoryPath/topMemoryProcesses.log"
cpuLogFile="$logDirectoryPath/topCpuProcesses.log"

echo $currentCpuLoad

processesMemoryWise=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head)
processesCpuWise=$(ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head)


if (( ${currentCpuLoad%%.*} > ${cpuThreshold%%.*} || ( ${currentCpuLoad%%.*} == ${cpuThreshold%%.*} && ${currentCpuLoad##*.} > ${cpuThreshold##*.} ) )) ; then    
        echo "Server under high load. Logging resources for processes .."
	touch $memoryLogFile
	touch $cpuLogFile

	echo "------------------" >> $memoryLogFile
	echo $date >> $memoryLogFile
	echo $processesMemoryWise >> $memoryLogFile
	echo "------------------" >> $memoryLogFile
	
	echo "------------------" >> $cpuLogFile
        echo $date >> $cpuLogFile
	echo $processesCpuWise >> $cpuLogFile
	echo "------------------" >> $cpuLogFile
        
fi
