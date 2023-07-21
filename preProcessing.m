clearvars; close all; clc;


v = VideoReader('M1_Normal_T1.mp4');


rect = [161.0000    7.0000  562.0000  498.0000];






X = [];
ptr = 1;

tao = 10;


while hasFrame(v)
    frame = readFrame(v);
    
    
    I = imcrop(frame,rect);

    I = rgb2gray(I);
    
    C = im2double(I);
    

    if ~mod(ptr,tao)
        X = [X, C(:)];
    end
    ptr = ptr + 1;
    
end


[u,s,v] = svd(X,0);

P = X*v;
for i=3:-1:1
    figure
    imagesc(reshape(P(:,i),size(I)))
    clim([min(P(:)), max(P(:))])
end






