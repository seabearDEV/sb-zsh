#!/bin/zsh

# Monitor and kill Some Egregious Process
mksep() {
    # Initialize default values
    TEST_MODE=0
    SLEEP_TIME=60
    SERVICE_NAME="Some Egregious Process"

    # Function to display usage information
    usage() {
        echo "Usage: $0 [-n SERVICE_NAME] [-s SLEEP_TIME] [-t]"
        echo "  -n    Set the service name to monitor and kill. Default is 'Some Egregious Process'."
        echo "  -s    Set sleep time between checks. Default is 60 seconds."
        echo "  -t    Enable test mode. Does not actually kill the process, just simulates."
        return 1
    }

    # Check if no arguments are provided
    if [ $# -eq 0 ]; then
        usage
        return 1
    fi

    # Parse command line options
    while getopts ":n:s:t" opt; do
        case $opt in
            n) SERVICE_NAME=$OPTARG ;;
            s) SLEEP_TIME=$OPTARG ;;
            t) TEST_MODE=1 ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                usage
                return 1
                ;;
            :)
                echo "Option -$OPTARG requires an argument." >&2
                usage
                return 1
                ;;
        esac
    done

    # Shift the positional parameters to remove the parsed options
    shift $((OPTIND -1))

    # Function to check if the service exists
    service_exists() {
        if pgrep -f "$SERVICE_NAME" >/dev/null 2>&1; then
            return 0
        else
            return 1
        fi
    }

    # Check if the service exists before starting the monitoring loop
    if service_exists; then
        # Infinite loop to continuously monitor and kill the process
        while true; do
            # Find the process ID (PID) of the service
            PID=$(pgrep -f "$SERVICE_NAME")

            if [ -n "$PID" ]; then
                if [ "$TEST_MODE" -eq 1 ]; then
                    echo "Would kill $SERVICE_NAME with PID $PID (Test Mode)"
                else
                    # Kill the process and display a message
                    pkill -f "$SERVICE_NAME" && echo "Killed process for $SERVICE_NAME with PID: $PID"
                fi
            else
                echo "No process found for $SERVICE_NAME."
            fi

            # Sleep for the specified duration and display a message
            echo "Sleeping for $SLEEP_TIME seconds, Ctrl+C to stop..."
            sleep "$SLEEP_TIME"
        done
    else
        echo "Service '$SERVICE_NAME' not found. Exiting."
        return 1
    fi
}