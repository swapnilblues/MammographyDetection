function [graycomatrix] = myGrayCoMatrix(InitImage)
    [m,n] = size(InitImage);
    
    graycomatrix = zeros(8,8,4);
    for i=1:m
        for j=1:n-1
            k = Quantize(InitImage(i,j));
            l = Quantize(InitImage(i,j+1));
            graycomatrix(k,l,1) = graycomatrix(k,l,1) + 1; 
        end
    end
    
    for i=2:m
        for j=1:n-1
            k = Quantize(InitImage(i,j));
            l = Quantize(InitImage(i-1,j+1));
            graycomatrix(k,l,2) = graycomatrix(k,l,2) + 1; 
        end
    end
    
    for i=2:m
        for j=1:n
            k = Quantize(InitImage(i,j));
            l = Quantize(InitImage(i-1,j));
            graycomatrix(k,l,3) = graycomatrix(k,l,3) + 1; 
        end
    end
    
    for i=2:m
        for j=2:n
            k = Quantize(InitImage(i,j));
            l = Quantize(InitImage(i-1,j-1));
            graycomatrix(k,l,4) = graycomatrix(k,l,4) + 1;
        end
    end
    
end