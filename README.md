ACL2013-CharParsing
================
This is an example script to run the code of my ACL 2013 paper [Chinese Parsing Exploiting Characters](http://www.aclweb.org/anthology/P/P13/P13-1013.pdf)  


Please follow the below steps:  
(1) Download the code of [ZPar](https://github.com/zhangmeishan/ZPar).  
(2) Modify the "**setting**" file, finding the following line  
&ensp;&ensp;&ensp;&ensp;&ensp;`#chinese constituency parser: acl13(default), jcad`  
&ensp;&ensp;&ensp;ensuring that `CHINESE_CONSTITUENCY_PARSER  jcad`  
(3) run  "python configure.py chinese conparser"  
(4) run command `cmake . `  generate Makefile  
(5) compile using `make `    
(6) copy the bin files in the bin folder into folder `ZPar-RunExample`  
(7) run "./ctb60-exp.sh" in `ZPar-RunExample`  

================
There is another folder named `TreeGeneration`, telling one user that how to generate training corpus and character-level phrase structures.
* Training corpus generation  
&ensp;&ensp;&ensp;`python ../tools/binarize_noroot.py ../tools/rule.txt test.cs test.zpar`  
&ensp;&ensp;&ensp;`python ../tools/append_wordstructure.py -d ../tools/word.inner.zpar -i test.zpar -o test.chars.zpar -r remain.words`  
* Character-level phrase structures  
&ensp;&ensp;&ensp;`python ../tools/unbinarizeclt.py -i test.chars.zpar -o test.chars.cs`  

================
Any problems, please concat mason.zms@gmail.com.  

