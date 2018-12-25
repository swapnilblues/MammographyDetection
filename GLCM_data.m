clc
clear all
close all
srcFile=dir('D:\softwares2\MATL\bin\Codes\4thYear\breast_images_final\*.pgm');
for i=1:length(srcFile)
    if i==333
        break;
    end
    fn=strcat('D:\softwares2\MATL\bin\Codes\4thYear\breast_images_final\',srcFile(i).name);
    Im=imread(fn);
    Im=CropImage(Im);
    figure, imshow(Im);
    title('Cropped Image');

    stats = GLCM_Featuresl(Im);
    C = horzcat(stats.contr, stats.corrm, stats.energ, stats.entro, stats.homom);
    for j=1:20
        D(i,j)=C(1,j);
    end
end
csvwrite('GLCM.csv',D,0,0);