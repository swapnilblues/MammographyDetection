
function CroppedI2 = ProcessImage(InitImage)
%     figure
%     imshow(InitImage)
%     title('Original Image')

    CroppedI = CropImage(InitImage);
    figure
%     imshow(CroppedI)
%     title('Image Cropped')

    MedI = MedianFilter(CroppedI);
%     figure
%     imshow(MedI)
%     title('Median Filter applied')

    OtsuI = ThreshOtsu(MedI);
%     figure
%     imshow(OtsuI)
%     title('Otsu applied')

    %%showing only the thresholded part of image
    [m,n]=size(OtsuI);
    for i=1:m
        for j=1:n
            if(OtsuI(i,j)==0)
                MedI(i,j)=0;
            end
        end
    end
    figure
    imshow(MedI)
    title('Filtered Image')

    CroppedI2 = CropImage(MedI);
    figure
    imshow(CroppedI2)
    title('Image Cropped 2')
end
