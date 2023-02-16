make
if [ ! -e hwdataset ]; then
  wget http://www.statmt.org/lm-benchmark/1-billion-word-language-modeling-benchmark-r13output.tar.gz -O hwdataset.gz
  gzip -d hwdataset.gz -f
fi
time ./word2vec -train hwdataset -output hwdataset.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
./distance hwdataset.bin
