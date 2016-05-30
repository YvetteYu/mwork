function [other1 other2]=mycolor(target)

    switch target
        case 1
            other1=2;
            other2=3;
        case 2
            other1=1;
            other2=3;
        case 3
            other1=1;
            other2=2;
    end
end