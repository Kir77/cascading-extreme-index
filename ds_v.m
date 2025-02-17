function v=ds_v(y)
% y dimension: lon,lat,time
x=reshape(y,size(y,1)*size(y,2),size(y,3))';
quanti=0.98;
for j=1:size(x,1)
    distance=pdist2(x(j,:),x);
    logdista=-log(distance);
    thresh=quantile(logdista,quanti);
    [S,I]=sort(logdista);
    findidx=find(S>thresh);
    v{j}=I(findidx);
    %logextr=logdista(findidx:end-1);
    %lambda=mean(logextr-thresh);
    %d1(j)=1./lambda;
end