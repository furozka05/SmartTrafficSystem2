clc; clear;
kare=-1;
araba=imread('C:\Users\furoz\OneDrive\Masaüstü\project 2\araba3.jpeg');
araba=imcrop(araba,[300 175 520 1000]);
darkCarValue=55;
darkCar= rgb2gray(araba);
noDarkCar= imextendedmax(darkCar, darkCarValue);
imshow(darkCar);
figure, imshow(noDarkCar)
sedisk= strel('square',7);
noSmallStructures = imopen(noDarkCar, sedisk);
noSmallStructures = bwareaopen(noSmallStructures, 1000);
figure, imshow(noSmallStructures)
bw = bwlabel(noSmallStructures, 8);
cc=bwconncomp(bw, 8);
stats = [regionprops(bw); regionprops(not(bw))];
figure, imshow(bw)
imshow(araba);
hold on
for i = 1:numel(stats)
    araba=rectangle('Position', stats(i).BoundingBox,'Linewidth', 3, 'EdgeColor', 'r', 'LineStyle', '-');
    kare=kare+1;
end
hold off
araba= insertText(araba, [10 10], kare, 'BoxOpacity', 1, 'FontSize', 36);
figure
imshow(araba);
%figure, imshow(noSmallStructures)