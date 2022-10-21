
DEBUG_FLAG=false

if [[ "${DEBUG_FLAG:-false}" =~ (true|on|1) ]] ; then
  echo "~~~ :hammer: Enabling debug mode"
  set -x
fi

INPUT_ONE=2
INPUT_TWO=3

RESULT=$(echo "$(($INPUT_ONE & $INPUT_TWO))")

echo INPUT_ONE $INPUT_ONE
echo INPUT_TWO $INPUT_TWO
echo "$INPUT_ONE & $INPUT_TWO"
echo RESULT $RESULT

echo base 10 of INPUT_ONE
echo "obase=10;ibase=2;$INPUT_ONE" | bc -l
echo base 10 of INPUT_TWO
echo "obase=10;ibase=2;$INPUT_TWO" | bc -l
echo base 10 of RESULT
echo "obase=10;ibase=2;$RESULT" | bc -l































# Given a decimal number, prints its two's complement with the number of bits used by Bash
twos() {
    n=$(getconf LONG_BIT) # detect the machine architecture, 32bit or 64bit
    printf 'obase=2; 2^%d+%d\n' "$n" "$1" | bc | sed -E "s/.*(.{$n})$/\1/"
}

# Given a two's complement representation of a signed number, prints its decimal notation
inverse() {
  printf 'n=%d; ibase=2; v=%s; v-2^n*(v/2^(n-1))\n' "$(getconf LONG_BIT)" "$1"| bc
}

INPUT_ONE=$(twos 31)
INPUT_TWO=$(twos 1)

RESULT=$(echo "$(($INPUT_ONE & $INPUT_TWO))")

echo INPUT_ONE $INPUT_ONE
echo INPUT_TWO $INPUT_TWO
echo RESULT $RESULT

echo "obase=10;ibase=2;$INPUT_ONE" | bc -l
echo "obase=10;ibase=2;$INPUT_TWO" | bc -l
echo "obase=10;ibase=2;$RESULT" | bc -l


