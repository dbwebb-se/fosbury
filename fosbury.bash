#!/usr/bin/env bash
#
# A template for creating command line scripts taking options, commands
# and arguments.
#
# Exit values:
#  0 on success
#  1 on failure
#



# Name of the script
SCRIPT=$( basename "$0" )

# Current version
VERSION="0.0.1"



#
# Message to display for usage and help.
#
function usage
{
    local txt=(
"Utility $SCRIPT for doing stuff."
"Usage: $SCRIPT [template] [folder]"
"Example: $SCRIPT javascript js-test"
"Options:"
"  --help, -h     Print help."
"  --version, -h  Print version."
    )

    printf "%s\n" "${txt[@]}"
}



#
# Message to display when bad usage.
#
function badUsage
{
    local message="$1"
    local txt=(
"For an overview of the command, execute:"
"$SCRIPT --help"
    )

    [[ -n $message ]] && printf "%s\n" "$message"

    printf "%s\n" "${txt[@]}"
}



#
# Message to display for version.
#
function version
{
    local txt=(
"$SCRIPT version $VERSION"
    )

    printf "%s\n" "${txt[@]}"
}

function config-github
{

}



#
# Function for taking care of specific command. Name the function as the
# command is named.
#
function get-files
{
    OWNER="dbwebb-se"
    REPO="fosbury"

    TEMPLATE="$1"
    FOLDER="$2"

    if ! mkdir "$FOLDER" >& /dev/null; then
        echo "Given folder ($FOLDER) already exists"
    fi

    RESPONSE=$(curl -s -u "emilfolino" \
        -H "Accept: application/vnd.github.v3+json" \
        "https://api.github.com/repos/$OWNER/$REPO/contents/$TEMPLATE")

    echo "$RESPONSE"
}



#
# Process options
#
while (( $# ))
do
    case "$1" in

        --help | -h)
            usage
            exit 0
        ;;

        --version | -v)
            version
            exit 0
        ;;

        config)
            config-github
            exit 0
        ;;

        *)
            get-files "$@"
            exit 0
        ;;

    esac
done

badUsage
exit 1
