function [L DL D2L DtaoL] = Space_Time_Kernel(c,n,m,totallength,y,tao,lamda)
deltaY=meshgrid(y(2*m+n+1:totallength),y)'-meshgrid(y,y(2*m+n+1:totallength));
deltaTao=meshgrid(tao(2*m+n+1:totallength),tao)'-meshgrid(tao,tao(2*m+n+1:totallength));
L=sqrt(deltaY.^2+lamda*deltaTao.^2+c^2);
DL=deltaY./L;
D2L=1./L-deltaY.^2./L.^3;
DtaoL=lamda*deltaTao./L;
end