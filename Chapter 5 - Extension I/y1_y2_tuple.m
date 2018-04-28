function [y1 y2] = y1_y2_tuple(n,Smin,Smax,dy)
A=[log(Smin):dy:log(Smax)]'*ones(1,n);
y2=reshape(A,n^2,1);
y1=reshape(A',n^2,1);
end