function [ j,t ] = makejt( A,trans_est,r,res,old_t,old_j,I,old_I )
   t = make_t1(old_t,old_j,old_I,I,A);
   t = guided_filter(t, trans_est, r, res);
   j = get_radiance(I, t, A); 
end

