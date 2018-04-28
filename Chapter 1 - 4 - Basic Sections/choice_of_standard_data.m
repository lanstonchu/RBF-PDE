function [X r sigma T n m Smin Smax index]=choice_of_standard_data(datachoice);
% don't change the value of choice 1, choice 2, choice 3 and choice 4 unless necessary.
% for free variables, use choice 5 only.
if datachoice==1 % for example of European put; n can be 21, 61, 101, 141
    X = 10.0; r = 0.05; sigma = 0.2; T = 0.5; n=81; m=30;
    Smin=1.0; Smax=30;
    index=2:2:16;
elseif datachoice==2 % for example of American put;
    X = 100.0; r = 0.1; sigma = 0.3; T = 1; n=101; m=100;
    Smin=1.0; Smax=exp(6);
    index=80:5:120;
elseif datachoice==3 % for example of random;
    X = 10.0; r = 0.05; sigma = 0.2; T = 0.5; n=61; m=5;
    Smin=1.0; Smax=30;
    index=2:2:16;
elseif datachoice==4 % for example of Binary Options;
    X = 15.0; r = 0.05; sigma = 0.2; T = 0.25; n=101; m=60;
    Smin=1.0; Smax=30;
    index=5:1:20;
elseif datachoice==5 % for free choices;
    X = 10.0; r = 0.05; sigma = 0.2; T = 0.5; n=61; m=30;
    Smin=1.0; Smax=30;
    index=2:2:16;
end
end