function [P inv_L c]= Two_Dim_Kernel(y1,y2,dy,rho,sigma1,sigma2,r);
deltaY1=meshgrid(y1,y1)'-meshgrid(y1,y1);
deltaY2=meshgrid(y2,y2)'-meshgrid(y2,y2);
%Hardy's MQ
c=4*dy;
L=sqrt(deltaY1.^2+deltaY2.^2+c^2);
D1L=deltaY1./L;
D2L=deltaY2./L;
D11L=1./L-deltaY1.^2./L.^3;
D22L=1./L-deltaY2.^2./L.^3;
D12L=-deltaY1.*deltaY2./L.^3;
inv_L=inv(L);
% from P. 701, McDonald (2006) (i.e. Multi-variate Black Scholes Equation)
P=L\(-rho*sigma1*sigma2*D12L-0.5*sigma1^2*D11L-(r-0.5*sigma1^2)*D1L-...
    sigma2^2*D22L-(r-0.5*sigma2^2)*D2L+r*L);
end