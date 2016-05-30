
function [OPX,OPY,scale]=myOPexist(FilePath,File,imgname)

load(File);
re=exist('OPX');
if re==0
image=imread([FilePath imgname]);
imshow(image)
[OPX OPY]=ginput(1);
save(File,'-append','OPX','OPY');
end
close all
end
