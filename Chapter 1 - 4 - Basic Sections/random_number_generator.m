function y=random_number_generator(Smax,n)
loop=1;
minimum_distance=0.025;
y=[0 log(Smax)*sort(rand(1,n-1))];
while loop==1
    flag=0;
    loop=0;
    for i=2:n
        if y(i)-y(i-1)<minimum_distance
            % to ensure that the generated points are distinct, so that no singularity.
            loop=1;
            flag=[flag i];
        end
    end
    [x size_of_flag_plus_1]=size(flag);
    flag=flag(2:size_of_flag_plus_1);
    y(flag)=log(Smax)*rand(1,size_of_flag_plus_1-1);
    y=sort(y);
end
end