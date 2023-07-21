clearvars; close all; clc;


v = VideoReader('PIA02863.mp4');


X = [];


while hasFrame(v)
    frame = readFrame(v);

    I = rgb2gray(frame);
    
    C = im2double(I);
    
    X = [X, C(:)];
    
end


[u,s,v] = svd(X,'econ');

P = X*v;

for i=5:-1:1
    figure
    imagesc(reshape(P(:,i),size(I)))
    clim([min(P(:)), max(P(:))])
end





