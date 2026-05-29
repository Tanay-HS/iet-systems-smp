#!/bin/bash

# --- Column Meanings ---
# State: current connection status
# Local Address: your machine’s IP address and port
# Remote Address: destination IP address and port
# Process: program/process using the connection

echo "========================================================================="
echo "                  ACTIVE NETWORK CONNECTIONS & PROCESSES                 "
echo "========================================================================="

sudo ss -tunp | column -t

