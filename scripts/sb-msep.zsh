#!/bin/zsh

# Monitor Some Egregious Process
msep() {
    # Initialize default values
    SERVICE_NAME=""
    INTERVAL=0

    # Function to show usage
    usage() {
        echo "Usage: $0 -n <SERVICE_NAME> -t <TIME_INTERVAL>"
        echo "  -n: Name of the service to monitor"
        echo "  -t: Time interval in seconds between checks"
        return 1
    }

    # Parse options
    while getopts "n:t:" opt; do
        case $opt in
            n) SERVICE_NAME=$OPTARG ;;
            t) INTERVAL=$OPTARG ;;
            *) usage ;;
        esac
    done

    # Validate required options
    if [ -z "$SERVICE_NAME" ] || [ -z "$INTERVAL" ]; then
        usage
        return 1
    fi

    # Validate if the time interval is a number
    if ! [[ "$INTERVAL" =~ ^[0-9]+$ ]]; then
        echo "The time interval must be a positive integer."
        return 1
    fi

    # Validate if the service exists
    if ! pgrep -f "$SERVICE_NAME" > /dev/null; then
        echo "Service '$SERVICE_NAME' is not running."
        return 1
    fi

    echo "Monitoring CPU and Memory usage for '$SERVICE_NAME' every $INTERVAL seconds. Press Ctrl+C to stop."

    # Loop indefinitely, press Ctrl+C to exit
    while true; do
        # Use ps to get cpu and memory usage of the service
        ps -eo pcpu,pmem,args | grep "[${SERVICE_NAME:0:1}]${SERVICE_NAME:1}" | awk '{cpu+=$1; mem+=$2} END {print "CPU Usage: " cpu "%, Memory Usage: " mem "%"}'

        # Wait for the specified interval before repeating
        sleep "$INTERVAL"
    done
}