function CroppedImage = CropImage(I)
    bI = imbinarize(I);
    [n,m] = size(bI);
    minx=1000;
    maxx=1;
    miny=1000;
    maxy=1;
    for i=1:n
        for j=1:m
            if (bI(i,j)~= 0)
                if(j<minx)
                    minx=j;
                else
                    if(j>maxx)
                        maxx=j;
                    end
                end
                if(i<miny)
                    miny=i;
                else
                    if(i>maxy)
                        maxy=i;
                    end
                end
            end
        end
    end
    rect = [minx miny (maxx-minx) (maxy-miny)];
    CroppedImage = imcrop(I, rect);
end
    