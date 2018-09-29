function traintestsvm(w,x,b,k,cst,cvt,f,c,alphar,X,Y,d,n )
 %no ROC curve %w is the weight kernel is the kernel type, X is the feature set, b is the intercept. 

alphar
X
Y
%cst
%cvt
%f
%c

%if k ==0
%    [rw,cw] = size(w);
%b = w(rw,1);
%w = w(1:rw-1,1);
%end



%parameters we need: x,w,k which determines the kernel.


%Traintest Trains and tests the FDA results using the gaussian as well as
%plots ROC curves
% Other curves that can be drawn are specified using the c argument.
% c = 'ROC' draws an ROC curve
% c = 'n' draws the gaussian curves using the training set.
% c = 'g' draws the gaussian curves using the training set.
% c = 'gm' draws the difference of the curves using the training set.
% fs training set of setosa 
% fv testing set of versicolor
% fst   testing set of setosa 
% fvt   testing set of versicolor 
% cst  training set for setosa
% cvt training set for versicolor
%f = 'specifies the combination of features being used it's mainly for
%output reasons only' 
%12, specifies feature 1 and 2, 
%23 features 2 and 3,
%13 features 1 and 3,
%14 features 1 and 3,
%24 features 2 and 4,
%34 features 3 and 4,
%123 features 1,2 and 3,
%124 features 1,2 and 4, 
%134 features 1,3 and 4,
%234 feautres 2,3 and 4,
%1234 features 1,2,3 and 4.


%fsvt = vertcat(fst,fvt); %testing set containing features from both setosa and versicolor after projection.
testc = vertcat(cst,cvt); %list of classes for the training set.

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
Rte = 0;

Rte= size(testc);



%ming = floor(ming1g2);
%maxg = ceil(maxg1g2);

ming = 10000000000000000000000000000000;
maxg = 0;


%Testing the iris dataset
%Used to calculate overall accuracy

if n == 1
cl = 'Iris-virginica'
else
cl = 'Iris-setosa'
end

for i=1:Rte
 %if strcmp('Iris-setosa',char(testc(i)))
if strcmp(cl,char(testc(i)))
%k = 'hey'
testc2(i) = 1
else

testc2(i) = -1
end
end

%test = [fsvt testc2'];
%test = sortrows(test);

% if k == 0 %no kernel is being used.

testc2     
    
sum(Y.*alphar)
[rX,cX]=size(X)

for i=1:Rte

if k == 0 %no kernel is being used.
g = w' * x(i,:)' + b
end %endif

if k == 1 %no kernel is being used. = the quadratic function
K =(X *x(i,:)' +1).^d
 tosum = alphar.* Y .*K
total = sum(tosum);
g = total + b   %The sum of alpha * y * kernal function + b
end

if k == 3 %no kernel is being used. = the quadratic function
K =(X *x(i,:)').^d
 tosum = alphar.* Y .*K
total = sum(tosum);
g = total + b   %The sum of alpha * y * kernal function + b
end

if k ==2

for j=1:rX

 prenorm = X(j,:)-x(i,:);
     %prenorm = X-x(i,:);
     norm = prenorm.^2; % square all the elements in subtraction to get norm 
     sumnorm = sum(norm); 
     denom = d.^2  * 2;
      hey = exp(-sumnorm/denom); 
 above = alphar(j)* Y(j) * hey;
denom = denom + above
%'ley'
%end 
end

g = denom + b
end

g

if g < ming
    ming = g;
end
if g > maxg
    maxg = g;
end
if g > 0                         %if g1x decide setosa otherwise versicolor
        %class = 'Iris-setosa'
        class = cl
        testc(i)
        outputs(1,i) = 1;%1;
        outputs(2,i) = 0;
if strcmp(class,char(testc(i)))
            true = true+1;
            trues = trues + 1;
        else
            false = false +1;
            falses = falses +1;
        end
   else 
        class = 'Iris-versicolor'
        testc(i)
        outputs(1,i) = 0;%-1;
        outputs(2,i) = 1;
        if strcmp(class,char(testc(i)))
            true = true + 1;
            truev = truev + 1;
        else
            false = false +1 ;
            falsev = falsev + 1;
        end
end
end




 

accuracyte = true / (true + false);
accuracytes = trues / (trues + falsev);
accuracytev = truev / (truev + falses);


trues
truev
true
false
falses
falsev

if f == 1 %feature selected is 2
Str = 'For feature , the overall testing accuracy is: '; 
elseif f == 2 %feature selected is 2
    Str = 'For feature 2, the overall testing accuracy is: ';     
 elseif f == 3 %feature selected is 3
    Str = 'For feature 3, the overall testing accuracy is: ';  
elseif f == 4 %features selected is 4
Str = 'For feature 4, the overall testing accuracy is: '; 
elseif f == 12 %features selected are 1 and 2
Str = 'For features 1 and 2, the overall testing accuracy is: '; 
elseif f == 13 %features selected are 1 and 3
    Str = 'For features 1 and 3, the overall testing accuracy is: ';     
 elseif f == 23 %features selected are 2 and 3
    Str = 'For features 2 and 3, the overall testing accuracy is: ';  
elseif f == 14 %features selected are 1 and 4
    Str = 'For features 1 and 4, the overall testing accuracy is: ';  
elseif f == 24 %features selected are 2 and 4
    Str = 'For features 2 and 4, the overall testing accuracy is: ';  
    elseif f == 34 %features selected are 3 and 4
    Str = 'For features 3 and 4, the overall testing accuracy is: '; 
    elseif f == 123 %features selected are 1,2 and 3
    Str = 'For features 1,2 and 3, the overall testing accuracy is: ';  
    elseif f == 124 %features selected are 1,2 and 4
    Str = 'For features 1,2 and 4, the overall testing accuracy is: ';  
    elseif f == 134 %features selected are 1,3 and 4
    Str = 'For features 1,3 and 4, the overall testing accuracy is: ';  
     elseif f == 234 %features selected are 2,3 and 4
    Str = 'For features 2,3 and 4, the overall testing accuracy is: ';  
     elseif f == 1234 %features selected are 1,2,3 and 4
    Str = 'For features 1,2,3 and 4, the overall testing accuracy is: ';  
end



disp(Str); disp(accuracyte* 100);

Str = strcat('The corresponding testing accuracy for the class ',cl,' is: ');
disp(Str); disp(accuracytes* 100);

Str = 'The corresponding testing accuracy class versicolor is: '; 
disp(Str); disp(accuracytev* 100);



%This section draws the ROC curve by varying the threshold and finding
%true positive and false positive rates and plotting accordingly.
if strcmp(c,'ROC')

ming = floor(ming)  %Take minimum and maximum values of the boundary functions and create the increments with them
maxg = ceil(maxg)

inc = (maxg-ming)/30 %the increments to use.


thresh = ming

for j=1:30


true = 0;
false = 0;
trues =0;
falses=0;
truev = 0;
falsev= 0;



for i=1:Rte

if k == 0 %no kernel is being used.
g = w' * x(i,:)' + b;
end %endif

if k == 1 %no kernel is being used. = the quadratic function
K =(X *x(i,:)' +1).^d
 tosum = alphar.* Y .*K
total = sum(tosum);
g = total + b;   %The sum of alpha * y * kernal function + b
end

if k == 3 %no kernel is being used. = the quadratic function
K =(X *x(i,:)').^d
 tosum = alphar.* Y .*K
total = sum(tosum);
g = total + b;   %The sum of alpha * y * kernal function + b
end

if k ==2

for l=1:rX
X
l
 prenorm = X(l,:)-x(i,:);
     %prenorm = X-x(i,:);
     norm = prenorm.^2; % square all the elements in subtraction to get norm 
     sumnorm = sum(norm); 
     denom = d.^2  * 2;
      hey = exp(-sumnorm/denom); 
 above = alphar(l)* Y(l) * hey;
denom = denom + above;
%'ley'
%end 
end

g = denom + b
end

if g > thresh 
        class = cl;%'Iris-setosa';
        testc(i);
if strcmp(class,char(testc(i)))
            true = true+1;        
            trues = trues + 1;   %true positive
        else
            false = false +1;
            falses = falses +1; %false posotive
        end
   else 
        class = 'Iris-versicolor';
        testc(i);
    
        if strcmp(class,char(testc(i)))
            true = true + 1;     
            truev = truev + 1; %true negative
        else
            false = false +1 ; 
            falsev = falsev + 1; %false negative
        end
end
end

tpr(j) = trues / (trues + falsev);  %true positive /(true positive + false negative)
fpr(j) = falses/ (falses + truev);  %flase positive /(false positive + true negative)

thresh = thresh + inc;
end

%tpr
%fpr

plot (fpr,tpr);
title(strcat('ROC curve. The true positive rate is based on class ',cl));
xlabel('False positive rate'); % x-axis label
ylabel('True  positive rate'); % y-axis label
end

end

