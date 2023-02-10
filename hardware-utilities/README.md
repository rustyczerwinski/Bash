# hardware-utilities

## What is this?

These are Bash scripts to query nodes to and get properties

## Pre-requisites

None

## Example commands

Will read IPs from IPs.txt and give the properties (listed in fru_properties.txt) in CSV formate
```bash
get_nodes_properties_csv.sh IPs.txt
```

Will take IP as input parameter and give the properties (listed in fru_properties.txt) in CSV formate
```bash
get_node_properties.sh 10.117.12.140
```