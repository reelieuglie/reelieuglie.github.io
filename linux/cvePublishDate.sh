#!/bin/bash
###
# Snags the Publish Date from cveawg.mitre.org/api/cve for given CVE ID
###

####
# Variables
####
cveurl="https://cveawg.mitre.org/api/cve"

###
# functions
###
commandval () {
if ! command -v $1 > /dev/null 2>&1; then
	echo "$1 not installed. Please install curl."
	exit 1
fi
}

usage() {
    cat <<EOF
Usage: $0 [options]

Options:
    -h|--help  Usage info; functionally this message
    -c|--cve-id   cve: CVE ID 
* Requires jq and curl installed
* Requires access to "cveawg.mitre.org/api/cve/"
EOF
}

unknown_option_help() {
	cat <<EOF
+++ Unknown Option(s) "$@" Provided +++
+++ See Help Below +++
	usage
EOF
}

####
# Collect input for variables
####

while (( $# > 0 )); do
	case $1 in
		-c|--cve-id) cveid=$2; shift;;
		-h|--help) usage;
			exit 1;;
		*) unknown_option_help "$@"; exit 2;;
	esac
	shift
done


####
# Command Validation
####

for i in curl jq; do commandval $i; done

####
# Get CVE Publish Date Date
####
# curl -sf https://cveawg.mitre.org/api/cve/CVE-2025-22874 | jq ' { CVE:(.cveMetadata.cveId) ,DatePublished:(.cveMetadata.datePublished)}'

curl -sf $cveurl/$cveid | jq ' { CVE:(.cveMetadata.cveId) ,DatePublished:(.cveMetadata.datePublished)}'
