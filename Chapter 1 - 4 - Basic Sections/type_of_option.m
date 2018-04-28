function a=type_of_option(L,inv_L,a,X,i,r,dt,y,n,optionchoice,putorcall)
U=L*a;
if optionchoice == 10 & putorcall==1 % European put option;
    U(1)=X*exp(-r*i*dt);
elseif optionchoice == 10 & putorcall==10 % European call options
    U(1)=0;
    U(n)=exp(y(n)); % boundary condition for call
elseif optionchoice == 10 & putorcall==2 % European Cash or Nothing put option;
    U(1)=1*exp(-r*i*dt);
elseif optionchoice == 10 & putorcall==20 % European Cash or Nothing call options
    U(1)=0;
    U(n)=1*exp(-r*i*dt);
elseif optionchoice == 10 & putorcall==3 % European Asset or Nothing put option;
    U(1)=0;
elseif optionchoice == 10 & putorcall==30 % European Asset or Nothing call options
    U(n)=exp(y(n));
elseif optionchoice==20 & putorcall==1 % American put option;
    for j=1:n
        U(j)=max(X-exp(y(j)),U(j));
    end
elseif optionchoice==20 & putorcall==10 % American call option;
    for j=1:n
        U(j)=max(exp(y(j))-X,U(j)); % but it should in fact same as the European case since we don't consider dividend
    end
elseif optionchoice==20 & putorcall==2 % American Cash or Nothing put option;
    for j=1:n
        U(j)=max(X-exp(y(j))>0,U(j));
    end
elseif optionchoice==20 & putorcall==20 % American Cash or Nothing call option;
    for j=1:n
        U(j)=max(exp(y(j))-X>0,U(j));
    end
elseif optionchoice==20 & putorcall==3 % American Asset or Nothing put option;
    for j=1:n
        U(j)=max(exp(y(j))*(X-exp(y(j))>0),U(j));
    end
elseif optionchoice==20 & putorcall==30 % American Asset or Nothing call option;
    for j=1:n
        U(j)=max(exp(y(j))*(exp(y(j))-X>0),U(j));
    end
end
a=inv_L*U;
end