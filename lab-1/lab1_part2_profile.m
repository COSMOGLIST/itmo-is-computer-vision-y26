text=imread('text.jpg');
subplot(2, 1, 1);
[numRows, numCols, Layers]=size(text);
x=[1 numCols];
y=[ceil(numRows/2) ceil(numRows/2)];
improfile(text,x,y),grid on;
title('text');

code=imread('code.jpg');
subplot(2, 1, 2);
[numRows_c, numCols_c, Layers_c]=size(text);
x_c=[1 numCols_c];
y_c=[ceil(numRows_c/2) ceil(numRows_c/2)];
improfile(code,x_c,y_c),grid on;
title('code');