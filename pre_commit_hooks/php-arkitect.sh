#!/usr/bin/env bash

# Bash PHP Arkitect Task Runner
#
# Exit 0 if no errors found
# Exit 1 if errors were found
#
# Requires
# - php
#
# Arguments
# - None

# Plugin title
title="PHP Arkitect Task Runner"

# Possible command names of this tool
local_command="phparkitect.phar"
vendor_command="vendor/bin/phparkitect"
global_command="phparkitect"

# Print a welcome and locate the exec for this tool
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/helpers/colors.sh
source $DIR/helpers/formatters.sh
source $DIR/helpers/welcome.sh
source $DIR/helpers/locate.sh

command_to_run="${exec_command} check"

echo -e "${bldwht}Running command ${txtgrn} $command_to_run${txtrst}"
command_result=$($command_to_run 2>&1)
if [[ $command_result =~ ERRORS ]]
then
    hr
    echo -en "${bldmag}Violations detected ...${txtrst} \n"
    hr
    echo "$command_result"
    exit 1
fi
exit 0
