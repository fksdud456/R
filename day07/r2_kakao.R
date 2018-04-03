
library(KoNLP)
library(dplyr)
library(memoise)
library(stringr)
library(wordcloud)
library(RColorBrewer)

useNIADic()

txt <- readLines('KakaoTalk.txt', encoding = 'UTF-8')

txt2 <- gsub('\\[?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*?\\]', '', txt)

txt2 <- gsub('\\[(*[a-zA-Z]*)(*[가-힣]*)(*[0-9]*)\\]', '', txt2)
txt2 <- gsub(' \\[(*[가-힣]*)(*[0-9]*)\\]', '', txt2)
txt2 <- gsub('\\[?(*[가-힣]*)\\]', '', txt2)
txt2 <- gsub('\\[?(*[0-9]*)\\]', '', txt2)


txt2 <- gsub('^\\[ + \\] + $', '', txt)
txt2 <- gsub('^\\[[a-z]', '', txt2);
txt2 <- gsub('^\\[[a-Z]', '', txt2);

txt <- gsub('[0-9]', '', txt);
txt <- gsub('[a-z]', '', txt);
txt <- gsub('[A-Z]', '', txt);

txt <- gsub('\\W', ' ', txt);
txt <- gsub('  ', '', txt);
txt <- gsub('__', '', txt);
txt <- gsub('_', '', txt);

noun <- extractNoun(txt)
vc <- unlist(noun)
wc <- table(vc)
wf <- as.data.frame(wc, stringsAsFactors = F)

wf <- filter(wf, nchar(vc) >= 2)

str(wf)


# wordcloud 패키지
library(wordcloud)
library(RColorBrewer)

pal<- brewer.pal(8, "Set2")
# 난수를 발생시켜서 wordcloud의 모양을 만든
set.seed(2021)

?brewer.pal
# jpeg 파일로 저장
jpeg(filename = "mycloud.jpg", width = 680,
     height = 680, quality = 100)
p = wordcloud(words = wf$vc,
              freq = wf$Freq,
              max.words = 200,
              random.order = F,
              rot.per = .1,
              scale = c(1, 1),
              colors = pal)

print(p)
dev.off()
