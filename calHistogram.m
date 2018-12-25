function [A,B] = calHistogram(initImage)
    handles.initImage = initImage;

    s = size(initImage);
    s1 = s(1);
    s2 = s(2);
    for i = 0 : 255
        x=0;                % intensity range Loop
        for j = 1 : s(1)    % row counter
            for k = 1 : s(2)    % column counter

                if(initImage(j,k) == i)
                    x = x + 1;
                end

            end

        end
        index1(i+1,1) = x;
         %count intensity loop

    end

    [A, B] = size(index1);
    for i = 1 : A
        A(i) = i;
        B(i) = index1(i);
    end
end
    %%%%%%Histogram Ends