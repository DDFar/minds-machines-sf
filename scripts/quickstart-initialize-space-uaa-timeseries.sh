#!/bin/bash
set -e

function local_read_args() {
  while (( "$#" )); do
  opt="$1"
  case $opt in
    -h|-\?|--\?--help)
      PRINT_USAGE=1
      QUICKSTART_ARGS="$SCRIPT $1"
      break
    ;;
    -b|--branch)
      BRANCH="$2"
      QUICKSTART_ARGS+=" $1 $2"
      shift
    ;;
    -o|--override)
      QUICKSTART_ARGS=" $SCRIPT"
    ;;
    --skip-setup)
      SKIP_SETUP=true
    ;;
    *)
      QUICKSTART_ARGS+=" $1"
      #echo $1
    ;;
  esac
  shift
  done

  if [[ -z $BRANCH ]]; then
    echo "Usage: $0 -b/--branch <branch> [--skip-setup]"
    exit 1
  fi
}

BRANCH="master"
PRINT_USAGE=0
SKIP_SETUP=false
#ASSET_MODEL="-amrmd predix-ui-seed/server/sample-data/predix-asset/asset-model-metadata.json predix-ui-seed/server/sample-data/predix-asset/asset-model.json"
#SCRIPT="-script build-basic-app.sh -script-readargs build-basic-app-readargs.sh"
#QUICKSTART_ARGS="-ba -uaa -asset -ts -wd -nsts $SCRIPT"
SCRIPT="-script build-basic-app.sh -script-readargs build-basic-app-readargs.sh"
QUICKSTART_ARGS="-ba -uaa -ts $SCRIPT"
VERSION_JSON="version.json"
PREDIX_SCRIPTS=predix-scripts
REPO_NAME=minds-machines-sf
SCRIPT_NAME="quickstart-initialize-space-uaa-timeseries.sh"
APP_DIR="build-basic-app"
APP_NAME="MMSanFrancisco Space Setup"
TOOLS="Cloud Foundry CLI, Git, Node.js, Maven, Predix CLI"
TOOLS_SWITCHES="--cf --git --nodejs --maven --predixcli"

local_read_args $@
IZON_SH="https://raw.githubusercontent.com/PredixDev/izon/$BRANCH/izon.sh"
VERSION_JSON_URL=https://raw.githubusercontent.com/PredixDev/minds-machines-sf/$BRANCH/version.json

function check_internet() {
  set +e
  echo ""
  echo "Checking internet connection..."
  curl "http://google.com" > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "Unable to connect to internet, make sure you are connected to a network and check your proxy settings if behind a corporate proxy"
    echo "If you are behind a corporate proxy, set the 'http_proxy' and 'https_proxy' environment variables.   Please read this tutorial for detailed info about setting your proxy https://www.predix.io/resources/tutorials/tutorial-details.html?tutorial_id=1565"
    exit 1
  fi
  echo "OK"
  echo ""
  set -e
}

function init() {
  currentDir=$(pwd)
  if [[ $currentDir == *"scripts" ]]; then
    echo 'Please launch the script from the root dir of the project'
    exit 1
  fi
  if [[ ! $currentDir == *"$REPO_NAME" ]]; then
    mkdir -p $APP_DIR
    cd $APP_DIR
  fi

  check_internet


  #get the script that reads version.json
  eval "$(curl -s -L $IZON_SH)"

  getVersionFile
  getLocalSetupFuncs
}

if [[ $PRINT_USAGE == 1 ]]; then
  init
  __print_out_standard_usage
else
  if $SKIP_SETUP; then
    init
  else
    init
    __standard_mac_initialization
  fi
fi

getPredixScripts
#clone the repo itself if running from oneclick script
getCurrentRepo

echo "quickstart_args=$QUICKSTART_ARGS"
source $PREDIX_SCRIPTS/bash/quickstart.sh $QUICKSTART_ARGS -i "MMSanFranciscoTeam"

# # Source file_utils to modify manifest.yml for timeseries_seed_app
# source $PREDIX_SCRIPTS/bash/scripts/files_helper_funcs.sh
# __find_and_replace

#Creating loadpump cups
cf cups MMSanFrancisco_timeseries_loadData -p '{"query":{"uri":"https://time-series-store-predix.run.aws-usw02-pr.ice.predix.io/v1/datapoints","zone-http-header-name":"Predix-Zone-Id","zone-http-header-value":"2dc1efc3-10d3-4262-8f0d-6a990160aed3"}}'

#Creating heatpump cups
cf cups MMSanFrancisco_timeseries_heatPump -p '{"query":{"uri":"https://time-series-store-predix.run.aws-usw02-pr.ice.predix.io/v1/datapoints","zone-http-header-name":"Predix-Zone-Id","zone-http-header-value":"d23057a0-0cd3-4f50-ae72-918883641e98"}}'

#Creating uaa cups
cf cups MMSanFrancisco_uaa_admin -p '{"uri":"https://0f074596-79e5-4a1d-8900-707be1c73815.predix-uaa.run.aws-usw02-pr.ice.predix.io"}'

__append_new_line_log "Successfully completed $APP_NAME installation!" "$quickstartLogDir"
__append_new_line_log "" "$quickstartLogDir"
