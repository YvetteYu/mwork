function [max min]=myLimit(X,Y,interval)

    if rem(nanmax(X),interval)==0
        % *10 is make sure it is integer/integer 
        max=nanmax(X);
    else
        max=(fix(nanmax(X)/interval)+1)*interval;
    end
    
    if rem(nanmin(Y),interval)==0
       min=nanmin(Y);
    else
        min=(fix(nanmin(Y)/interval))*interval;
    end 
end