

;smokerdore64-cxn.prg ==0801==
    0 rem *********************************
    1 rem
    2 rem cityxen smokerdore 64
    3 rem controller program v 1.0
    4 rem
    5 rem copyright 2020 cityxen
    6 rem
    7 rem written by deadline
    8 rem
    9 rem *********************************
   10 ifa$=""thena$="1":load"screen",8,1
  100 gosub 10000
 1000 rem main menu program
 1004 poke53280,0
 1005 gosub 9000
 1010 rem main menu keyboard loop
 1020 get a$:if a$="" then 1020
 1030 ifa$="1"thengosub20000:goto1500
 1035 ifa$="2"thengosub20100:goto1500
 1040 ifa$="3"thengosub20200:goto1500
 1050 ifa$="4"thengosub20300:goto1500
 1060 ifa$="5"thengosub20400:goto1500
 1062 ifa$="0"thengosub20500:goto1500
 1080 ifa$="+"thenk1=k1+10
 1085 ifa$="-"thenk1=k1-10
 1090 ifa$="{f1}"thengosub30100:goto1010
 1100 ifa$="c"thengosub30300:goto1500
 1499 goto 1010
 1500 rem main inner loop
 1505 print "{clr}"
 1510 rem main inner inner loop
 1520 get a$
 1590 ifa$="{f1}"thengosub30100
 1591 ifa$="+"thenk1=k1+10
 1592 ifa$="-"thenk1=k1-10
 1593 ifa$="{f7}"thengosub30200
 1990 gosub 2000:rem read temp
 1995 gosub 3000:rem print screen
 1996 gosub 4000
 1997 gosub 30000:rem heat on or off
 1998 if dun=1 then goto 7000
 1999 goto 1510
 2000 rem ********* update temperature
 2005 tr=1.84*peek(54297)
 2010 r=1/(1/tr-1/1000)
 2020 t=1/((log(r/k2))/k1+1/273)-273
 2030 ft=((t/5)*9)+32
 2035 heat=0
 2040 if ft < ctmp then heat = 1
 2999 return
 3000 print"{home}":rem ******* update screen
 3001 print"{yel}       smokerdore 64 v1.0 (c) 2020{wht}"
 3002 print "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
 3003 print " press f1 to toggle light"
 3004 print " press +/- to fine tune temperature"
 3005 h$=left$(ti$,2)
 3009 print "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
 3010 m$=mid$(ti$,3,2)
 3015 s$=right$(ti$,2)
 3020 print
 3085 print "       {yel}time smoked  {wht}:{yel} ";h$;":";m$;":";s$
 3090 print "       {yel}elapsed secs {wht}:{yel}";esecs
 3100 print "       {yel}cook time    {wht}:{yel}";cktm
 3105 print "       {wht}CCCCCCCCCCCCCCCCCCCCCCCCC"
 3120 print "       {grn}k1 tmp sensor{wht}:{grn}";k1
 3122 print "       {grn}k2 tmp sensor{wht}:{grn}";k2
 3134 print "       {grn}tmp resistnce{wht}:{grn}";r
 3135 print "       {wht}CCCCCCCCCCCCCCCCCCCCCCCCC"
 3138 print "       {lblu}tmp celsius  {wht}:{lblu}";t
 3139 print "       {lblu}tmp farenht  {wht}:{lblu}";ft
 3140 print "       {lblu}cook tmp (f) {wht}:{lblu}";ctmp
 3145 print "       {wht}CCCCCCCCCCCCCCCCCCCCCCCCC"
 3150 print "       {lred}heat         {wht}:{lred}";heat
 3220 print "       {lred}light        {wht}:{lred}";l
 3230 print "       {wht}CCCCCCCCCCCCCCCCCCCCCCCCC"
 3250 print "       {cyn}done         {wht}:{cyn}";dun
 3500 return
 4000 rem ********* update done status
 4005 if(ti$<>lti$) then lti$=ti$:esecs=esecs+1
 4010 if val(ti$) >= cktm then dun = 1
 4199 return
 7000 rem done cooking! sound alarm
 7002 mt$=ti$
 7005 heat=0:gosub30000
 7010 print "{clr}{grn}"
 7015 print"{yel}       smokerdore 64 v1.0 (c) 2020{wht}"
 7016 print "{down}{lred}   {rvon}heating element has been turned off{grn}":print
 7020 print "      {CBM-D}{CBM-I}{CBM-I}{CBM-I}{CBM-F}  {CBM-D}{CBM-I}{CBM-I}{CBM-I}{CBM-F} {CBM-D}{CBM-I}  {CBM-I}  {CBM-D}{CBM-I}{CBM-I}{CBM-I}  {CBM-I}"
 7030 print "       {rvon} {rvof}  {rvon} {rvof}  {rvon} {rvof}   {rvon} {rvof}  {rvon} {rvof}{CBM-B} {rvon} {rvof}  {rvon} {rvof}     {rvon} {rvof}  "
 7040 print "       {rvon} {rvof}  {rvon} {rvof}  {rvon} {rvof}   {rvon} {rvof}  {rvon} {rvof} {CBM-B}{rvon} {rvof}  {rvon} {rvof}{CBM-I}{CBM-I}   {rvon} {rvof}  "
 7050 print "       {rvon} {rvof}  {rvon} {rvof}  {rvon} {rvof}   {rvon} {rvof}  {rvon} {rvof}  {rvon} {rvof}  {rvon} {rvof}          "
 7060 print "      {CBM-D}{rvon} {rvof}{CBM-I}{CBM-I}{rvon}{CBM-D}{rvof}  {rvon}{CBM-F}{rvof}{CBM-I}{CBM-I}{CBM-I}{rvon}{CBM-D}{rvof}  {rvon} {rvof}  {rvon} {rvof}{CBM-F} {rvon}{CBM-F}{rvof}{CBM-I}{CBM-I}{CBM-I}  {rvon} {rvof}  "
 7061 print "{down}{down}            get yo meat out!"
 7062 h$=(left$(mt$,2))
 7063 m$=(mid$(mt$,3,2))
 7064 s$=(right$(mt$,2))
 7070 print"{down}{down}        smoker ran for ";h$;":";m$;":";s$
 7080 print "{down}              at";ctmp;"degrees"
 7090 print "{down}{down}       {yel}{rvon}press any key to continue"
 7100 s=54272
 7900 i=0
 7901 s=54272
 7902 forl=0to24:pokes+l,0:next
 7903 pokes+14,5:pokes+18,16:pokes+3,1
 7904 pokes+24,143:pokes+6,240:pokes+4,65
 7905 fr=5389
 7910 i=i+1:ifi>255theni=0
 7920 poke 53280,i
 7930 get a$:if a$<>"" then pokes+24,0:gosub10250:goto1000
 7934 fq=fr+peek(s+27)*3.5
 7935 hf=int(fq/256):lf=fq-hf*256
 7936 pokes+0,lf:pokes+1,hf
 7940 goto 7910
 7999 end
 9000 rem ********* draw screen
 9010 sys51154
 9040 return
 9999 end
 10000 print"{clr}":poke53280,0:poke53281,0
 10100 poke 53272,21
 10150 poke 56579,255:poke 56577,255
 10155 rh=1:h=0
 10156 rl=2:l=0
 10200 rem:gosub 900
 10250 rem begin variable initialization
 10300 ti$="000000"
 10305 lti$="000000"
 10310 secs=0
 10315 esecs=0
 10400 k1=3850
 10500 k2=723
 10600 dun=0:rem done condition
 10700 cktm=14400:rem default cook time
 10800 cktm=6
 10850 rem 2  hours = 7200
 10900 rem 4  hours = 14400
 10910 rem 8  hours = 28800
 10920 rem 12 hours = 43200
 11000 rem set default control temp
 11010 ctmp=180
 11020 atmp=80
 11030 heat=0
 19999 return
 20000 rem set 4 hours at 180 values
 20010 ti$="000000":cktm=14400:dun=0:ctmp=180
 20099 return
 20100 rem set 8 hours at 180 values
 20110 ti$="000000":cktm=28800:dun=0:ctmp=180
 20199 return
 20200 rem set 4 hours at 225 values
 20210 ti$="000000":cktm=14400:dun=0:ctmp=225
 20299 return
 20300 rem set 8 hours at 225 values
 20310 ti$="000000":cktm=28800:dun=0:ctmp=225
 20399 return
 20400 rem set 12 hours at 225 values
 20410 ti$="000000":cktm=43200:dun=0:ctmp=225
 20499 return
 20500 rem set 15 secs at 500 values (super secret setting shhh)
 20510 ti$="000000":cktm=15:dun=0:ctmp=500
 20599 return
 30000 rem set heat element
 30001 p=255-peek(56577)
 30005 ifheat=1thenpoke56577,(255-(p or rh)):return
 30006 poke56577,(255-(p and rl)):return
 30100 rem toggle light
 30101 p=255-peek(56577)
 30105 if l=0 then l=1:poke56577,(255-(p or rl)):return
 30108 l=0:poke56577,(255-(p and rh)):return
 30200 rem turn off heat element
 30210 heat=0:gosub 30000
 30220 return
 30300 rem set custom cook temp/time
 30310 print "{clr}{wht}enter custom temp and time"
 30312 print"{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}{CBM-Y}"
 30320 print "enter temp (f):";:input a
 30322 if a>275 then print"too high. enter 275 or less": goto30320
 30323 if a<60 then print"too low. enter 60 or higher": goto 30320
 30325 ctmp=a
 30330 print "enter time (in seconds):";:input b
 30340 cktm=b
 30490 ti$="000000"
 30500 return

