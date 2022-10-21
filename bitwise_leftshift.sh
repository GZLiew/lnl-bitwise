DEBUG_FLAG=false

if [[ "${DEBUG_FLAG:-false}" =~ (true|on|1) ]] ; then
  echo "~~~ :hammer: Enabling debug mode"
  set -x
fi

INPUT=5
echo INPUT $INPUT
echo "obase=2;ibase=10;$INPUT" | bc -l

RESULT=$(($INPUT << 1))

echo RESULT $RESULT

echo "obase=2;ibase=10;$RESULT" | bc -l


















# Given a decimal number, prints its two's complement with the number of bits used by Bash
twos() {
    n=$(getconf LONG_BIT) # detect the machine architecture, 32bit or 64bit
    printf 'obase=2; 2^%d+%d\n' "$n" "$1" | bc | sed -E "s/.*(.{$n})$/\1/"
}

# twos "$INPUT"
# twos "$RESULT"















