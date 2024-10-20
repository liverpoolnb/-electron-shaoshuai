clc,clear
v = VideoReader('video_20241012_153205_edit.mp4');

%%灰度图视频播放
for i = 1:v.NumFrames
    frame = read(v,i);
    f = rgb2gray(frame);
    f(f>60) = 255;
    f(f<=60)= 0;
    imshow(f)
end

for i = 1:v.NumFrames
    frame = read(v,i);
    lujing = strcat("E:\math\DATE\matlabdate\shaoshuai\0",num2str(i));
    lujing = strcat(lujing,'.jpg');
    imwrite(frame,lujing)
end
for i = 1:791
    lujing2 = "E:\math\DATE\matlabdate\shaoshuai\0";
    lujing2 = strcat(lujing2,num2str(i));
    p = strcat(lujing2,'.jpg');
    f = imread(p);
    f1 = rgb2gray(f);
    %imshow(f1)
    BW = edge(f1,'canny',0.16);
    %imshow(BW)
    [m,n] = find(BW==1);
    ss = scatter(n,-m,'.');
    lujing3 = strcat("E:\math\DATE\matlabdate\shaoshuai2\0",num2str(i));
    p1 = strcat(lujing3,'.jpg');
    saveas(ss,p1);
end

%%合成
imageFolder = "E:\math\DATE\matlabdate\shaoshuai2"; 
vid = VideoWriter('shaoshuai2.avi'); 
vid.FrameRate = 25; 
open(vid);
imageFiles = dir(fullfile(imageFolder, '*.jpg'));
fileNames = {imageFiles.name}; 
numericOrder = cellfun(@(x) str2double(regexprep(x, '^\D+|\D+$', '')), fileNames);
[~, sortedIndices] = sort(numericOrder); % 按数字排序
imageFiles = imageFiles(sortedIndices); % 按顺序重新排列
for i = 1:791
    img = imread(fullfile(imageFolder, imageFiles(i).name));
    writeVideo(vid, img);
end
close(vid);

%%播放
vid = VideoReader('shaoshuai2.avi');
for i = 1:vid.NumFrames
    f = read(vid,i);
    imshow(f)
end





%%
BW1 = edge(f1,'roberts',0.16);
BW2= edge(f1,'Sobel',0.16);
BW3= edge(f1,'Prewitt',0.16);
BW4 = edge(f1,'Log',0.16);
BW5 = edge(f1,'Canny',0.16);
imshow(BW1)
imshow(BW2)
imshow(BW3)
imshow(BW4)
imshow(BW5)

v = VideoReader('shaoshuai1.avi');
for i = 1:v.NumFrames
    frame = read(v,i);
    lujing = strcat("E:\math\DATE\matlabdate\test\0",num2str(i));
    lujing = strcat(lujing,'.jpg');
    imwrite(frame,lujing)
end


for i = 1:100
    disp(imageFiles(i).name)
end

%%
