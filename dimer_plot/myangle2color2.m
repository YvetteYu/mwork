function [Rcolor Gcolor Bcolor]=myangle2color2(Oangle)

if Oangle<0
    Rcolor=(1-Oangle)*2/pi;
    Gcolor=1;
    Bcolor=Oangle*2/pi;
else
    Rcolor=Oangle*2/pi;
    Gcolor=1;
    Bcolor=(1-Oangle)*2/pi;

end
end
