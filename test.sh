#/bin/bash

source ./debug.sh

### your stuff goes below
# here is just a example

# This script will send a spacecraft to the moon

launch()
{
  if [ "$1" == "rocket2" ]; then
    echo "$1 launched successfully!"
  else
    err "Failed to launch $1"
    return -1
  fi
}

count_down()
{
  for i in {3..1}; do
    echo "    $i"; sleep 1
  done
  echo "    GO!"
}

steady_loop ()
{
  local num=$1
  local loop=$(seq 1 $num)
  for i in $loop; do
    info "The rocket is steady"; sleep .5
  done
}

detach()
{
  local phase="$1"
  warn "Attention, the rocket is about to start $phase detach"; sleep .3
  info "$phase detaching"; sleep 1; info "Finish $phase detach"
}

## main

PRJNAME="Ollopa"
AST="Legweak"
PLANET="Moon"

echo "This is project $PRJNAME"
echo "This project is about sending astronaut $AST to the $PLANET"
echo "====="
info "Everyone, get ready..."
warn "Sir $AST, Please tighten your belt!"
count_down
echo "Trying lauch rocket1..."; sleep .5
run launch rocket1
[ $? -ne 0 ] && echo "Trying lauch rocket2..."; sleep .5; run launch rocket2
info "The rocket is accelerating..."; sleep .5
warn "The rocket deviated the track for 0.002%%"; sleep .5
info "Recalculating track..."; sleep .5
steady_loop 4
detach phase1
steady_loop 3
detach phase2
steady_loop 6
warn "About to landing on the $PLANET"; sleep .5
echo "Successfully landed"
