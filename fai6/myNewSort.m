function [NewX]=myNewSort(X,index)

NewX=zeros(size(X));
if size(X)==size(index)

    for iframe=1:size(index,1)
        tempx=X(iframe,:);
        tempindex=index(iframe,:);
        NewX(iframe,:)=tempx(tempindex);
        
    end
    
else
    printf('The size of X and index were not same.');
end

end