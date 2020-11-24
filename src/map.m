x = [];
y = [];

for a = 1:26
    str1 = char(96+a);
    for b = 1:25
        I = imread(strcat(char(96+a),int2str(b),'.bmp'));
        I = (I(:,:,1)+I(:,:,2)+I(:,:,3))/255;
        I = clip(I);
        I = bwmorph(I,'remove');
        x = extract_features(I,x);
        z = zeros(1,26);
        z(1,a) = 1;
        y = [y;z];
    end
end

%classification
inputs = x';
targets = y';

% Create a Pattern Recognition Network
hiddenLayerSize = 10;
net = patternnet(100);


% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 1;


% Train the Network
[net,tr] = train(net,inputs,targets);

% Test the Network
outputs = net(inputs);
save net;
count = 0;
for i = 1:650
    k = ceil(i/25);
    if(find(outputs(:,i) == max(outputs(:,i))) == k)
        count = count +1;
        %display(find(outputs(:,i*j) == max(outputs(:,i*j))));
    end
end

display(count);
eff = count/650
