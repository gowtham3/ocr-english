function I = clip(I)
    [width, height] = size(I);
    display(width);
        display(height);
    rs = height;
    cs = width;
    re = 1;
    ce = 1;
    for i = 1:width
        for j = 1:height
            if(I(i,j)==0)
                if(j<rs)
                    rs = j;
                    break;
                end
            end
        end
    end
    for i = 1:width
        for j = height:-1:1
            if(I(i,j)==0)
                if(j>re)
                    re = j;
                    break;
                end
            end
        end
    end
    for i = 1:height
        for j = 1:width
            if(I(j,i)==0)
                if(j<cs)
                    cs = j;
                    break;
                end
            end
        end
    end
    for i = 1:height
        for j = width:-1:1
            if(I(j,i)==0)
                if(j>ce)
                    ce = j;
                    break;
                end    
            end
        end
    end
    I = I(cs:ce,rs:re);
    I = imresize(I,[width height]);
end