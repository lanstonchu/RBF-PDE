function [u uplus] = TransformBack(index,y,c,a,small_ds,indexlength,kernelchoice)
for i = 1:indexlength
    if kernelchoice==10
        u(i)=sqrt((log(index(i))-y).^2 + c^2)*a;
        uplus(i)=sqrt((log(index(i)+small_ds)-y).^2 + c^2)*a;
    elseif kernelchoice==20
        u(i)=exp(-c^2*(log(index(i))-y).^2)*a;
        uplus(i)=exp(-c^2*(log(index(i)+small_ds)-y).^2)*a;
    elseif kernelchoice==30
        u(i)=((log(index(i))-y).^(2*c).*log(abs(log(index(i))-y)))*a;
        uplus(i)=((log(index(i)+small_ds)-y).^(2*c).*log(abs(log(index(i)+small_ds)-y)))*a;
    end
end