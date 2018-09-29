function alphar2 = svm_p(s,v,f,a,k,curve,d,n)

%Performs linear discriminant analysis on the iris dataset

%d specifies the degree of the polynomial kernel or sigma of radial basis
%kernel

%n must be set to 0, when classifying setosa vs. versicolor dataset
% and one when diffrentiating between virginica and versicolor or else
% there will be errors.

%if a == 'w' this calculates the w without alphas
%if a == 'a' this calculates the alphas first %used for applying kernels
%To calculate the

%if k = 0;
%do not apply any kernel
%if k = 1;
%apply polynomial kernel of degree two
%if k = 2;
%apply sigma kernel of sigam = 1

%To calculate linear classifier please choose the classifcation a = 'w'
% and k = 0 or else you will get classifiation errors

%To use a kernel set a = 'a' which stands for alpha, and choose your preferred kernel.
% using the k  value.

 

% s- setosa dataset
% v- versicolor dataset

%curves that can be drawn are specified using the c argument.
% c = 'ROC' draws an ROC curve
% c = x draws no curve
%for the linear classifier using 1 and 2 features a curve of the boundary
%is drawn automatically if x is selected

%f = 'specifies the combination of features being used it's mainly for
%output reasons only' 
%1, 2, 3, and 4 individually specify each feature alone
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

fnum = 0 % number of features
if f == 12 || f == 23 || f == 13 || f == 14 || f == 24 || f == 34 
 fnum = 2;
end

if f == 1 || f == 2 || f == 3 || f == 4
fnum = 1;
end

if f == 123 || f == 124 || f == 134 || f == 234
fnum = 3;
end

if f == 1234
fnum = 4;
end

Ms =csvimport(s);
[Rs,Cs] = size(Ms);
fs = Ms(1:34,1);   %select training set of feature 1
fst = Ms(35:Rs,1); %select testing set of feature 2
fs2 = Ms(1:34,2);   %select training set of feature 2
fst2 = Ms(35:Rs,2); %select testing set of feature 2
fs3 = Ms(1:34,3);   %select training set of feature 3
fst3 = Ms(35:Rs,3); %select testing set of feature 3
fs4 = Ms(1:34,4);   %select training set of feature 4
fst4 = Ms(35:Rs,4); %select testing set of feature 4
cs = Ms(1:34,5);    %select training set of classes
cst = Ms(35:Rs,5);  %select testing set of classes


%Repeat the same process for versicolor dataset
Mv =csvimport(v);
[Rv,Cv] = size(Mv);
fv = Mv(1:34,1); %training set of feature 1
fvt = Mv(35:Rv,1); %select testing set versicolor of feature 1
fv2 = Mv(1:34,2); %training set of feature 2
fvt2 = Mv(35:Rv,2); %select testing set versicolor
fv3 = Mv(1:34,3); %training set
fvt3 = Mv(35:Rv,3); %select testing set versicolor
fv4 = Mv(1:34,4); %training set
fvt4 = Mv(35:Rv,4); %select testing set versicolor
cv = Mv(1:34,5); %select training set of classes
cvt = Mv(35:Rv,5); %select testing set of classes





%Convert sets into appropriate matrix format for both the training and the
%dataset since when the numbers are imported from the txt file they appear
%as strings and cells.


single = 0.0;
fss = str2double(cell2mat (fs(1)));
for j = 2:34
  single = cell2mat (fs(j,1));
   fss = vertcat(fss,single);
 
end

fs;
fss;


single = 0.0;
fvv = str2double(cell2mat (fv(1)));
for j = 2:34
  single = cell2mat (fv(j,1));
   fvv = vertcat(fvv,single);
 
end



single = 0.0;
fss2 = str2double(cell2mat (fs2(1)));
for j = 2:34
  single = cell2mat (fs2(j,1));
   fss2 = vertcat(fss2,single);
 
end




single = 0.0;
fvv2 = str2double(cell2mat (fv2(1)));
for j = 2:34
  single = cell2mat (fv2(j,1));
   fvv2 = vertcat(fvv2,single);
 
end



single = 0.0;
fss3 = str2double(cell2mat (fs3(1)));
for j = 2:34
  single = cell2mat (fs3(j,1));
   fss3 = vertcat(fss3,single);
 
end




single = 0.0;
fvv3 = str2double(cell2mat (fv3(1)));
for j = 2:34
  single = cell2mat (fv3(j,1));
   fvv3 = vertcat(fvv3,single);
 
end



single = 0.0;
fss4 = str2double(cell2mat (fs4(1)));
for j = 2:34
  single = cell2mat (fs4(j,1));
   fss4 = vertcat(fss4,single);
 
end




single = 0.0;
fvv4 = str2double(cell2mat (fv4(1)));
for j = 2:34
  single = cell2mat (fv4(j,1));
   fvv4 = vertcat(fvv4,single);
 
end


%Repeat the same process for the testing set.

sst = size(fst4); 
svt = size(fvt4);

single = 0.0;
fsst = cell2mat (fst(1));
for j = 2:sst
  single = cell2mat (fst(j,1));
   fsst = vertcat(fsst,single);
 
end






single = 0.0;
fvvt = cell2mat (fvt(1));
for j = 2:svt
  single = cell2mat (fvt(j,1));
   fvvt = vertcat(fvvt,single);
 
end




single = 0.0;
fsst2 = cell2mat (fst2(1));
for j = 2:sst
  single = cell2mat (fst2(j,1));
   fsst2 = vertcat(fsst2,single);
 
end

single = 0.0;
fvvt2 = cell2mat (fvt2(1));
for j = 2:svt
  single = cell2mat (fvt2(j,1));
   fvvt2 = vertcat(fvvt2,single);
 
end




single = 0.0;
fsst3 = cell2mat (fst3(1));
for j = 2:sst
  single = cell2mat (fst3(j,1));
   fsst3 = vertcat(fsst3,single);
 
end




single = 0.0;
fvvt3 = cell2mat (fvt3(1));
for j = 2:svt
  single = cell2mat (fvt3(j,1));
   fvvt3 = vertcat(fvvt3,single);
 
end




single = 0.0;
fsst4 = cell2mat (fst4(1));
for j = 2:sst
  single = cell2mat (fst4(j,1));
   fsst4 = vertcat(fsst4,single);
 
end



single = 0.0;
fvvt4 = cell2mat (fvt4(1));
for j = 2:svt
  single = cell2mat (fvt4(j,1));
   fvvt4 = vertcat(fvvt4,single);
 
end


%fvvt4
%fvt4



 %if you want to calculate the w directly

%quadratic programming find the w based on constraints.

%Preparing the value for the minimization.
%H=eye(4+1) %H=eye(numOfAttributes+1) # of attributes is chosen by the feature f for now it's defaulted to 4
%H(4+1,4+1)=0 %makes the last element zero so we aren't minimizing for b the intercept
%ff=zeros(4+1,1)%vertical array of zeros.

H=eye(fnum+1) %H=eye(numOfAttributes+1) # of attributes is chosen by the feature f for now it's defaulted to 4
H(fnum+1,fnum+1)=0 %makes the last element zero so we aren't minimizing for b the intercept
ff=zeros(fnum+1,1)%vertical array of zeros.


%concatenating the features to one another the setosa and versicolor
%features.

f1 = vertcat(fss,fvv)  %petal legnth for both setosa and versicolor
f2 = vertcat(fss2,fvv2) % petal width //  //  //   //  // 
f3 = vertcat(fss3,fvv3) %sepal length
f4 = vertcat(fss4,fvv4) % sepal width 

f1t = vertcat(fsst,fvvt)  %petal legnth for both setosa and versicolor
f2t = vertcat(fsst2,fvvt2) % petal width //  //  //   //  // 
f3t = vertcat(fsst3,fvvt3) %sepal length
f4t = vertcat(fsst4,fvvt4) % sepal width 



%converting the classes to 1 and -1.
cs = ones(34,1)    %class setosa
cv = ones(34,1) * -1; %class versicolor

c = vertcat (cs,cv); % all the classes


%preparing Y the values for the constraint.
Y = diag(c) 

X = zeros(68,fnum)

%preparing X the constraint (depends on the features selected)


 X = horzcat(f1,f2)


if f == 12
X = [f1 f2]
Xt = [f1t f2t]
elseif f == 23 
    X = [f2 f3]
Xt = [f2t f3t]
elseif f == 13 
    X = [f1 f3]
Xt = [f1t f3t]
elseif f == 14 
    X = [f1 f4]
Xt = [f1t f4t]
elseif f == 24 
    X = [f2 f4]
 Xt = [f2t f4t]
elseif f == 34
    X = [f3 f4]
 Xt = [f3t f4t]
elseif f == 1 
    X = f1
    Xt = f1t
elseif f == 2
    X = f2
Xt = f2t
elseif f == 3 
    X = f3
Xt = f3t
elseif f == 4
    X = f4
Xt = f4t
elseif f == 123
    X = [f1 f2 f3]
Xt = [f1t f2t f3t]
elseif f == 124
    X = [f1 f2 f4]
Xt = [f1t f2t f4t]
elseif f == 134 
X = [f1 f3 f4]
Xt = [f1t f3t f4t]
elseif f == 234
    X = [f2 f3 f4]
Xt = [f2t f3t f4t]
elseif f == 1234 
 X = [f1 f2 f3 f4]
Xt = [f1t f2t f3t f4t]
end

fserosa = 0;
fvers = 0;



if f == 1
X1 = f1 
fserosa = fss; %used for plotting the points.
fvers = fvv;

%used for testing the points.
fserosat = fsst; %used for plotting the points.
fverst = fvvt;

elseif f == 2
X1 = f2 
fserosa = fss2; %used for plotting the points.
fvers = fvv2;

%used for testing the points.
fserosat = fsst2; %used for plotting the points.
fverst = fvvt2;

elseif f == 3
X1 = f3 
fserosa = fss3; %used for plotting the points.
fvers = fvv3;

%used for testing the points.
fserosat = fsst3; %used for plotting the points.
fverst = fvvt3;

elseif f == 4
X1 = f4 
fserosa = fss4; %used for plotting the points.
fvers = fvv4;

%used for testing the points.
fserosat = fsst4; %used for plotting the points.
fverst = fvvt4;

elseif f == 12
X1 = f1 
X2 = f2
fserosa = horzcat (fss,fss2); %used for plotting the points.
fvers = horzcat(fvv,fvv2);

%used for testing the points.
fserosat = horzcat (fsst,fsst2); %used for plotting the points.
fverst = horzcat(fvvt,fvvt2);

elseif f == 23 
    X1 = f2 
    X2 = f3
fserosa = horzcat (fss2,fss3);
fvers = horzcat(fvv2,fvv3);    

%used for testing the points.
fserosat = horzcat (fsst2,fsst3); %used for plotting the points.
fverst = horzcat(fvvt2,fvvt3);


elseif f == 13 
    X1 = f1 
    X2 = f3


fserosa = horzcat (fss,fss3);
fvers = horzcat(fvv,fvv3);

%used for testing the points.
fserosat = horzcat (fsst,fsst3); %used for plotting the points.
fverst = horzcat(fvvt,fvvt3);

elseif f == 14 
    X1 = f1 
    X2 = f4
fserosa = horzcat (fss,fss4);
fvers = horzcat(fvv,fvv4);

%used for testing the points.
fserosat = horzcat (fsst,fsst4); %used for plotting the points.
fverst = horzcat(fvvt,fvvt4);

elseif f == 24 
    X1 = f2 
    X2 = f4
fserosa = horzcat (fss2,fss4);
fvers = horzcat(fvv2,fvv4);

%used for testing the points.
fserosat = horzcat (fsst2,fsst4); %used for plotting the points.
fverst = horzcat(fvvt2,fvvt4);

elseif f == 34
    X1 = f3 
    X2 = f4
fserosa = horzcat (fss3,fss4);
fvers = horzcat(fvv3,fvv4);

%used for testing the points.
fserosat = horzcat (fsst3,fsst4); %used for plotting the points.
fverst = horzcat(fvvt3,fvvt4);
end


if a == 'w'


size (X)

Z = [X ones(68,1)] %double the amount of datasets.
A = -Y * Z
c = ones(68,1) * -1

length(ff)

[w]=quadprog(H,ff,A,c); 

%we rearranged the equation inthe tersm w1x1 + w2x2 + b =  0 in order to
%get the equation of the seperating line.
%we extract the w according to the number of features
finalw = w(1:fnum,1)
b = w(fnum+1,1)



if fnum == 2 %If we have two features
%Using equation of wx +b = 0 since we have to features
%x2w2 = -w1x1 -b <- we write one feature in term of the other
%x2 = -(w1x1+b)/w2

w1 = w(1,1)
w2 = w(2,1)
b = w(3,1)




%%% Code to plot the SVM margins goes here! %%%
hold on
%Plot the classes versicolor and setosa

% Plot the yes days
plot(fserosa(:,1),fserosa(:,2),'or') %red circles
% Plot the no days
plot(fvers(:,1),fvers(:,2),'+b')  %blue crosses
Y1=-(w1*X1+b)/w2; %Seperating hyperplane
plot(X1,Y1,'k-') 
YUP=(1-w1*X1-b)/w2; %Margin
plot(X1,YUP,'m:')
YLOW=(-1-w1*X1-b)/w2; %Margin
plot(X1,YLOW,'m:') 


% Read in the training data from a comma delimited file
%TESTDATA=dlmread('tennisweather2AttSVMTest.txt',',')
% Plot the new test point(s)
plot(fserosat(:,1),fserosat(:,2),'rp')
plot(fverst(:,1),fverst(:,2),'bp')
% Add some nice titles to the graph
title('Which Iris Flower')


if f == 12
xlabel('Petal Length')
ylabel('Petal Width')
end

if f == 23 
xlabel('Petal Width')
ylabel('Sepal Length')
end


if f == 13 
xlabel('Petal Length')
ylabel('Sepal Length')
end

if f == 14 
xlabel('Petal Length')
ylabel('Sepal Width')
end

if f == 24 
xlabel('Petal Width')
ylabel('Sepal Width')
end

if f == 34
xlabel('Sepal Length')
ylabel('Sepal Width')
end

%legend('Setosa','Versicolor','SVM Hyperplane','Upper Margin','Lower Margin','Setosa test','Versicolor test') 
hold off
end %End plotting for two features

if fnum == 1 %If we have one features
%Using equation of wx +b = 0 since we have one feature
%w1x1 =  -b <- we write one feature in term of the other
%x1 = -b/w1

w1 = w(1,1);
b = w(2,1);


%%% Code to plot the SVM margins goes here! %%%
hold on
%Plot the classes versicolor and setosa
%fserosa
plot(fserosa(:,1),0,'or') %red circles
% Plot the no days
plot(fvers(:,1),0,'+b')  %blue crosses
Y1=-(b)/w1; %Seperating hyperplane
%# vertical line
hx = graph2d.constantline(Y1, 'LineStyle',':', 'Color',[.7 .7 .7]);
changedependvar(hx,'x');

% Plot the new test point(s)
plot(fserosat(:,1),0,'rp')
plot(fverst(:,1),0,'bp')
% Add some nice titles to the graph
title('Which Iris Flower')


if f == 1
xlabel('Petal Length')
end

if f == 2
xlabel('Petal Width')
end

if f == 3 
ylabel('Sepal Length')
end

if f == 4 
ylabel('Sepal Width')
end


%legend('Setosa','Versicolor','Setosa test','Versicolor test') 

hold off
end % End plotting for 1 feature
end % end not using kernel and calculating w directly.


if a == 'a' % if you want to calculate the alphas


%without a kernel
newH =(Y*Y').*(X*X'); %To try on new kernels just replace the (X*X') with the desired kernel.

%with a kernel.
polyH =(Y*Y').*((X*X'+1).^2); %plynomial kernel of degree two.
%newH = (Y*Y').*(

%[rYY,cYY]= size(Y*Y');

% that is the kernel
%radial basis function
%for simplicity we use sigma =1 
sig = d;
%K= zeros(34,34);



for i =1:68   %number of elements in the training set.
    for j = 1:68
    X(i,:);
    X(j,:);

 prenorm = X(i,:)-X(j,:);
     norm = prenorm.^2; % square all the elements in subtraction to get norm 
     sumnorm = sum(norm); 
     denom = sig.^2  * 2;  %d is the sigma in this case.
      hey = exp(-sumnorm/denom);   
    K(i,j)= hey;
    
    end
end


Y = c % The classes or the Y 

%Please erase after testing
%Y = [1 1 -1 -1 1]'
%X = [1 2 4 5 6]'
%points = 68; %reset back to 68



%without a kernel
if k == 0
newH =(Y*Y').*(X*X'); %To try on new kernels just replace the (X*X') with the desired kernel.
end

%with a kernel.
if k == 1
polyH =(Y*Y').*(((X*X')+1).^d); %polynomial kernel of degree two.

end

if k == 2
radialH = (Y*Y').* K;  
end

if k == 3
newH =(Y*Y').*((X*X').^d) 
end

Hnow = 0;


if k == 0 
Hnow = newH
elseif k == 1
Hnow = polyH;
elseif k == 2
Hnow = radialH;
end




points = 68; %reset back to 68
%points = 5
fnow = -ones(1,points); %(is the same as the number of rows) and satisfies the second part of the equation.
%A = zeros(1,points);  %one of the constraints = 0
%c = 0;

A = -eye(points)
c = zeros(points,1)

%Aeq contains our y's..
%Aeq = Y';
Aeq = [[Y'];[zeros(points-1,points)]]; %This part of the code allows us to satisfy the contraints that sum of alpha y = 0
ceq = zeros(points,1)
%ceq = 0;

UB = 1000* ones(points,1);
LB = zeros(points,1);



if k ==-1000
alphas= quadprog(newH,fnow,A,c,Aeq,ceq,LB,UB)
%calculate the w using sum of alpha x y
elseif k ==1  %if the kernel is polynomial calculate alphas using polynomial kernel
%alphas= quadprog(polyH,fnow,A,c,Aeq,ceq,LB,UB)
alphas= quadprog(polyH+eye(points)*0.001,fnow,A,c,Aeq,ceq,LB,UB);

elseif k ==2 %if the kernel is radial calculate the alphas using the radial fucntion
alphas = quadprog(radialH,fnow,A,c,Aeq,ceq,LB,UB);

elseif k ==3 %this is a polynomial kernel of another variation it was not used.
alphas = quadprog(newH,fnow,A,c,Aeq,ceq,LB,UB);

end 

alphar = round2(alphas,0.01) %rounds alpha to two decimal places. 


w = zeros(1,fnum);


Xvec = 0;
Yvec = 0;
alphar2 = 0;
for i = 1:points %make sure it's 68 again
if alphar(i) > 0
el1 = Y(i);
el2 = alphar(i);
el12 = el1 *el2
w = w + (el12 * X(i,:));
if Xvec ==0
Xvec = X(i,:)
Yvec = Y(i)
alphar2 = alphar(i)
else
Xvec = vertcat(Xvec,X(i,:))
Yvec = vertcat(Yvec,Y(i))
alphar2 = vertcat(alphar2,alphar(i))
end

end
end

%how to calculate the b's
w
Xvec
Yvec


if k ==-100 % k was = 0 these functions were done to test the functionality of the kernels.
denom = 0
for i=1:68
if alphar(i)>0
alphar(i)
i
 above = alphar(i)* Y(i) * X(i,:) *Xvec(1,:)'
denom = denom + above
'hey'
end 
end

denom
b = Yvec(1) - denom
end

Xvec
Yvec
[rXvec,cXvec]=size(Xvec);
btotal =0

if k ==1 %the kernal = the quadratic function

for j =1:rXvec
    denom = 0
for i=1:rXvec
%if alphar(i)>0
%alphar(i)
%i
 above = alphar2(i)* Yvec(i) * ((Xvec(i,:) *Xvec(j,:)' +1).^d);
denom = denom + above
%'ley'
%end 
end

denom
b = Yvec(j) - denom
btotal = btotal +b
end

bav = btotal/rXvec

end

if k ==3 %the kernal = the quadratic function

for j =1:rXvec
    denom = 0
for i=1:rXvec
%if alphar(i)>0
%alphar(i)
%i
 above = alphar2(i)* Yvec(i) * ((Xvec(i,:) *Xvec(j,:)').^d);
denom = denom + above
%'ley'
%end 
end

denom
b = Yvec(j) - denom;
btotal = btotal +b
end

bav = btotal/rXvec

end

if k ==2 %the kernal = the quadratic function

for j =1:rXvec
    denom = 0
for i=1:rXvec
%if alphar(i)>0
%alphar(i)
%

 prenorm = Xvec(i,:)-Xvec(j,:);
     norm = prenorm.^2; % square all the elements in subtraction to get norm 
     sumnorm = sum(norm); 
     denom = sig.^2  * 2;
      hey = exp(-sumnorm/denom); 
 above = alphar2(i)* Yvec(i) * hey;
denom = denom + above
%'ley'
%end 
end



denom
b = Yvec(j) - denom
btotal = btotal +b
end

bav = btotal/rXvec

end






end  %end the thing here.. next 



%Build the descriminant funciton and test it against the test points.
%Train and test features using Bayesian
%if strcmp(cur =='x') %the curve

if a =='w'  % We aren't using the alphas for the calculation.
alphar2 = 0;
Xvec =0;
Yvec = 0;
d=0;
end

if a =='a'  % We aren't using the alphas for the calculation.
finalw = 0; %We do not use the w 
b =bav
end


traintestsvm(finalw,Xt,b,k,cst,cvt,f,curve,alphar2,Xvec,Yvec,d,n); %no ROC curve %w is the weight kernel is the kernel type, X is the feature set, b is the intercept. 
%else if





end
 