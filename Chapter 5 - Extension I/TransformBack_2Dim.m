function u = TransformBack_2Dim(index,y1,y2,c,a,indexlength)
matrix1=meshgrid(index,index);
matrix2=meshgrid(index,index)';
for i = 1:indexlength
    for j=1:indexlength
        u(i,j)=sqrt((log(matrix1(i,j))-y1).^2+(log(matrix2(i,j))-y2).^2 + c^2)'*a;
    end
end
end