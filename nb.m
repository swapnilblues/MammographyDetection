function accuracy = nb_dynamic(Array, train_ratio, test_ratio )
% Array=csvread('GLCM.csv');

correct=1;
wrong=1;
% 
% train_ratio=70;
% test_ratio=30;
[m,n] = size(Array);
features=n-2;
test_length = round(m*test_ratio/(test_ratio+train_ratio));
train_length = m - test_length; 
    
train_x = zeros(train_length, n-2);
test_x = zeros(test_length, n-2);
train_y = zeros(train_length, 1);
test_y = zeros(test_length, 1);
%generating an array of random unique numbers based on the length of
    %test ratio
    rand_Num = sort(randperm(m, train_length));
    
    %inserting data in test and train data
    train_count=0;
    test_count=0;
    for i=1:m
        if ismember(i, rand_Num)
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
    
       
     sumb=zeros(1,n-2); sumn=zeros(1,n-2); summ=zeros(1,n-2);
     meanb=zeros(1,n-2); meann=zeros(1,n-2); meanm=zeros(1,n-2);
     varb=zeros(1,n-2); varn=zeros(1,n-2); varm=zeros(1,n-2);
     
     
     
    
    train_n_len=0;
    train_m_len=0;
    train_b_len=0;
    for i=1:train_length
       if train_y(i)==1
        train_b_len=train_b_len+1;
       elseif train_y(i)==2
           train_m_len=train_m_len+1;
       elseif train_y(i)==3
           train_n_len=train_n_len+1;
               
       end
   end
   
   for j=1:n-2
        s1=0;
        s2=0;
        s3=0;
        for i=1:train_length
          if train_y(i)==1
             s1=s1+train_x(i,j);        
          elseif train_y(i)==2
             s2=s2+train_x(i,j);
          elseif train_y(i)==3
             s3=s3+train_x(i,j);     
          end
        end
          sumb(j)=s1;
          meanb(j)=sumb(j)/train_b_len;
          varb(j)=((sumb(j)-meanb(j))^2)/train_b_len;
          
          summ(j)=s2;
          meanm(j)=summ(j)/train_m_len;
          varm(j)=((summ(j)-meanm(j))^2)/train_m_len;
          
          sumn(j)=s3;
          meann(j)=sumn(j)/train_n_len;
          varn(j)=((sumn(j)-meann(j))^2)/train_n_len;
        
   end
   
  
    ans1=0;
    pm= train_m_len/(train_m_len+train_n_len+train_b_len);
    pb= train_b_len/(train_m_len+train_n_len+train_b_len);
    pn= train_n_len/(train_m_len+train_n_len+train_b_len);
    
    pindm=zeros(1,n-2);
    pindn=zeros(1,n-2);
    pindb=zeros(1,n-2);
    for k=1:test_count
        totalm=1;
        totaln=1;
        totalb=1;
        for j=1:n-2
            pindb(j)=1/(varb(j)*sqrt(2*3.142)) * exp(-((test_x(k,j)-meanb(j))^2)/(2*(varb(j)^2)));
            pindm(j)=1/(varm(j)*sqrt(2*3.142)) * exp(-((test_x(k,j)-meanm(j))^2)/(2*(varm(j)^2))); 
            pindn(j)=1/(varn(j)*sqrt(2*3.142)) * exp(-((test_x(k,j)-meann(j))^2)/(2*(varn(j)^2))); 
            totalb=totalb*pindb(j);
            totalm=totalm*pindm(j);
            totaln=totaln*pindn(j);            
        end
        pfinalb= (totalb*pb )/(totalb*pb + totalm*pm + totaln*pn);
        pfinalm= (totalm*pm )/(totalb*pb + totalm*pm + totaln*pn);
        pfinaln= (totaln*pn )/(totalb*pb + totalm*pm + totaln*pn);
        
        if pfinalb > pfinalm && pfinalb > pfinaln
            ans1=1;
        elseif pfinalm > pfinalb && pfinalm > pfinaln
            ans1=2;
        else
            ans1=3;
        end
        class1=test_y(k);
        if ans1==class1
            correct=correct+1;
        else
            wrong=wrong+1;
        end
        
    end
   
 accuracy=correct/(correct+wrong);
%  accuracy       
        
   
end
    

       