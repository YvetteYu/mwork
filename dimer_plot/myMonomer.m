function myMonomer(centerx,centery,radius)
rx=centerx+cos(0:0.01:2*pi)*radius;
ry=centery+sin(0:0.01:2*pi)*radius;
hold on
plot(rx,ry)
end