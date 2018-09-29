function [ Ex1, Exv1 ] = multix2( b,c )

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Multi using two features.



%For class seritosa

Ms =csvimport(b);
[Rs,Cs] = size(Ms);
f2s = Ms(1:34,1);   %select training set of feature 1
f2st = Ms(35:Rs,1); %select testing set of feature 1
f2s2 = Ms(1:34,2);   %select training set of feature 2
f2st2 = Ms(35:Rs,2); %select testing set of feature 2
f2s3 = Ms(1:34,3);   %select training set of feature 3
f2st3 = Ms(35:Rs,3); %select testing set of feature 3
f2s4 = Ms(1:34,4);   %select training set of feature 4
f2st4 = Ms(35:Rs,4); %select testing set of feature 4
cs = Ms(1:34,5);    %select training set of classes
cst = Ms(35:Rs,5);  %select testing set of classes


%For class versicolor

%Repeat the same process for versicolor dataset
Mv =csvimport(c);
[Rv,Cv] = size(Mv);
f2v = Mv(1:34,1); %training set of feature 1
f2vt = Mv(35:Rv,1); %testing set feature 1
f2v2 = Mv(1:34,2); %training set feature 2
f2vt2 = Mv(35:Rv,2); %testing set feature 2
f2v3 = Mv(1:34,3); %training set feature 3
f2vt3 = Mv(35:Rv,3); %testing set feature 3
f2v4 = Mv(1:34,4); %training set feature 4
f2vt4 = Mv(35:Rv,4); %testing set feature 4
cv = Mv(1:34,5);  %training set of classes
cvt = Mv(35:Rv,5); %testing set of classes


%%%%%%%%%

%Preprocessing to conver the extracted features to integers

single = 0.0;
f22s = str2double(cell2mat (f2s(1)));
for j = 2:34
  single = cell2mat (f2s(j,1));
   f22s = vertcat(f22s,single);
 
end

single = 0.0;
f22v = str2double(cell2mat (f2v(1)));
for j = 2:34
  single = cell2mat (f2v(j,1));
   f22v = vertcat(f22v,single);
 
end

single = 0.0;
f22s2 = str2double(cell2mat (f2s2(1)));
for j = 2:34
  single = cell2mat (f2s2(j,1));
   f22s2 = vertcat(f22s2,single);
 
end

single = 0.0;
f22v2 = str2double(cell2mat (f2v2(1)));
for j = 2:34
  single = cell2mat (f2v2(j,1));
   f22v2 = vertcat(f22v2,single);
 
end

single = 0.0;
f22s3 = str2double(cell2mat (f2s3(1)));
for j = 2:34
  single = cell2mat (f2s3(j,1));
   f22s3 = vertcat(f22s3,single);
 
end

single = 0.0;
f22v3 = str2double(cell2mat (f2v3(1)));
for j = 2:34
  single = cell2mat (f2v3(j,1));
   f22v3 = vertcat(f22v3,single);
 
end

single = 0.0;
f22s4 = str2double(cell2mat (f2s4(1)));
for j = 2:34
  single = cell2mat (f2s4(j,1));
   f22s4 = vertcat(f22s4,single);
 
end

single = 0.0;
f22v4 = str2double(cell2mat (f2v4(1)));
for j = 2:34
  single = cell2mat (f2v4(j,1));
   f22v4 = vertcat(f22v4,single);
 
end


%%%%%%%%%


x = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2]


%%%%%%%%%% Calculating the mean for each feature Ex1, Ex2, Ex3 and Ex4
%%%%%%%%%% represent features 1,2,3 and 4 respectively. This is done for
%%%%%%%%%% class Setosa

totalx1 = 0;
for j = 1:34

totalx1 = totalx1 +  f22s(j);
end
Ex1 = totalx1/34

totalx2 = 0;
for j = 1:34

totalx2 = totalx2 +  f22s2(j);
end
Ex2 = totalx2/34

totalx3 = 0;
for j = 1:34

totalx3 = totalx3 +  f22s3(j);
end
Ex3 = totalx3/34

totalx4 = 0;
for j = 1:34

totalx4 = totalx4 +  f22s4(j);
end
Ex4 = totalx4/34


%%%%%%%Find the means for the four features but for class versicolor
%%%%%%%instead.

totalx1 = 0;
for j = 1:34

totalx1 = totalx1 +  f22v(j);
end
Exv1 = totalx1/34


totalx2 = 0;
for j = 1:34

totalx2 = totalx2 +  f22v2(j);
end
Exv2 = totalx2/34

totalx3 = 0;
for j = 1:34

totalx3 = totalx3 +  f22v3(j);
end
Exv3 = totalx3/34

totalx4 = 0;
for j = 1:34

totalx4 = totalx4 +  f22v4(j);
end
Exv4 = totalx4/34

%%%%%%%%%%
%Extra not used
%total1 = 0;
%for j = 1:34

%total1 = total1 + (f22s(j)- Ex1).^2;
%end
%Sigx1 = total1/34;





%total2 = 0;
%for j = 1:34

%total2 = total2 + (f22s2(j)- Ex2).^2;
%end
%Sigx2 = total2/34

%total3 = 0;
%for j = 1:34

%total3 = total3 +  (f22s3(j)-Ex3).^2;
%end
%Sigx3 = total3/34

%totalx4 = 0;
%for j = 1:34

%total4 = total4 +  (f22s4(j)-Ex4).^2;
%end
%Sigx4 = total4/34



%Nx12 =  (1/((2 *3.1416) * ((det(xmu12co)).^0.5)))* exp(-1/2 *xmu12t * inv(xmu12co)* xmu12)
%%%%%%%


% Create column vectors for the average values of different features

%Creating column vector of averages for two features 
mu12 = [Ex1;Ex2];
mu23 = [Ex2;Ex3];
mu13 = [Ex1;Ex3];
mu14 = [Ex1;Ex4];
mu24 = [Ex2;Ex4];
mu34 = [Ex3;Ex4];


%Creating column vector of averages for three features
mu123 = [Ex1;Ex2;Ex3];
mu124 = [Ex1;Ex2;Ex4];
mu134 = [Ex1;Ex3;Ex4];
mu234 = [Ex2;Ex3;Ex4];

%Creating column vector of averages for three features
mu1234 = [Ex1;Ex2;Ex3;Ex4];




%Calculating the covariances for the multivariant gaussian
%Creating covariance matrix for two features 
%This is class setosa


xmu12sq = zeros(2);
for j = 1:34
xmu12 = [f22s(j)-Ex1;f22s2(j)-Ex2];
xmu12t = xmu12';
xmu12sq = xmu12sq + xmu12 * xmu12t;
end

xmu12co = xmu12sq/34;



xmu23sq = zeros(2); 
for i = 1:34
xmu23 = [f22s2(i)-Ex2;f22s3(i)-Ex3];
xmu23t = xmu23'
xmu23sq = xmu23sq + xmu23 * xmu23t;
end

xmu23co = xmu23sq/34
%%%%%%

xmu13sq = zeros(2);
for i = 1:34
xmu13 = [f22s(i)-Ex1;f22s3(i)-Ex3];
xmu13t = xmu13'
xmu13sq = xmu13sq + xmu13 * xmu13t;
end

xmu13co = xmu13sq/34
%%%%%%%


xmu14sq = zeros(2);
for i = 1:34
xmu14 = [f22s(i)-Ex1;f22s4(i)-Ex4];
xmu14t = xmu14'
xmu14sq = xmu14sq + xmu14 * xmu14t;
end

xmu14co = xmu14sq/34

%%%%%%%
xmu24sq = zeros(2);
for i = 1:34
xmu24 = [f22s2(i);f22s4(i)]- mu24;
xmu24t = xmu24'
xmu24sq = xmu24sq + xmu24 * xmu24t;
end
xmu24co = xmu24sq/34

%%%%%%%
mu34 = [Ex3;Ex4];
xmu34sq = zeros(2);
for i = 1:34
xmu34 = [f22s3(i);f22s4(i)]- mu34;
xmu34t = xmu34'
xmu34sq = xmu34sq + xmu34 * xmu34t;
end
xmu34co = xmu34sq/34

%%%%%%


%Creating covariance matrix for three features


xmu123sq = zeros(3);
for i = 1:34
xmu123 = [f22s(i)-Ex1;f22s2(i)-Ex2;f22s3(i)-Ex3];
xmu123t = xmu123'
xmu123sq = xmu123sq + xmu123 * xmu123t;
end

xmu123co = xmu123sq/34

%%%%%%
xmu124sq = zeros(3);
for i = 1:34
xmu124 = [f22s(i)-Ex1;f22s2(i)-Ex2;f22s4(i)-Ex4];
xmu124t = xmu124'
xmu124sq = xmu124sq + xmu124 * xmu124t;
end

xmu124co = xmu124sq/34
%%%%%


xmu134sq = zeros(3);
for i = 1:34
xmu134 = [f22s(i)-Ex1;f22s3(i)-Ex3;f22s4(i)-Ex4];
xmu134t = xmu134'
xmu134sq = xmu134sq + xmu134 * xmu134t;
end

xmu134co = xmu134sq/34

%%%%%%%%

xmu234sq = zeros(3);
for i = 1:34
xmu234 = [f22s2(i)-Ex2;f22s3(i)-Ex3;f22s4(i)-Ex4];
xmu234t = xmu234'
xmu234sq = xmu234sq + xmu234 * xmu234t;
end

xmu234co = xmu234sq/34

%%%%%%

%Creating covariance matrix for four features

xmu1234sq = zeros(4);
for i = 1:34
xmu1234 = [f22s(i)-Ex1;f22s2(i)-Ex2;f22s3(i)-Ex3;f22s4(i)-Ex4];
xmu1234t = xmu1234'
xmu1234sq = xmu1234sq + xmu1234 * xmu1234t;
end

xmu1234co = xmu1234sq/34

%%%%%%%%

%Repeating the same steps for class versicolor
%%%%%%%%
%Calculating the means for two, three, and four features respectively

muv12 = [Exv1;Exv2];
muv23 = [Exv2;Exv3];
muv13 = [Exv1;Exv3];
muv14 = [Exv1;Exv4];
muv24 = [Exv2;Exv4];
muv34 = [Exv3;Exv4];
muv123 = [Exv1;Exv2;Exv3];
muv124 = [Exv1;Exv2;Exv4];
muv134 = [Exv1;Exv3;Exv4];
muv234 = [Exv2;Exv3;Exv4];
muv1234 = [Exv1;Exv2;Exv3;Exv4];


%%%%%%Calculating covariances for class versicolor
%%%%Calculating covariances for two features

xmuv12sq = zeros(2);
for i = 1:34
xmuv12 = [f22v(i);f22v2(i)]-muv12;
xmuv12t = xmuv12.';
xmuv12sq = xmuv12sq + xmuv12 * xmuv12t;
end

xmuv12co = xmuv12sq/34;

%%%%%
xmuv23sq = zeros(2); 
for i = 1:34
xmuv23 = [f22v2(i);f22v3(i)]-muv23;
xmuv23t = xmuv23'
xmuv23sq = xmuv23sq + xmuv23 * xmuv23t;
end

xmuv23co = xmuv23sq/34
%%%%%%

xmuv13sq = zeros(2);
for i = 1:34
xmuv13 = [f22v(i);f22v3(i)]-muv13;
xmuv13t = xmuv13'
xmuv13sq = xmuv13sq + xmuv13 * xmuv13t;
end

xmuv13co = xmuv13sq/34
%%%%%%%


xmuv14sq = zeros(2);
for i = 1:34
xmuv14 = [f22v(i);f22v4(i)]-muv14;
xmuv14t = xmuv14'
xmuv14sq = xmuv14sq + xmuv14 * xmuv14t;
end

xmuv14co = xmuv14sq/34

%%%%%%%
xmuv24sq = zeros(2);
for i = 1:34
xmuv24 = [f22v2(i);f22v4(i)]-muv24;
xmuv24t = xmuv24';
xmuv24sq = xmuv24sq + xmuv24 * xmuv24t;
end

xmuv24co = xmuv24sq/34
%%%%%%%

xmuv34sq = zeros(2);
for i = 1:34
xmuv34 = [f22v3(i);f22v4(i)]-muv34;
xmuv34t = xmuv34'
xmuv34sq = xmuv34sq + xmuv34 * xmuv34t;
end

xmuv34co = xmuv34sq/34
%%%%%%


%%% Three features covariance calculation 
xmuv123sq = zeros(3);
for i = 1:34
xmuv123 = [f22v(i);f22v2(i);f22v3(i)]- muv123;
xmuv123t = xmuv123'
xmuv123sq = xmuv123sq + xmuv123 * xmuv123t;
end

xmuv123co = xmuv123sq/34

%%%%%%
xmuv124sq = zeros(3);
for i = 1:34
xmuv124 = [f22v(i);f22v2(i);f22v4(i)]-muv124;
xmuv124t = xmuv124'
xmuv124sq = xmuv124sq + xmuv124 * xmuv124t;
end

xmuv124co = xmuv124sq/34
%%%%%


xmuv134sq = zeros(3);
for i = 1:34
xmuv134 = [f22v(i);f22v3(i);f22v4(i)]-muv134;
xmuv134t = xmuv134'
xmuv134sq = xmuv134sq + xmuv134 * xmuv134t;
end

xmuv134co = xmuv134sq/34

%%%%%%%%

xmuv234sq = zeros(3);
for i = 1:34
xmuv234 = [f22v2(i);f22v3(i);f22v4(i)]- muv234;
xmuv234t = xmuv234'
xmuv234sq = xmuv234sq + xmuv234 * xmuv234t;
end

xmuv234co = xmuv234sq/34

%%%%%%
%Calculating the covariances four features
xmuv1234sq = zeros(4);
for i = 1:34
xmuv1234 = [f22v(i);f22v2(i);f22v3(i);f22v4(i)]-muv1234;
xmuv1234t = xmuv1234'
xmuv1234sq = xmuv1234sq + xmuv1234 * xmuv1234t;
end

xmuv1234co = xmuv1234sq/34

%%%%%%%%
%Calculating the the boundary equation and the gaussian function for 
%two features for both class setosa and versicolor

xt = x';
[xr,xc] = size(xt);


%Features 1 and 2

Nx12m=zeros(xr);
Nxv12m=zeros(xr);
g1x12m = zeros(xr);
g2x12m = zeros(xr);
for i= 1:xr
for j= 1:xr
xmu12 = [xt(i)-Ex1;xt(j)-Ex2];
xmu12t = xmu12'; % transpose

xmuv12 = [xt(i)-Exv1;xt(j)-Exv2];
xmuv12t = xmuv12'; % transpose

Nx12 =  (1/((2 *3.1416) * ((det(xmu12co)).^0.5)))* exp(-1/2 *xmu12t * inv(xmu12co)* xmu12)
Nx12m(i,j) = Nx12; 
Nxv12 =  (1/((2 *3.1416) * ((det(xmuv12co)).^0.5)))* exp(-1/2 *xmuv12t * inv(xmuv12co)* xmuv12)
Nxv12m(i,j) = Nxv12; 
g1x12 = -1/2 *xmu12t * inv(xmu12co)* xmu12 - log(2 *3.1416) - 0.5 *log(det(xmu12co));
g2x12 = -1/2 *xmuv12t * inv(xmuv12co)* xmuv12 - log(2 *3.1416) - 0.5 * log(det(xmuv12co));
g1x12m(i,j) = g1x12;
g2x12m(i,j) = g2x12;
end
end


%g1x12m
g2x12m
y = x;
[X,Y] = meshgrid(x,y);



%You can uncomment the code here to recreate drawing the guassian and the
%border function.


%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx12m);
%hold on
%surf(X,Y,Nxv12m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x12m);
%hold on
%surf(X,Y,g2x12m);


%Starting two more features.




%Making the training and testing sets for all four features of setosaand
%versicolor
%%%%%%%%%

trainf1 = vertcat(f22s,f22v);  %training set, feature 1, setosa
testf1 = vertcat(f2st,f2vt); %testing set, feature 2, versicolor


trainf2 = vertcat(f22s2,f22v2);  %training set, feature 2, setosa
testf2 = vertcat(f2st2,f2vt2); %testing set, feature 2, versicolor

trainf3 = vertcat(f22s3,f22v3);  %training set, feature 3, setosa
testf3 = vertcat(f2st3,f2vt3); %testing set, feature 3, versicolor

trainf4 = vertcat(f22s4,f22v4);  %training set, feature 4, setosa
testf4 = vertcat(f2st4,f2vt4); %testing set, feature 4, versicolor

trainc = vertcat(cs,cv);  %training set % same for all the classes
testc = vertcat(cst,cvt); %testing set


%Get the sizes of the training and testing set respectively
[Rtr,Ctr] = size(trainf1);
[Rte,Cte] = size(testf1);


%Peroform a four loop on attained borer equation for features 1 and 2 to
%calculating training errors of the data.
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
if g1x12m(trainf1(i,1)*10,trainf2(j,1)*10)> g2x12m(trainf1(i,1)*10,trainf2(j,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end


%measures the true positive rate for the entire class and for class setosa
%and versicolor respectively
accuracytr12 = true / (true +false)
accuracytrs12 = trues / (trues +falsev)
accuracytrv12 = truev / (truev +falses)



%Repeat for testing set the above for the testing class note that g is 2d
%in the multvariate.

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte

if g1x12m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10))> g2x12m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end

accuracyte12 = true / (true + false)
accuracytes12 = trues / (trues + falsev)
accuracytev12 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false


%%%%%%%
%Repeatin the same process for features 1 and 3
%%%%%%%%
Nx13m=zeros(xr);
Nxv13m=zeros(xr);
g1x13m = zeros(xr); %borderline equation for setosa
g2x13m = zeros(xr); %borderline equation of versicolor %before being assigned values
for i= 1:xr
for j= 1:xr
xmu13 = [xt(i)-Ex1;xt(j)-Ex3];
xmu13t = xmu13'; % transpose

xmuv13 = [xt(i)-Exv1;xt(j)-Exv3];
xmuv13t = xmuv13'; % transpose

Nx13 =  (1/((2 *3.1416) * ((det(xmu13co)).^0.5)))* exp(-1/2 *xmu13t * inv(xmu13co)* xmu13)
Nx13m(i,j) = Nx13; 
Nxv13 =  (1/((2 *3.1416) * ((det(xmuv13co)).^0.5)))* exp(-1/2 *xmuv13t * inv(xmuv13co)* xmuv13)
Nxv13m(i,j) = Nxv13; 
g1x13 = -1/2 *xmu13t * inv(xmu13co)* xmu13 - log(2 *3.1416) - 0.5 *log(det(xmu13co));
g2x13 = -1/2 *xmuv13t * inv(xmuv13co)* xmuv13 - log(2 *3.1416) - 0.5 * log(det(xmuv13co));
g1x13m(i,j) = g1x13;
g2x13m(i,j) = g2x13;
end
end


%Uncomment to plot the gaussian and border functions

%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx13m);
%hold on
%surf(X,Y,Nxv13m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x13m);
%hold on
%surf(X,Y,g2x13m);

%%%%%
%Making the training and testing sets.
%%%%%%%%%



class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
if g1x13m(trainf1(i,1)*10,trainf3(j,1)*10)> g2x13m(trainf1(i,1)*10,trainf3(j,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end

accuracytr13 = true / (true +false)
accuracytrs13 = trues / (trues +falsev)
accuracytrv13 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte

if g1x13m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(j,1))*10))> g2x13m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(j,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end

accuracyte13 = true / (true + false)
accuracytes13 = trues / (trues + falsev)
accuracytev13 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false

%
%Gaussian borderline equation and training of features 1 and 4
%%%%%%%

Nx14m=zeros(xr);
Nxv14m=zeros(xr);
g1x14m = zeros(xr);
g2x14m = zeros(xr);
for i= 1:xr
for j= 1:xr
xmu14 = [xt(i)-Ex1;xt(j)-Ex4];
xmu14t = xmu14'; % transpose

xmuv14 = [xt(i)-Exv1;xt(j)-Exv4];
xmuv14t = xmuv14'; % transpose

Nx14 =  (1/((2 *3.1416) * ((det(xmu14co)).^0.5)))* exp(-1/2 *xmu14t * inv(xmu14co)* xmu14)
Nx14m(i,j) = Nx14; 
Nxv14 =  (1/((2 *3.1416) * ((det(xmuv14co)).^0.5)))* exp(-1/2 *xmuv14t * inv(xmuv14co)* xmuv14)
Nxv14m(i,j) = Nxv14; 
g1x14 = -1/2 *xmu14t * inv(xmu14co)* xmu14 - log(2 *3.1416) - 0.5 *log(det(xmu14co));
g2x14 = -1/2 *xmuv14t * inv(xmuv14co)* xmuv14 - log(2 *3.1416) - 0.5 * log(det(xmuv14co));
g1x14m(i,j) = g1x14;
g2x14m(i,j) = g2x14;
end
end

%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx14m);
%hold on
%surf(X,Y,Nxv14m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x14m);
%hold on
%surf(X,Y,g2x14m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
if g1x14m(trainf1(i,1)*10,trainf4(j,1)*10)> g2x14m(trainf1(i,1)*10,trainf4(j,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end

accuracytr14 = true / (true +false)
accuracytrs14 = trues / (trues +falsev)
accuracytrv14 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte

if g1x14m((cell2mat(testf1(i,1))*10),(cell2mat(testf4(j,1))*10))> g2x14m((cell2mat(testf1(i,1))*10),(cell2mat(testf4(j,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end

accuracyte14 = true / (true + false)
accuracytes14 = trues / (trues + falsev)
accuracytev14 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false

%%%%%
%Gaussian borderline calculation and training of features 2 and 3
%%%%%%%

Nx23m=zeros(xr);
Nxv23m=zeros(xr);
g1x23m = zeros(xr);
g2x23m = zeros(xr);
for i= 1:xr
for j= 1:xr
xmu23 = [xt(i)-Ex2;xt(j)-Ex3];
xmu23t = xmu23'; % transpose

xmuv23 = [xt(i)-Exv2;xt(j)-Exv3];
xmuv23t = xmuv23'; % transpose

Nx23 =  (1/((2 *3.1416) * ((det(xmu23co)).^0.5)))* exp(-1/2 *xmu23t * inv(xmu23co)* xmu23)
Nx23m(i,j) = Nx23; 
Nxv23 =  (1/((2 *3.1416) * ((det(xmuv23co)).^0.5)))* exp(-1/2 *xmuv23t * inv(xmuv23co)* xmuv23)
Nxv23m(i,j) = Nxv23; 
g1x23 = -1/2 *xmu23t * inv(xmu23co)* xmu23 - log(2 *3.1416) - 0.5 *log(det(xmu23co));
g2x23 = -1/2 *xmuv23t * inv(xmuv23co)* xmuv23 - log(2 *3.1416) - 0.5 * log(det(xmuv23co));
g1x23m(i,j) = g1x23;
g2x23m(i,j) = g2x23;
end
end

%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx23m);
%hold on
%surf(X,Y,Nxv23m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x23m);
%hold on
%surf(X,Y,g2x23m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
if g1x23m(trainf2(i,1)*10,trainf3(j,1)*10)> g2x23m(trainf2(i,1)*10,trainf3(j,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end

accuracytr23 = true / (true +false)
accuracytrs23 = trues / (trues +falsev)
accuracytrv23 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte

if g1x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(j,1))*10))> g2x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(j,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end

accuracyte23 = true / (true + false)
accuracytes23 = trues / (trues + falsev)
accuracytev23 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false


%%%%%%% Gaussian borderline calculation and training of features 2 and 4

Nx24m=zeros(xr);
Nxv24m=zeros(xr);
g1x24m = zeros(xr);
g2x24m = zeros(xr);
for i= 1:xr
for j= 1:xr
xmu24 = [xt(i)-Ex2;xt(j)-Ex4];
xmu24t = xmu24'; % transpose

xmuv24 = [xt(i)-Exv2;xt(j)-Exv4];
xmuv24t = xmuv24'; % transpose

Nx24 =  (1/((2 *3.1416) * ((det(xmu24co)).^0.5)))* exp(-1/2 *xmu24t * inv(xmu24co)* xmu24)
Nx24m(i,j) = Nx24; 
Nxv24 =  (1/((2 *3.1416) * ((det(xmuv24co)).^0.5)))* exp(-1/2 *xmuv24t * inv(xmuv24co)* xmuv24)
Nxv24m(i,j) = Nxv24; 
g1x24 = -1/2 *xmu24t * inv(xmu24co)* xmu24 - log(2 *3.1416) - 0.5 *log(det(xmu24co));
g2x24 = -1/2 *xmuv24t * inv(xmuv24co)* xmuv24 - log(2 *3.1416) - 0.5 * log(det(xmuv24co));
g1x24m(i,j) = g1x24;
g2x24m(i,j) = g2x24;
end
end

%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx24m);
%hold on
%surf(X,Y,Nxv24m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x24m);
%hold on
%surf(X,Y,g2x24m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
if g1x24m(trainf2(i,1)*10,trainf4(j,1)*10)> g2x24m(trainf2(i,1)*10,trainf4(j,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end

accuracytr24 = true / (true +false)
accuracytrs24 = trues / (trues +falsev)
accuracytrv24 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte

if g1x24m((cell2mat(testf2(i,1))*10),(cell2mat(testf4(j,1))*10))> g2x24m((cell2mat(testf2(i,1))*10),(cell2mat(testf4(j,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end

accuracyte24 = true / (true + false)
accuracytes24 = trues / (trues + falsev)
accuracytev24 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false


%%%%%%% Gaussian border equations and training of featuers 3 and 4

Nx34m=zeros(xr);
Nxv34m=zeros(xr);
g1x34m = zeros(xr);
g2x34m = zeros(xr);
for i= 1:xr
for j= 1:xr
xmu34 = [xt(i)-Ex3;xt(j)-Ex4];
xmu34t = xmu34'; % transpose

xmuv34 = [xt(i)-Exv3;xt(j)-Exv4];
xmuv34t = xmuv34'; % transpose

Nx34 =  (1/((2 *3.1416) * ((det(xmu34co)).^0.5)))* exp(-1/2 *xmu34t * inv(xmu34co)* xmu34)
Nx34m(i,j) = Nx34; 
Nxv34 =  (1/((2 *3.1416) * ((det(xmuv34co)).^0.5)))* exp(-1/2 *xmuv34t * inv(xmuv34co)* xmuv34)
Nxv34m(i,j) = Nxv34; 
g1x34 = -1/2 *xmu34t * inv(xmu34co)* xmu34 - log(2 *3.1416) - 0.5 *log(det(xmu34co));
g2x34 = -1/2 *xmuv34t * inv(xmuv34co)* xmuv34 - log(2 *3.1416) - 0.5 * log(det(xmuv34co));
g1x34m(i,j) = g1x34;
g2x34m(i,j) = g2x34;
end
end

%Uncomment to recreate 3d plots
%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx34m);
%hold on
%surf(X,Y,Nxv34m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x34m);
%hold on
%surf(X,Y,g2x34m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
if g1x34m(trainf3(i,1)*10,trainf4(j,1)*10)> g2x34m(trainf3(i,1)*10,trainf4(j,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end

accuracytr34 = true / (true +false)
accuracytrs34 = trues / (trues +falsev)
accuracytrv34 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte

if g1x34m((cell2mat(testf3(i,1))*10),(cell2mat(testf4(j,1))*10))> g2x34m((cell2mat(testf3(i,1))*10),(cell2mat(testf4(j,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end

accuracyte34 = true / (true + false)
accuracytes34 = trues / (trues + falsev)
accuracytev34 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false

%%%%%%%Borderline equations and training/testing of features 1,2, and 3

Nx123m=zeros(xr,xr,xr);
Nxv123m=zeros(xr,xr,xr);
g1x123m = zeros(xr,xr,xr);
g2x123m = zeros(xr,xr,xr);
for i= 1:xr
for j= 1:xr
for k= 1:xr
xmu123 = [xt(i);xt(j);xt(k)]-mu123;
xmu123t = xmu123'; % transpose

xmuv123 = [xt(i);xt(j);xt(k)]-muv123;
xmuv123t = xmuv123'; % transpose

Nx123 =  (1/((2 *3.1416).^1.5 * ((det(xmu123co)).^0.5)))* exp(-1/2 *xmu123t * inv(xmu123co)* xmu123);
Nx123m(i,j,k) = Nx123; 
Nxv123 =  (1/((2 *3.1416).^1.5 * ((det(xmuv123co)).^0.5)))* exp(-1/2 *xmuv123t * inv(xmuv123co)* xmuv123);
Nxv123m(i,j,k) = Nxv123; 
g1x123 = -1/2 *xmu123t * inv(xmu123co)* xmu123 - 1.5*log(2 *3.1416) - 0.5 *log(det(xmu123co));
g2x123 = -1/2 *xmuv123t * inv(xmuv123co)* xmuv123 - 1.5*log(2 *3.1416) - 0.5 * log(det(xmuv123co));
g1x123m(i,j,k) = g1x123;
g2x123m(i,j,k) = g2x123;
end
end
end

g1x123m
g2x123m
xmu123co
xmuv123co


%%%%%%%%%%%

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
for k=1:Rtr
if g1x123m(trainf1(i,1)*10,trainf2(j,1)*10,trainf3(k,1)*10)> g2x123m(trainf1(i,1)*10,trainf2(j,1)*10,trainf3(k,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end
end

accuracytr123 = true / (true +false)
accuracytrs123 = trues / (trues +falsev)
accuracytrv123 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte
for k=1:Rte
if g1x123m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10),(cell2mat(testf3(k,1))*10))> g2x123m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10),(cell2mat(testf3(k,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end
end

accuracyte123 = true / (true + false)
accuracytes123 = trues / (trues + falsev)
accuracytev123 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false
%%%




%%%%%%% Border equations + training of features 1,2, and 4
%%%%%%%
Nx124m=zeros(xr,xr,xr);
Nxv124m=zeros(xr,xr,xr);
g1x124m = zeros(xr,xr,xr);
g2x124m = zeros(xr,xr,xr);
for i= 1:xr
for j= 1:xr
for k= 1:xr
xmu124 = [xt(i);xt(j);xt(k)]-mu124;
xmu124t = xmu124'; % transpose

xmuv124 = [xt(i);xt(j);xt(k)]-muv124;
xmuv124t = xmuv124'; % transpose

%Nx124 =  (1/((2 *3.1416).^1.5 * ((det(xmu124co)).^0.5)))* exp(-1/2 *xmu124t * inv(xmu124co)* xmu124);
%Nx124m(i,j,k) = Nx124; 
%Nxv124 =  (1/((2 *3.1416).^1.5 * ((det(xmuv124co)).^0.5)))* exp(-1/2 *xmuv124t * inv(xmuv124co)* xmuv124);
%Nxv124m(i,j,k) = Nxv124; 
g1x124 = -1/2 *xmu124t * inv(xmu124co)* xmu124 - 1.5 * log(2 *3.1416) - 0.5 *log(det(xmu124co));
g2x124 = -1/2 *xmuv124t * inv(xmuv124co)* xmuv124 - 1.5 * log(2 *3.1416) - 0.5 * log(det(xmuv124co));
g1x124m(i,j,k) = g1x124;
g2x124m(i,j,k) = g2x124;
end
end
end



%
%Training
%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
for k=1:Rtr
if g1x124m(trainf1(i,1)*10,trainf2(j,1)*10,trainf4(k,1)*10)> g2x124m(trainf1(i,1)*10,trainf2(j,1)*10,trainf4(k,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end
end

accuracytr124 = true / (true +false)
accuracytrs124 = trues / (trues +falsev)
accuracytrv124 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte
for k=1:Rte
if g1x124m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10),(cell2mat(testf4(k,1))*10))> g2x124m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10),(cell2mat(testf4(k,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end
end

accuracyte124 = true / (true + false)
accuracytes124 = trues / (trues + falsev)
accuracytev124 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false
%%%
%134 %%%%    234 
%%%%%%%

Nx134m=zeros(xr,xr,xr);
Nxv134m=zeros(xr,xr,xr);
g1x134m = zeros(xr,xr,xr);
g2x134m = zeros(xr,xr,xr);
for i= 1:xr
for j= 1:xr
for k= 1:xr
xmu134 = [xt(i);xt(j);xt(k)]-mu134;
xmu134t = xmu134'; % transpose

xmuv134 = [xt(i);xt(j);xt(k)]-muv134;
xmuv134t = xmuv134'; % transpose

%Nx134 =  (1/((2 *3.1416).^1.5 * ((det(xmu134co)).^0.5)))* exp(-1/2 *xmu134t * inv(xmu134co)* xmu134);
%Nx134m(i,j,k) = Nx134; 
%Nxv134 =  (1/((2 *3.1416).^1.5 * ((det(xmuv134co)).^0.5)))* exp(-1/2 *xmuv134t * inv(xmuv134co)* xmuv134);
%Nxv134m(i,j,k) = Nxv134; 
g1x134 = -1/2 *xmu134t * inv(xmu134co)* xmu134 - 1.5 * log(2 *3.1416) - 0.5 *log(det(xmu134co));
g2x134 = -1/2 *xmuv134t * inv(xmuv134co)* xmuv134 - 1.5 * log(2 *3.1416) - 0.5 * log(det(xmuv134co));
g1x134m(i,j,k) = g1x134;
g2x134m(i,j,k) = g2x134;
end
end
end


%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
for k=1:Rtr
if g1x134m(trainf1(i,1)*10,trainf3(j,1)*10,trainf4(k,1)*10)> g2x134m(trainf1(i,1)*10,trainf3(j,1)*10,trainf4(k,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end
end

accuracytr134 = true / (true +false)
accuracytrs134 = trues / (trues +falsev)
accuracytrv134 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte
for k=1:Rte
if g1x134m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(j,1))*10),(cell2mat(testf4(k,1))*10))> g2x134m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(j,1))*10),(cell2mat(testf4(k,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end
end

accuracyte134 = true / (true + false)
accuracytes134 = trues / (trues + falsev)
accuracytev134 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false

%%%%%
%%%%%%% Border line equations plus training for features 2,3,4

Nx234m=zeros(xr,xr,xr);
Nxv234m=zeros(xr,xr,xr);
g1x234m = zeros(xr,xr,xr);
g2x234m = zeros(xr,xr,xr);
for i= 1:xr
for j= 1:xr
for k= 1:xr
xmu234 = [xt(i);xt(j);xt(k)]-mu234;
xmu234t = xmu234'; % transpose

xmuv234 = [xt(i);xt(j);xt(k)]-muv234;
xmuv234t = xmuv234'; % transpose

%Nx234 =  (1/((2 *3.1416).^1.5 * ((det(xmu234co)).^0.5)))* exp(-1/2 *xmu234t * inv(xmu234co)* xmu234);
%Nx234m(i,j,k) = Nx234; 
%Nxv234 =  (1/((2 *3.1416).^1.5 * ((det(xmuv234co)).^0.5)))* exp(-1/2 *xmuv234t * inv(xmuv234co)* xmuv234);
%Nxv234m(i,j,k) = Nxv234; 
g1x234 = -1/2 *xmu234t * inv(xmu234co)* xmu234 - 1.5 * log(2 *3.1416) - 0.5 *log(det(xmu234co));
g2x234 = -1/2 *xmuv234t * inv(xmuv234co)* xmuv234 - 1.5 * log(2 *3.1416) - 0.5 * log(det(xmuv234co));
g1x234m(i,j,k) = g1x234;
g2x234m(i,j,k) = g2x234;
end
end
end




%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
for k=1:Rtr
if g1x234m(trainf2(i,1)*10,trainf3(j,1)*10,trainf4(k,1)*10)> g2x234m(trainf2(i,1)*10,trainf3(j,1)*10,trainf4(k,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end
end

accuracytr234 = true / (true +false)
accuracytrs234 = trues / (trues +falsev)
accuracytrv234 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte
for k=1:Rte
if g1x234m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(j,1))*10),(cell2mat(testf4(k,1))*10))> g2x234m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(j,1))*10),(cell2mat(testf4(k,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end
end

accuracyte234 = true / (true + false)
accuracytes234 = trues / (trues + falsev)
accuracytev234 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false

%%%%% 
%%%%%%%%

%%%%%%% Calculating the borderline equations for four features

Nx1234m=zeros(xr,xr,xr,xr);
Nxv1234m=zeros(xr,xr,xr,xr);
g1x1234m = zeros(xr,xr,xr,xr);
g2x1234m = zeros(xr,xr,xr,xr);
for i= 1:xr
for j= 1:xr
for k= 1:xr
for l= 1:xr
xmu1234 = [xt(i);xt(j);xt(k);xt(l)]-mu1234;
xmu1234t = xmu1234'; % transpose

xmuv1234 = [xt(i);xt(j);xt(k);xt(l)]-muv1234;
xmuv1234t = xmuv1234'; % transpose

%Nx1234 =  (1/((2 *3.1416).^2 * ((det(xmu1234co)).^0.5)))* exp(-1/2 *xmu1234t * inv(xmu1234co)* xmu1234)
%Nx1234m(i,j,k,l) = Nx1234; 
%Nxv1234 =  (1/((2 *3.1416).^2 * ((det(xmuv1234co)).^0.5)))* exp(-1/2 *xmuv1234t * inv(xmuv1234co)* xmuv1234)
%Nxv1234m(i,j,k,l) = Nxv1234; 
g1x1234 = -1/2 *xmu1234t * inv(xmu1234co)* xmu1234 - 2 * log(2 *3.1416) - 0.5 *log(det(xmu1234co));
g2x1234 = -1/2 *xmuv1234t * inv(xmuv1234co)* xmuv1234 - 2 * log(2 *3.1416) - 0.5 * log(det(xmuv1234co));
g1x1234m(i,j,k,l) = g1x1234;
g2x1234m(i,j,k,l) = g2x1234;
end
end
end
end


%%%%%%%%%%% Training & testing for four features
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
for j=1:Rtr
for k=1:Rtr
for l=1:Rtr 
if g1x1234m(trainf1(i,1)*10,trainf2(j,1)*10,trainf3(k,1)*10,trainf4(l,1)*10)> g2x1234m(trainf1(i,1)*10,trainf2(j,1)*10,trainf3(k,1)*10,trainf4(l,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
    else
        class = 'Iris-versicolor';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
    end 
end
end
end
end

accuracytr1234 = true / (true +false)
accuracytrs1234 = trues / (trues +falsev)
accuracytrv1234 = truev / (truev +falses)
%Repeat for testing set.


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
for j=1:Rte
for k=1:Rte
for l=1:Rte
if g1x1234m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10),(cell2mat(testf3(k,1))*10),(cell2mat(testf4(l,1))*10))> g2x1234m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(j,1))*10),(cell2mat(testf3(k,1))*10),(cell2mat(testf4(l,1))*10))
%if g1x12m(cell2mat((test(i,1)))*10)> g2x12m(cell2mat((test(i,1)))*10)
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
   else 
        class = 'Iris-versicolor';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            truev = truev+1;
        else
            false = false+1;
            falsev = falsev+1;
        end
end
end
end
end
end

accuracyte1234 = true / (true + false)
accuracytes1234 = trues / (trues + falsev)
accuracytev1234 = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
Rte
both = true + false

%%%%%


end
 