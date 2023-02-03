
OUTPUT_DIRECTORY=$DATA_DIR/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_`date +%R`.csv


echo "Size,Type,Time" > $OUTPUT_FILE;

{
  read
  while IFS=, read -r size al_type
  do
    ../src/parallelQuicksort $size $al_type "\n" >> $OUTPUT_FILE;
  done 
} < "$DATA_DIR/experiments/qs_experiment.csv"