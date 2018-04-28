% It is the main program for basic section
clear
datachoice=1;
randomchoice=0;
putorcall=1;
kernelchoice=10;
optionchoice=10;
intschchoice=1;
eigen_rep_choice=0;
tic
[X r sigma T n m Smin Smax index]=choice_of_standard_data(datachoice);
indexlength=size(index,2);
dt=T/m;
k=1:n;
dy=log(Smax/Smin)/(n-1);
small_ds=dy/100; % for calculating delta
if randomchoice==0
    y=log(Smin)+(k-1)*dy;
elseif randomchoice==1
    y=log(Smin)+random_number_generator(Smax,n);
    % we still define dy as constant, for the use of Hardy's MQ
end
IC=initial_condition(X,y,putorcall);
[L DL D2L,c] = choice_of_kernel(kernelchoice,n,y,dy);
inv_L=inv(L);
a=inv_L*IC;
P=r*eye(n,n)-0.5*sigma^2*inv_L*D2L-(r-0.5*sigma^2)*inv_L*DL;
for i = 1:m %time
    a=type_of_option(L,inv_L,a,X,i,r,dt,y,n,optionchoice,putorcall);
    a=choice_of_int_sch(a,P,dt,n,intschchoice);
end
% Backward transform to obtain the European option prices (Compare with Table 2 on Page 11)
[u uplus] = TransformBack(index,y,c,a,small_ds,indexlength,kernelchoice);
delta=(uplus-u)/small_ds;
[['Stock  '; 'Option '; 'Delta  '] num2str([index; u;delta])]
toc
if eigen_rep_choice==1;
    alpha_by_eigen = Eigenvalue_Representation(P,L,inv_L,IC,T,index,y,c,small_ds,indexlength,kernelchoice);
elseif eigen_rep_choice==0;
end