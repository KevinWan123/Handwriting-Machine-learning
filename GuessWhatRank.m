clear
close all
clc

mydata = readtable('NBA_Team_Stats.csv')
season = mydata(523:667,:)
s21 = mydata(668:end,:)
season.Team= [];
season.Year = [];
season.Fgm_a = [];
season.x3gm_a = [];
season.Ftm_a = [];
season.G = [];
season.Eff= [];
season.Deff=[];


s21.Team= [];
s21.Year = [];
s21.Fgm_a = [];
s21.x3gm_a = [];
s21.Ftm_a = [];
s21.G = [];

s21.Eff= [];
s21.Deff=[];



mdl = fitcknn(season,"No","NumNeighbors",10,"DistanceWeight","squaredinverse")

predictions = predict(mdl, s21)

iswrong = predictions~= s21.No

error = sum(iswrong)/length(iswrong) *100

confusionchart(s21.No,predictions)

Knicks22prediction = [19,114.4, 49.4,24.6,5.8, 5.9,14.3,22,36.3,13.3,.466,.33,75.3,]

predict(mdl,Knicks22prediction)


