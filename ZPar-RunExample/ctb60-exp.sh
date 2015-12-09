
if [ -d "ctb60" ]; then
   rm -rf ctb60
fi
mkdir ctb60
for i in `seq 1 50`;
do
    echo "Test iteration $i"
    ./chinese.conparser.train train.ctb60.chars.zpar ctb60/joint.model 1
    ./chinese.conparser.parser dev.ctb60.sentence ctb60/devo.txt.$i ctb60/joint.model
    java -Xmx1G -jar ../tools/CLTEvaluate.jar dev.ctb60.chars.cs  ctb60/devo.txt.$i
    ./chinese.conparser.parser test.ctb60.sentence ctb60/testo.txt.$i ctb60/joint.model
    java -Xmx1G -jar ../tools/CLTEvaluate.jar  test.ctb60.chars.cs ctb60/testo.txt.$i
    #cp ctb60/joint.model ctb60/joint.model.$i
done
