function [y tao] = y_tao_tuple(n,m,Smin,Smax,dy,T,dt)
y=log(Smin)*ones(m,1); % Spatial lower boundary
tao=[dt:dt:T]';
y=[y;log(Smax)*ones(m,1)]; % Spatial upper boundary
tao=[tao;tao];
y=[y; [log(Smin):dy:log(Smax)]']; % Time Initial Boundary
tao=[tao;zeros(n,1)];
% points in the middle
A=[log(Smin)+dy:dy:log(Smax)-dy]'*ones(1,m);
y=[y; reshape(A,(n-2)*m,1)];
clear A
A=[dt:dt:T]'*ones(1,n-2);
tao=[tao; reshape(A',(n-2)*m,1)];
end