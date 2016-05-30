function [Tangle]=myarc2degree(Oangle)
%{
choice=input(['which situation do you want to transfer?\n'...
    '1) arc cos II >> IV (I>>I III>I)\n'...
    '2) arc sin IV >> II (I>>I III>III)\n'])
%}
%switch choice
%    case 1
    Tangle=zeros(size(Oangle));
    for iangle=1:length(Oangle)
        if (Oangle(iangle) >= 0) && (Oangle(iangle) <= pi/2)
            Tangle(iangle)=Oangle(iangle)*180/pi;
        elseif Oangle(iangle)<0 && Oangle(iangle)>=-pi/2
            Tangle(iangle)=(Oangle(iangle)+pi)*180/pi;
        end
    end
 %   case 2 
        %if Oangle>=0 && Oangle<=pi/2
        %    Tangle=Oangle*180/pi;
        %elseif 
        %    Oangle=Oangle+pi;
        %    Tangle=Oangle*180/pi;
        %end
%end

%{
choice=input(['which situation do you want to transfer?\n'...
    '1) [-pi/2 pi/2] >> [0  180]\n'...
    '2) [-pi/2 pi/2] >> [-90 90]\n'...
    '3) [0     pi  ] >> [0 180]\n'...
    '4) [0     pi  ] >> [-90 90]\n']);
switch choice
    case 1
        Dangle=acos(sin(Oangle));
        Tangle=Dangle*180/pi;
    case 2
        Tangle=Oangle*180/pi;
    case 3
        Tangle=Oangle*180/pi;
    case 4
        Dangle=asin(cos(Oangle));
        Tangle=Dangle*180/pi;
end
%}
end