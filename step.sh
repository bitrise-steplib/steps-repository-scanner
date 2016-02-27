#!/bin/bash

export THIS_SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export red="\033[31m"
export yellow="\033[33m"
export blue="\033[34m"
export green='\033[32m'
export reset="\033[0m"

#=======================================
# Utility
#=======================================

log_fail() { # red
  echo -e "${red}${1}${reset}"
  exit 1
}

log_warn() { # yellow
	echo
  echo -e "${yellow}${1}${reset}"
}

log_info() { # blue
	echo
  echo -e "${blue}${1}${reset}"
}

log_details() {
  echo -e "  ${1}"
}

log_done() { # green
  echo -e "  ${green}${1}${reset}"
}

#=======================================
# Main
#=======================================

if [ -z "${source_root_path}" ] ; then
	log_fail "Missing required input: source_root_path"
fi

cd ${source_root_path}
if [ $? -ne 0 ]; then
	log_fail "Failed to cd into ${source_root_path}"
fi

project_type_detectors=(
	"${THIS_SCRIPTDIR}/detectors/ios.rb"
	"${THIS_SCRIPTDIR}/detectors/android.rb"
	"${THIS_SCRIPTDIR}/detectors/xamarin.rb"
  "${THIS_SCRIPTDIR}/detectors/fastlane.rb"
)

branch=$(git symbolic-ref --short HEAD)
if [ $? -ne 0 ] || [ "$branch" == "" ] ; then
	log_fail "Failed to get current branch"
fi

log_info "Running detection scripts on brach: $branch"
for i in "${!project_type_detectors[@]}" ; do
	ruby "${project_type_detectors[$i]}" "${branch}"

	if [ $? -ne 0 ]; then
		log_fail "detector ${project_type_detectors[$i]} failed"
	fi
done
# done

if [ ! -z "${scan_result_submit_url}" ] ; then
	log_done "Submitting results..."
	curl --fail -H "Content-Type: application/json" --data-binary @$HOME/.bitrise_config "${scan_result_submit_url}?api_token=${scan_result_submit_api_token}"
fi
