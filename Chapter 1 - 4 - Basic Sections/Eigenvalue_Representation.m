function alpha_by_eigen = Eigenvalue_Representation(P,L,inv_L,IC,T,index,y,c,small_ds,indexlength,kernelchoice)
tic
[W,lamda] = eig(P);
k_coefficient=(W\inv_L*IC).*exp(-diag(lamda)*T);
alpha_by_eigen=W*k_coefficient;
[u uplus] = TransformBack(index,y,c,real(alpha_by_eigen),small_ds,indexlength,kernelchoice);
delta=(uplus-u)/small_ds;
fprintf('\n') %line break in the command view
display('Above is the result of the Original Result')
[['Stock  '; 'Option '; 'Delta  '] num2str([index; u;delta])]
toc
fprintf('\n') %line break in the command view
display('Above is the result obtained by the Eigen Value Representation Method')