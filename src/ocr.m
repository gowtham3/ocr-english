load net;
for k = 1:30
    x1 = input('Enter image name:','s');
    I = imread(strcat(x1,'.bmp'));
    I = imresize(I,[50 50]);
    imshow(I);
    x = [];
    I = (I(:,:,1)+I(:,:,2)+I(:,:,3))/255;
    I = clip(I);
    I = bwmorph(I,'remove');
    feat = extract_features(I,x);
    output = sim(net,feat');
    for i = 1:26
        if(find(output == max(output)) == i)
            display(char(64+i))
        end
    end
end
