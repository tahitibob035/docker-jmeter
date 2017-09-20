Stress Tests via the docker image and Apache Jmeter
===

# Introduction
---

The object is to start the stresstests with docker and Apache Jmeter :
 * `Apache Jmeter 3.2`
 * `Image Docker Openjdk 8u131-jdk-alpine`

Plugins Apache jmeter installed :
 * `plugins-manager-0.13` : manage the plugin
 * `plugins-casutg-2.1` : manage the user connections step by step

# 1. Installation
---

Connect to the server which will run the stresstests and copy the files below in your own directory :
 * `config.csv` : this is the file which contains jmeter variables
 * `docker-compose.yml` : docker-compose file which run the stresstests
 * `./testplans/plan.jmx` : your test plan in jmeter format (.jmx)

# 2. Configuration
---

Modify the config.csv with the real credentials :
 * **baseURL** : url of the application to test. This is a variable in the *.jmx* file.
 * add your own ApacheJmeter variables

 **Note** : Don't forget that this is a csv file, change the second line for modify the **baseURL** per example... Add **",parameter"** in the first line for new variables

Mount a volume in docker-compose with you own `./testplans/plan.jmx` :

```
services:
    jmeter:
      ...
      volumes:
        - $PWD/testplans/plan.jmx:/app/testsplans/testplan.jmx
      ...
```


# 3. Run the stresstests
---
Go to the directory where are the docker-compose.yml/config.csv files and run the stresstests :

``` bash
docker-compose up
```


# 4. Results
---
In the `./results/` directory.
