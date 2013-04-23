INTRODUCTION
-----
main annotation data for joint parsing  
tools/word.inner.zpar  

COMMAND
-----
tools usage:  
python binarize_noroot.py rule.txt temp.cs temp.zpar  
In@rule.txt: head-finding rules  
In@temp.cs: phrase structure corpus, the same as as the input for berkeley parser, not including the extra "ROOT" label tree.  
Out@temp.zpar: output, for zpar word-based constituent parser to train  

python append_wordstructure.py -d word.inner.zpar -i temp.zpar -o temp.chars.zpar -r remain.words  
In@word.inner.zpar: word structur files. (x,y,z denote coor, right and left respectively)  
In@temp.zpar: zpar structure, word-based constituent parser  
Out@temp.chars.zpar: zpar structure, character-based constituent parser to train.  
Out@remain.words: in temp.zpar, some words may be not annotated, we print it in this file.  
 
python unbinarizeclt.py -i temp.chars.zpar -o temp.chars.cs   
In@temp.chars.zpar: zpar character-based constituent parser, train format  
Out@temp.chars.cs: berkeley parser in/out format.  
  
java -Xmx1G -jar CLTEvaluate.jar [-dict  train.ctb50.dict]  test.gold  test.predict  
In@train.ctb50.dict: alternative params, the words in training corpus, to test OOV performance.  
In@test.gold: gold corpus, berkeley parser in/out format.  
In@test.gold: predict corpus, berkeley parser in/out format.  
Out to standard console.  


REFERENCE  
-----
Meishan Zhang, Yue Zhang, Wanxiang Che, Ting Liu. Chinese Parsing Exploiting Characters. In Proceedings of the 51th Annual Meeting of the Association for Computational Linguistics (To appear in ACL 2013). 2013.08. Sofia, Bulgaria  
https://sites.google.com/site/mszhang0610/  
