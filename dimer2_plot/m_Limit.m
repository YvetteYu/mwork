function [max min]=m_Limit(X,interval)

    if rem(nanmax(X),interval)==0
        % *10 is make sure it is integer/integer 
        max=nanmax(X);
    else
        max=(fix(nanmax(X)/interval)+1)*interval;
    end
    
    if rem(nanmin(X),interval)==0
       min=nanmin(X);
    else
        min=(fix(nanmin(X)/interval))*interval;
    end 
end