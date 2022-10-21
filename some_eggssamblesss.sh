DEBUG_FLAG=false

if [[ "${DEBUG_FLAG:-false}" =~ (true|on|1) ]] ; then
  echo "~~~ :hammer: Enabling debug mode"
  set -x
fi


ENTRY_DETAIL=defined
# ENTRY_SOURCE=""
# ENTRY_DETAIL_TYPE=""
# ENTRY_RESOURCES=""

export ENTRY_VALIDATE_REPORT=15 #1111

if [ -z "${ENTRY_DETAIL}" ]
then
  export ENTRY_VALIDATE_REPORT=$((ENTRY_VALIDATE_REPORT ^ 1))
fi

if [ -z "${ENTRY_SOURCE}" ]
then
  export ENTRY_VALIDATE_REPORT=$((ENTRY_VALIDATE_REPORT ^ 2))
fi

if [ -z "${ENTRY_DETAIL_TYPE}" ]
then
  export ENTRY_VALIDATE_REPORT=$((ENTRY_VALIDATE_REPORT ^ 4))
fi

if [ -z "${ENTRY_RESOURCES}" ]
then
  export ENTRY_VALIDATE_REPORT=$((ENTRY_VALIDATE_REPORT ^ 8))
fi


## on the server

[ $(( ENTRY_VALIDATE_REPORT & 1 )) -eq 0 ] && {
  echo "[ERROR] Entry: detail not defined." 
}

export ENTRY_VALIDATE_REPORT=$((ENTRY_VALIDATE_REPORT >> 1))

[ $(( ENTRY_VALIDATE_REPORT & 1 )) -eq 0 ] && {
  echo "[ERROR] Entry: source not defined." 
}

export ENTRY_VALIDATE_REPORT=$((ENTRY_VALIDATE_REPORT >> 1))

[ $(( ENTRY_VALIDATE_REPORT & 1 )) -eq 0 ] && {
  echo "[ERROR] Entry: detail-type not defined." 
}

export ENTRY_VALIDATE_REPORT=$((ENTRY_VALIDATE_REPORT >> 1))

[ $(( ENTRY_VALIDATE_REPORT & 1 )) -eq 0 ] && {
  echo "[ERROR] Entry: resources not defined." 
}
