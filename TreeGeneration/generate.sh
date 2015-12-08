
echo "generate training corpus for ZPar"
echo "input: temp.cs   output: temp.chars.zpar"
python ../tools/binarize_noroot.py ../tools/rule.txt temp.cs temp.zpar
python ../tools/append_wordstructure.py -d ../tools/word.inner.zpar -i temp.zpar -o temp.chars.zpar -r remain.words

echo "unbinarized ZPar input structure into phrase structure"
python ../tools/unbinarizeclt.py -i temp.chars.zpar -o temp.chars.cs
java -Xmx1G -jar ../tools/CLTEvaluate.jar test.chars.cs test.chars.cs
