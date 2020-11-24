function x = extract_features(I,x)
        [width,height] = size(I);
        n = 3;
        zwidth = int32(width/n);
        zheight = int32(height/n);
        feature = [];
        for i = 1:n
            for j = 1:height
                sum = 0;
                for k = (i-1)*zwidth+1:i*zwidth
                    if(sum == 1)
                        break
                    end
                    if(k<=50)
                        if(I(j,k)== 0)
                            sum = sum + 1;
                        end
                    end
                end
                feature = [feature sum];
            end
        end

        for i = 1:n
            for j = 1:width
                sum = 0;
                for k = (i-1)*zheight+1:i*zheight
                    if(sum == 1)
                        break
                    end
                    if(k<=50)
                        if(I(k,j)== 0)
                            sum = sum + 1;
                        end
                    end
                end
                feature = [feature sum];
            end
        end
        x = [x;feature];
end