function [ result ] = make_t1( t,J,I0,I1,A )
D1=I1-I0;

R = J(:,:,1)-A(1);
G = J(:,:,2)-A(2);
B = J(:,:,3)-A(3);
D2 = cat(3,R,G,B);
% eps = 5;
%eps = 10^(-1);
idx_p = D2>=0 & D2<eps;
idx_n = D2<0 & D2>-eps;
D2(idx_p) = eps;
D2(idx_n) = -eps;

D=D1./D2;

%result=cat(3, t, t, t)+D;

result = t + rgb2gray(D);

msk1=result>1;
msk0=result<0;
result(msk1)=1;
result(msk0)=0;

end

