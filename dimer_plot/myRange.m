function [output]=myRange(input,interval)
fore=input-interval;
aft=input+interval;
output=zeros(1,length(fore)*(interval*2+1));
for i=1:length(input)
    temp=fore(i):aft(i);
    ifore=(i-1)*length(temp)+1;
    output(ifore:ifore+length(temp)-1)=temp;
end
end