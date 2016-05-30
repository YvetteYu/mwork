function [Rcolor Gcolor Bcolor]=myangle2color(Tangle)
%Rcolor=1-Tangle/180;
%Bcolor=Tangle/180;
%Gcolor=0.6;

if Tangle<60 && Tangle>=0
    Gcolor=0;
    if Tangle<=30
        Rcolor=1;
        Bcolor=1-(30-Tangle)/30;
    else
        
        Rcolor=1-(Tangle-30)/30;
        Bcolor=1;
    end
    
elseif Tangle>=60 && Tangle<=120
    Rcolor=0;
    if Tangle<=90
        Bcolor=1;
        Gcolor=1-(90-Tangle)/30;
    else
        Bcolor=1-(Tangle-90)/30;
        Gcolor=1;
    end
    
elseif Tangle>120 && Tangle<=180
    Bcolor=0;
    if Tangle<=150
        Rcolor=1-(150-Tangle)/30;
        Gcolor=1;
    else
        Rcolor=1;
        Gcolor=1-(Tangle-150)/30;
    end
end

end