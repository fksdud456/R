# 한국어 문장에 대한 명사형을 추출할 수 있는 패키지
# KoNLP(Korean Natural Language Processing)

# 설치되어 있는 jdk 를 연동하는 역할 
# error : JAVA_HOME cannot be determined from the Registry
# solution : 
# 환경변수 setting
# system 변수에 
# JAVA_HOME C:\Program Files\Java\jdk-9.0.4
# 
library('memoise')


library(rJava)
library(dplyr)
# 한국어 명사형에 대한 dictionary
library('KoNLP')
# 특수문자 제거
library('stringr')

useNIADic();
txt <- readLines('https://blog.naver.com/mactavish711/221200317910')
# 특수문자를 공백으로 변환
 txt <- str_replace_all(txt, '\\W', ' ')
 txt <- str_replace_all(txt, '[0-9]', ' ')
# txt <- gsub('\\W', ' ', txt);
# txt <- gsub('[0-9]', '', txt);
# txt <- gsub('[a-z]', '', txt);
# txt <- gsub('[A-Z]', '', txt);

noun <- extractNoun(txt);
# 리스트 -> vector 로 변경
vc <- unlist(noun)
# 단어 별 등장 횟수를 table로 만들어줌
wc <-table(vc)
# string 들을 Factor로 넣지 않고 string형태로 넣겠다
wf <- as.data.frame(wc, stringsAsFactors = F)
# data frame colume 명 : VC
head(wf)
wf <- filter(wf, nchar(vc) >= 2)
wf <- filter(wf, nchar(Freq) >= 2)
wf <- head(wf[order(wf$Freq, decreasing = T), ], 200)


# wordcloud 패키지
library(wordcloud)
library(RColorBrewer)

?brewer.pal
pal<- brewer.pal(5, "Set1")
# 난수를 발생시켜서 wordcloud의 모양을 만든
set.seed(2021)


# jpeg 파일로 저장
jpeg(filename = "mycloud.jpg", width = 680,
     height = 680, quality = 100)
p = wordcloud(words = wf$vc,
          freq = wf$Freq,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

print(p)
dev.off()
