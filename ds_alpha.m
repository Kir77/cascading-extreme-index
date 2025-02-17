% variables t rh
vt=ds_v(t);
vrh=ds_v(rh);
len=size(t,3);
for i=1:len
    total=length(vt{i});
    alpha1(i)=length(intersect(vr{i},vt{i}))./total;
end

lag=5;clear inters
for i=lag+1:len-lag
    total=length(vt{i});
    for d=-lag:lag
    inters(d+lag+1)=length(intersect(vt{i},vr{i+d}));
    end
    alpha2(i)=sum(inters)/total./(2*lag+1);
end



