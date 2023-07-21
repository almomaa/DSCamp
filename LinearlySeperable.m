


X = [randn(50,2), randi([1,2],50,1)*5];



scatter3(X(:,1),X(:,2),X(:,3),30,X(:,3),"filled")
colormap winter
view(0,90)