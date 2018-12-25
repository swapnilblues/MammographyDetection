function result = knn_dynamic(Array, train_ratio, test_ratio )
    [m,n] = size(Array);
    
    %%calculating size of test and train array based on value of ratios
    test_length = round(m*test_ratio/(test_ratio+train_ratio));
    train_length = m - test_length; 
    
    train_x = zeros(train_length, n-2);
    test_x = zeros(test_length, n-2);
    train_y = zeros(train_length, 1);
    test_y = zeros(test_length, 1);
    
    %generating an array of random unique numbers based on the length of
    %test ratio
    rand_Num = sort(randperm(m, test_length));
    
    %inserting data in test and train data
    train_count=0;
    test_count=0;
    for i=1:m
        if ~ismember(i, rand_Num)
            train_count=train_count+1;
            k=0;
            for j=1:n-2
                k=k+1;
                train_x(train_count,k)=Array(i,j);
            end
            train_y(train_count)=Array(i,n-1);
        else
            test_count=test_count+1;
            for j=1:n-2
                test_x(test_count,j)=Array(i,j);
            end
            test_y(test_count)=Array(i,n-1);
        end
    end
    
    %calculating distance of each test data from train data    
    for i1=1:test_length
        dist = zeros(train_length,1);
        index = zeros(5,1);
        for i2=1:train_length
            dist1 = 0;
            for i3=1:n-2
                dist1 = dist1 + ((train_x(i2,i3)-test_x(i1,i3))^2);
            end
            dist(i2) = sqrt(dist1);
        end

        for k = 1:5
            min = 100;
            for j = 1:train_length
                if dist(j)<min
                    index(k) = j;
                    min = dist(j);
                end
            end
            dist(index(k))=100;
        end

        for i = 1: 5
            A(i) = Array(index(i), n-1);
        end
        for i =1:5
            B=0;M=0;N=0;
            if A(i) == 1
                B=B+1;
            elseif A(i)==2
                M = M+1;
            else
                N = N+1;
            end
        end

        if B>=N && B>=M
            Predict(i1) = 1;
        elseif M>=N && M>=B
            Predict(i1) = 2;
        else
            Predict(i1) = 3;
        end
    end

    result=0;
    for i=1:test_length
        if Predict(i) == test_y(i)
            result=result+1;
        end
    end
    result = double(result/test_length);
end
            
    
    
    
    