
echo "generate training corpus for ZPar"
echo "input: test.cs,  word-level cs structure" 
echo "output: test.chars.zpar, character-level ZPar format"
python ../tools/binarize_noroot.py ../tools/rule.txt test.cs test.zpar
python ../tools/append_wordstructure.py -d ../tools/word.inner.zpar -i test.zpar -o test.chars.zpar -r remain.words

echo "unbinarized ZPar format into character-level cs format"
python ../tools/unbinarizeclt.py -i test.chars.zpar -o test.chars.cs

echo "evaluation using cs structure"
java -Xmx1G -jar ../tools/CLTEvaluate.jar test.chars.cs test.chars.cs
