function [L2Para]=myNewRel(B1,B2,L1Para)

framenum=size(L1Para,1);
L2Para=zeros(1,framenum);

for iframe=1:framenum
    % This iframe is interval frame 
    BoundP=union(B1(iframe,:),B2(iframe,:));
    BoundP(1)=[];
    % first element is 0
    InnerP=setdiff(1:1:100,BoundP);
    clear BoundP
    L2Para(iframe)=mean(L1Para(iframe,InnerP));    
end

end
