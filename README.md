# Monitoring v2.0

Real-time monitoring and research of the system status.


##  1. File generator

Write a bash script. The script is run with 6 parameters. An example of running a script: \
`main.sh /opt/test 4 az 5 az.az 3kb`

**1** - the absolute path. \
**2** - the number of subfolders. \
**3** - a list of English alphabet letters used in folder names. \
**4** - the number of files in each created folder. \
**5** - the list of English alphabet letters used in the file name and extension. \
**6** - file size (in kilobytes, but not more than 100).

Make a log file with data on all created folders and files (full path, creation date, file size).


## 2. File clogging

Write a bash script. The script is run with 3 parameters. An example of running a script: \
`main.sh az az.az 3Mb`

**Parameter 1** is a list of English alphabet letters used in folder names (no more than 7 characters). \
**Parameter 2** the list of English alphabet letters used in the file name and extension (no more than 7 characters for the name, no more than 3 characters for the extension). \
**Parameter 3** - is the file size (in Megabytes, but not more than 100).

When running the script, file folders must be created in different (any, except paths containing **bin** or **sbin**) locations on the file system.
Make a log file with data on all created folders and files (full path, creation date, file size).

## 3. Cleaning the system

The script is run with 1 parameter. The script should be able to clear the system from the folders and files created in file-clogging in 3 ways:

1. By log file
2. By creation date and time
3. By name mask (i.e. characters, underlining and date).


## 4. Log generator

Write a bash script or a C program that generates 5 **nginx** log files in *combined* format. Each log should contain information for 1 day.

A random number between 100 and 1000 entries should be generated per day.
For each entry there should be randomly generated the following:

`1. IP`
`2. Response codes` 
`3. methods`
`4. Dates`
`5. Agent request URL`
`6. Agents (Mozilla, Google Chrome, Opera, Safari, Internet Explorer, Microsoft Edge, Crawler and bot, Library and net tool)`


## 5. Monitoring

Write a script to parse **nginx** logs via **awk**.

Depending on the value of the 1 parameter, output the following:

`1. All entries sorted by response code`
`2. All unique IPs found in the entries`
`3. All requests with errors (response code - 4xx or 5xxx)`
`4. All unique IPs found among the erroneous requests`


##  6. GoAccess

Use the GoAccess utility to get the same information as in `Monitoring`


##  7. Prometheus/Grafana

##### Install and configure **Prometheus** and **Grafana**. 

##### Add to the **Grafana** dashboard a display of CPU, available RAM, free space and the number of I/O operations on the hard disk.

##### Check the hard disk load (disk space and read/write operations)

##### Install the **stress** utility and run the following command `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s` and check the hard disk, RAM and CPU load


## 8. A ready-made dashboard

##### Download the ready-made dashboard from `Grafana Labs` official website.

##### Check the network interface load

