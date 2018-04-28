clear
tic
X = 10.0; r = 0.05; sigma = 0.2; T = 0.5; n=21; m=100;
Smin=1.0; Smax=30;
scale=150;
index=2:2:16;
indexlength=size(index,2);
dt=T/m;
k=1:n;
dy=log(Smax/Smin)/(n-1);
[y tao] = y_tao_tuple(n,m,Smin,Smax,dy,T,dt);
totallength=length(y); % i.e. totallength = (m+1)*n
%Initialize BC1 and BC2 as column matrix
BC1=[0; 0];
BC2=[0; 0];
IC=[0; 0];
% Spatial and Time boundary condition
for i=1:m % time
    BC1(i)=X*exp(-r*i*dt); % for European Put Option; i for tao = (m-i) for t
    BC2(i)=0;
    IC=max(X-exp(y(2*m+1:2*m+n)),0);
end
lamda=scale*(log(Smax)/T)^2;
c=4*dy;
for i = 1:2*m+n
    for j = 1:totallength
        L_boundary(i,j)=sqrt((y(i)-y(j))^2+lamda*(tao(i)-tao(j))^2+c^2);
    end
end
[L DL D2L DtaoL] = Space_Time_Kernel(c,n,m,totallength,y,tao,lamda);
P=-DtaoL+0.5*sigma^2*D2L+(r-0.5*sigma^2)*DL-r*L; %Operator
a=[L_boundary; P]\[BC1; BC2; IC;zeros(m*(n-2),1)];
for i = 1:indexlength
    u(i)=sqrt((log(index(i))-y).^2 + lamda*(T-tao).^2+c^2)'*a;
end
[index; u]
toc