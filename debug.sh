SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

cd $SCRIPT_PATH

(./simavr/run_avr ../output/output.axf -g &)

avr-gdb \
  -ex 'file ../output/output.axf' \
  -ex 'target remote :1234' \
  -ex 'b main' \
  -ex continue \
;
