perl -p -i -e 's{\xB5}{\xC2\xB5}' NUTR_DEF.txt
perl -p -i -e 's{\x94}{\xe2\x80\xB3}' FOOTNOTE.txt
perl -p -i -e 's{\xA0}{\x20}' FOOTNOTE.txt
perl -p -i -e 's{\xE9}{\xC3\xA9}' WEIGHT.txt
perl -p -i -e 's{\x91}{\xE2\x80\x98}' FOOD_DES.txt
perl -p -i -e 's{\x92}{\xE2\x80\x99}' FOOD_DES.txt
