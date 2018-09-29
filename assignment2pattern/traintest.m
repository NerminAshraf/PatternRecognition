function [x] = traintest(fs,fv,fst,fvt,cst,cvt,c,f )
%Traintest Trains and tests the FDA results using the gaussian as well as
%plots ROC curves
% Other curves that can be drawn are specified using the c argument.
% c = 'ROC' draws an ROC curve
% c = 'n' draws the gaussian curves using the training set.
% c = 'g' draws the gaussian curves using the training set.
% c = 'gm' draws the difference of the curves using the training set.
% fs training set of setosa after projection into one dimension using FDA
% fv testing set of versicolor after projection into one dimension using FDA
% fst   testing set of setosa after projection
% fvt   testing set of versicolor after projection
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


fs = fs * 10;  % For ease of representation
fv = fv * 10;

Exs = Ex(fs); %expected value of combined features e.g features 1 and 2 of setosa dataset
Exv = Ex(fv); %expected value of combined features e.g. features 1 and 2 of versicolor dataset

fsm = fs - Exs; %Value of each array minus the mean to calculate the variance
fvm = fv - Exv;

fsm2 = fsm.^2;  %Squaring the values after subtracting the mean.
fvm2 = fvm.^2;

sigs= Ex(fsm2); %Finding the variance by finding expected value of (x-m).^2
sigv = Ex(fvm2);



sns =size(fs);
snv =size(fv);
%The sizes are the same.


fs = sort(fs);
fv = sort(fv);

fs = round2(fs,0.1);
fv = round2(fv,0.1);

minfs = min(fs);
minfv = min(fv);

maxfs = max(fs);
maxfv = max(fv);

if minfs < minfv
mini = minfs;
minval = 's';
else 
mini = minfv;
minval = 'v';
end

if maxfs > maxfv
maxi = maxfs;
maxval= 's';
else 
maxi = maxfv;
maxval = 'v';
end

dif = (maxi - mini) * 10;

x =0;
x(1) = mini;

for i= 2:dif+1
x(i) = x(i-1) +0.1;
end

% Calculate the gaussian fucntion and boundary functions using the training
% set

for i= 1:dif+1

%xmu12 = [fs12(i)-Ex12s];  %short for x - Ex value the s represents setosa, xmu12 is for setosa.
%xmu12t = xmu12'; % transpose
xmu = [x(i)-Exs];

%xmuv12 = [fv12(i)-Ex12v]; %short for x - Ex value the v represents versicolor, xmu12 is for versicolor.
xmuv = [x(i)-Exv];

%xmuv12t = xmuv12'; % transpose

%Gaussian fucntions
Nx =   (1/(sqrt(2 *3.1416 * sigs))) * exp((-1/(2 *sigs)) *(xmu.^2));
Nxm(i) = Nx; 
Nxv =  (1/(sqrt(2 *3.1416 * sigv))) * exp((-1/(2 *sigv)) *(xmuv.^2));
Nxvm(i) = Nxv; 

%The priors are equal so are not included in the equation
%Boundary functions
g1x = ((-1/(2 *sigs)) *xmu.^2) - 0.5 * log(2 *3.1416) - 0.5 *log(sigs);
g2x = ((-1/(2 *sigv)) *xmuv.^2)- 0.5 * log(2 *3.1416) - 0.5 * log(sigv);
g1xm(i) = g1x;
g2xm(i) = g2x;
end

size(x);
size(Nxm);


g1g2xm = g1xm-g2xm;
ming1g2 = min(g1g2xm);
maxg1g2 = max(g1g2xm);
if strcmp(c,'n')

plot(x,Nxm,x,Nxvm);
title('Liklihood curve of classes setosa, and versicolor');
xlabel('Projected values'); % x-axis label
ylabel('Liklihood'); % y-axis label
legend('setosa','versicolor');

end

if strcmp(c,'g')
plot(x,g1xm,x,g2xm);
title('G-values curve of classes setosa, and versicolor');
xlabel('Projected values'); % x-axis label
ylabel('G-values'); % y-axis label
legend('setosa','versicolor');
end

if strcmp(c,'gm')
plot(x,g1xm-g2xm);
title('Subtraction G-values curve of classes setosa, and versicolor');
xlabel('Projected values'); % x-axis label
ylabel('Subtractionof G values'); % y-axis label
end



fsvt = vertcat(fst,fvt); %testing set containing features from both setosa and versicolor after projection.
testc = vertcat(cst,cvt); %list of classes for the training set.



fsvt = fsvt *10;
fsvt = round2(fsvt,0.1);

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
Rte = 0;

Rte= size(fsvt);
Rte2= size(testc);

%testc2 = zeros(2,Rte)


%Testing the iris dataset
%Used to calculate overall accuracy

for i=1:Rte
 if strcmp('Iris-setosa',char(testc(i)))

k = 'hey'
testc2(i) = 1
else

testc2(i) = -1
end
end

test = [fsvt testc2'];
test = sortrows(test);

 
for i=1:Rte
fsvt(i);

xmut = [fsvt(i)-Exs];
xmuvt = [fsvt(i)-Exv];
g1x = ((-1/(2 *sigs)) *xmut.^2) - 0.5 * log(2 *3.1416) - 0.5 *log(sigs);
g2x = ((-1/(2 *sigv)) *xmuvt.^2)- 0.5 * log(2 *3.1416) - 0.5 * log(sigv);
if g1x > g2x                         %if g1x decide setosa otherwise versicolor
        class = 'Iris-setosa'
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

if f == 12 %features selected are 1 and 2
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

Str = 'The corresponding testing accuracy for class setosa is: ' ;
disp(Str); disp(accuracytes* 100);

Str = 'The corresponding testing accuracy class versicolor is: '; 
disp(Str); disp(accuracytev* 100);



%This section draws the ROC curve by varying the threshold and finding
%true positive and false positive rates and plotting accordingly.
if strcmp(c,'ROC')

ming1g2 = floor(ming1g2);
maxg1g2 = ceil(maxg1g2);

inc = (maxg1g2-ming1g2)/30; %the increments to use.


thresh = ming1g2; 

for j=1:30


true = 0;
false = 0;
trues =0;
falses=0;
truev = 0;
falsev= 0;



for i=1:Rte
%fsvt(i);

xmut = [fsvt(i)-Exs];
xmuvt = [fsvt(i)-Exv];
g1x = ((-1/(2 *sigs)) *xmut.^2) - 0.5 * log(2 *3.1416) - 0.5 *log(sigs);
g2x = ((-1/(2 *sigv)) *xmuvt.^2)- 0.5 * log(2 *3.1416) - 0.5 * log(sigv);
if g1x - g2x > thresh 
        class = 'Iris-setosa';
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
title('ROC curve. The true positive rate is based on class setosa');
xlabel('False positive rate'); % x-axis label
ylabel('True  positive rate'); % y-axis label
end

end

