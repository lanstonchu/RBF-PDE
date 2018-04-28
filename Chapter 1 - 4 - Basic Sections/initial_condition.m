function IC=initial_condition(X,y,initialcondchoice)
if initialcondchoice == 1 % American (or European) put
    IC = max(X-exp(y'), 0);
elseif initialcondchoice == 10 % American (or European) call
    IC = max(exp(y')-X, 0);
    % Cash-or-Nothing
elseif initialcondchoice == 2 % cash-or-nothing put
    IC = 1*(X-exp(y')>0);
elseif initialcondchoice == 20 % cash-or-nothing call
    IC = 1*(exp(y')-X>0);
    % Asset-or-Nothing
elseif initialcondchoice == 3 % asset-or-nothing put
    IC=exp(y').*(X-exp(y')>0);
elseif initialcondchoice == 30 % asset-or-nothing call
    IC=exp(y').*(exp(y')-X>0);
end