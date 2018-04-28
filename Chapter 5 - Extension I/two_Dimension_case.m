% It is the main program for Extension 1
clear
tic
X = 10.0; r = 0.05; sigma1 = 0.25; sigma2=0.3; T = 0.75; n=21; m=30
rho=0.3; % correlation
Smin=1.0; Smax=30; %for both S1 and S2 (i.e. assumed similar scale)
index=2:4:14; % also for both S1 and S2
indexlength=size(index,2);
dt=T/m;
dy=log(Smax/Smin)/(n-1);
[y1 y2] = y1_y2_tuple(n,Smin,Smax,dy);
totallength=length(y1); % i.e. totallength = n^2
% Terminal/ Initial Condition, see P. 734, McDonald (2006)
IC=max(X,max(exp(y1),exp(y2)));
[P inv_L c]= Two_Dim_Kernel(y1,y2,dy,rho,sigma1,sigma2,r);
% BD1
a=inv_L*IC;
for i = 1:m
    a=a-dt*P*a;
end
u = TransformBack_2Dim(index,y1,y2,c,a,indexlength);
result=[0 index; index' u];
result=num2str(result);
result(1,1:5)='S1\S2';
result
toc