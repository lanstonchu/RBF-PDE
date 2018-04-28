function [L DL D2L, c] = choice_of_kernel(kernelchoice,n,y,dy)
deltaY=meshgrid(y,y)'-meshgrid(y,y);
if kernelchoice == 10 % suppose kernelchoice = 10 refers to Hardy's MQ;
    c=4*dy;
    L=sqrt(deltaY.^2+c^2);
    DL=deltaY./L;
    D2L=1./L-deltaY.^2./L.^3;
elseif kernelchoice == 20 % suppose kernelchoice = 20 refers to Gaussian spline;
    c = exp(6)*dy;
    L=exp(-(c*deltaY).^2);
    DL=-2*(c^2)*deltaY.*L;
    D2L=-2*(c^2)*deltaY.*DL-2*(c^2)*L;
elseif kernelchoice == 30 % which refers to thin plate spline
    c=2; % Power of the kernel
    L=deltaY.^(2*c).*log(abs(deltaY));
    DL=deltaY.^(2*c-1)+2*c*L./deltaY;
    D2L=(4*c-1)*deltaY.^(2*c-2)+(4*c^2-2*c)*L./deltaY.^2;
    % to place the ?¡±NaN?? diagonal by the limit of the function
    L(1:length(L)+1:numel(L)) = 0;
    DL(1:length(DL)+1:numel(DL)) = 0;
    D2L(1:length(D2L)+1:numel(D2L)) = 0;
end
end