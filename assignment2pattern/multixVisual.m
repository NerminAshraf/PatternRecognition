function [ Ex1, Exv1 ] = multixVisual( b,c,f,p)


%Classifies the data with multiple features using the gaussian

%b and c are text files for setosa and versicolor respectively (the
%datasets)

%%f = 'specifies the combination of features being used it's mainly for
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


%In p value plot determines what plots to be drawn, 
%'g' outputs the g values as surface plots 'n' outputs the gaussian curves but for two features only. 'x' does nothing.


%This version is primiraly used in order to draw the ROC curve.


Ms =csvimport(b);
[Rs,Cs] = size(Ms);
f2s = Ms(1:34,1);   %select training set of feature 1
f2st = Ms(35:Rs,1); %select testing set of feature 2
f2s2 = Ms(1:34,2);   %select training set of feature 2
f2st2 = Ms(35:Rs,2); %select testing set of feature 2
f2s3 = Ms(1:34,3);   %select training set of feature 3
f2st3 = Ms(35:Rs,3); %select testing set of feature 3
f2s4 = Ms(1:34,4);   %select training set of feature 4
f2st4 = Ms(35:Rs,4); %select testing set of feature 4
cs = Ms(1:34,5);    %select training set of classes
cst = Ms(35:Rs,5);  %select testing set of classes


%Repeat the same process for versicolor dataset
Mv =csvimport(c);
[Rv,Cv] = size(Mv);
f2v = Mv(1:34,1); %training set
f2vt = Mv(35:Rv,1); %select one feature versicolor
f2v2 = Mv(1:34,2); %training set
f2vt2 = Mv(35:Rv,2); %select one feature versicolor
f2v3 = Mv(1:34,3); %training set
f2vt3 = Mv(35:Rv,3); %select one feature versicolor
f2v4 = Mv(1:34,4); %training set
f2vt4 = Mv(35:Rv,4); %select one feature versicolor
cv = Mv(1:34,5);
cvt = Mv(35:Rv,5);

%Convert sets into appropriate matrix format


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

x = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2];

%%%%%Calculated means for both classes and all four features.

totalx1 = 0;
for j = 1:34

totalx1 = totalx1 +  f22s(j);
end
Ex1 = totalx1/34;


totalx2 = 0;
for j = 1:34

totalx2 = totalx2 +  f22s2(j);
end
Ex2 = totalx2/34;

totalx3 = 0;
for j = 1:34

totalx3 = totalx3 +  f22s3(j);
end
Ex3 = totalx3/34;

totalx4 = 0;
for j = 1:34

totalx4 = totalx4 +  f22s4(j);
end
Ex4 = totalx4/34;


%%%%%%%

totalx1 = 0;
for j = 1:34

totalx1 = totalx1 +  f22v(j);
end
Exv1 = totalx1/34;

totalx2 = 0;
for j = 1:34

totalx2 = totalx2 +  f22v2(j);
end
Exv2 = totalx2/34;

totalx3 = 0;
for j = 1:34

totalx3 = totalx3 +  f22v3(j);
end
Exv3 = totalx3/34;

totalx4 = 0;
for j = 1:34

totalx4 = totalx4 +  f22v4(j);
end
Exv4 = totalx4/34;

%%%%%%%%%%
%Extra not used
%total1 = 0;
%for j = 1:34




%Nx12 =  (1/((2 *3.1416) * ((det(xmu12co)).^0.5)))* exp(-1/2 *xmu12t * inv(xmu12co)* xmu12)
%%%%%%%

%Calculate covariaces for both classes and multiple features.

mu12 = [Ex1;Ex2];
mu23 = [Ex2;Ex3];
mu13 = [Ex1;Ex3];
mu14 = [Ex1;Ex4];
mu24 = [Ex2;Ex4];
mu34 = [Ex3;Ex4];
mu123 = [Ex1;Ex2;Ex3];
mu124 = [Ex1;Ex2;Ex4];
mu134 = [Ex1;Ex3;Ex4];
mu234 = [Ex2;Ex3;Ex4];
mu1234 = [Ex1;Ex2;Ex3;Ex4];

xmu12sq = zeros(2);
for j = 1:34
xmu12 = [f22s(j)-Ex1;f22s2(j)-Ex2];
xmu12t = xmu12';
xmu12sq = xmu12sq + xmu12 * xmu12t;
end

xmu12co = xmu12sq/34;

%%%%%
xmu23sq = zeros(2); 
for i = 1:34
xmu23 = [f22s2(i)-Ex2;f22s3(i)-Ex3];
xmu23t = xmu23';
xmu23sq = xmu23sq + xmu23 * xmu23t;
end

xmu23co = xmu23sq/34;
%%%%%%

xmu13sq = zeros(2);
for i = 1:34
xmu13 = [f22s(i)-Ex1;f22s3(i)-Ex3];
xmu13t = xmu13';
xmu13sq = xmu13sq + xmu13 * xmu13t;
end

xmu13co = xmu13sq/34;
%%%%%%%


xmu14sq = zeros(2);
for i = 1:34
xmu14 = [f22s(i)-Ex1;f22s4(i)-Ex4];
xmu14t = xmu14';
xmu14sq = xmu14sq + xmu14 * xmu14t;
end

xmu14co = xmu14sq/34;

%%%%%%%
xmu24sq = zeros(2);
for i = 1:34
xmu24 = [f22s2(i);f22s4(i)]- mu24;
xmu24t = xmu24';
xmu24sq = xmu24sq + xmu24 * xmu24t;
end
xmu24co = xmu24sq/34;

%%%%%%%
mu34 = [Ex3;Ex4];
xmu34sq = zeros(2);
for i = 1:34
xmu34 = [f22s3(i);f22s4(i)]- mu34;
xmu34t = xmu34';
xmu34sq = xmu34sq + xmu34 * xmu34t;
end
xmu34co = xmu34sq/34;

%%%%%%

xmu123sq = zeros(3);
for i = 1:34
xmu123 = [f22s(i)-Ex1;f22s2(i)-Ex2;f22s3(i)-Ex3];
xmu123t = xmu123';
xmu123sq = xmu123sq + xmu123 * xmu123t;
end

xmu123co = xmu123sq/34;

%%%%%%
xmu124sq = zeros(3);
for i = 1:34
xmu124 = [f22s(i)-Ex1;f22s2(i)-Ex2;f22s4(i)-Ex4];
xmu124t = xmu124';
xmu124sq = xmu124sq + xmu124 * xmu124t;
end

xmu124co = xmu124sq/34;
%%%%%


xmu134sq = zeros(3);
for i = 1:34
xmu134 = [f22s(i)-Ex1;f22s3(i)-Ex3;f22s4(i)-Ex4];
xmu134t = xmu134';
xmu134sq = xmu134sq + xmu134 * xmu134t;
end

xmu134co = xmu134sq/34;

%%%%%%%%

xmu234sq = zeros(3);
for i = 1:34
xmu234 = [f22s2(i)-Ex2;f22s3(i)-Ex3;f22s4(i)-Ex4];
xmu234t = xmu234';
xmu234sq = xmu234sq + xmu234 * xmu234t;
end

xmu234co = xmu234sq/34;

%%%%%%

xmu1234sq = zeros(4);
for i = 1:34
xmu1234 = [f22s(i)-Ex1;f22s2(i)-Ex2;f22s3(i)-Ex3;f22s4(i)-Ex4];
xmu1234t = xmu1234';
xmu1234sq = xmu1234sq + xmu1234 * xmu1234t;
end

xmu1234co = xmu1234sq/34;

%%%%%%%%

%%%%%%%%
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
xmuv23t = xmuv23';
xmuv23sq = xmuv23sq + xmuv23 * xmuv23t;
end

xmuv23co = xmuv23sq/34;
%%%%%%

xmuv13sq = zeros(2);
for i = 1:34
xmuv13 = [f22v(i);f22v3(i)]-muv13;
xmuv13t = xmuv13';
xmuv13sq = xmuv13sq + xmuv13 * xmuv13t;
end

xmuv13co = xmuv13sq/34;
%%%%%%%


xmuv14sq = zeros(2);
for i = 1:34
xmuv14 = [f22v(i);f22v4(i)]-muv14;
xmuv14t = xmuv14';
xmuv14sq = xmuv14sq + xmuv14 * xmuv14t;
end

xmuv14co = xmuv14sq/34;

%%%%%%%
xmuv24sq = zeros(2);
for i = 1:34
xmuv24 = [f22v2(i);f22v4(i)]-muv24;
xmuv24t = xmuv24';
xmuv24sq = xmuv24sq + xmuv24 * xmuv24t;
end

xmuv24co = xmuv24sq/34;
%%%%%%%

xmuv34sq = zeros(2);
for i = 1:34
xmuv34 = [f22v3(i);f22v4(i)]-muv34;
xmuv34t = xmuv34';
xmuv34sq = xmuv34sq + xmuv34 * xmuv34t;
end

xmuv34co = xmuv34sq/34;
%%%%%%



xmuv123sq = zeros(3);
for i = 1:34
xmuv123 = [f22v(i);f22v2(i);f22v3(i)]- muv123;
xmuv123t = xmuv123';
xmuv123sq = xmuv123sq + xmuv123 * xmuv123t;
end

xmuv123co = xmuv123sq/34;

%%%%%%
xmuv124sq = zeros(3);
for i = 1:34
xmuv124 = [f22v(i);f22v2(i);f22v4(i)]-muv124;
xmuv124t = xmuv124';
xmuv124sq = xmuv124sq + xmuv124 * xmuv124t;
end

xmuv124co = xmuv124sq/34;
%%%%%


xmuv134sq = zeros(3);
for i = 1:34
xmuv134 = [f22v(i);f22v3(i);f22v4(i)]-muv134;
xmuv134t = xmuv134';
xmuv134sq = xmuv134sq + xmuv134 * xmuv134t;
end

xmuv134co = xmuv134sq/34;

%%%%%%%%

xmuv234sq = zeros(3);
for i = 1:34
xmuv234 = [f22v2(i);f22v3(i);f22v4(i)]- muv234;
xmuv234t = xmuv234';
xmuv234sq = xmuv234sq + xmuv234 * xmuv234t;
end

xmuv234co = xmuv234sq/34;

%%%%%%

xmuv1234sq = zeros(4);
for i = 1:34
xmuv1234 = [f22v(i);f22v2(i);f22v3(i);f22v4(i)]-muv1234;
xmuv1234t = xmuv1234';
xmuv1234sq = xmuv1234sq + xmuv1234 * xmuv1234t;
end

xmuv1234co = xmuv1234sq/34;

%%%%%%%%Create g(x) for features 1 and 2

xt = x';
[xr,xc] = size(xt);


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

Nx12 =  (1/((2 *3.1416) * ((det(xmu12co)).^0.5)))* exp(-1/2 *xmu12t * inv(xmu12co)* xmu12);
Nx12m(i,j) = Nx12; 
Nxv12 =  (1/((2 *3.1416) * ((det(xmuv12co)).^0.5)))* exp(-1/2 *xmuv12t * inv(xmuv12co)* xmuv12);
Nxv12m(i,j) = Nxv12; 
g1x12 = -1/2 *xmu12t * inv(xmu12co)* xmu12 - log(2 *3.1416) - 0.5 *log(det(xmu12co));
g2x12 = -1/2 *xmuv12t * inv(xmuv12co)* xmuv12 - log(2 *3.1416) - 0.5 * log(det(xmuv12co));
g1x12m(i,j) = g1x12;
g2x12m(i,j) = g2x12;
end
end


b12 = g1x12m - g2x12m;
xs = zeros(xr,1);
b12> -1.5;
b12r1 = ans;
b12 < 1.5;
b12r2 = ans;
b12r1.*b12r2;

b12r3 = ans;

y = x;
[X,Y] = meshgrid(x,y);

if p == 'n' && f == 12
%Plot the gaussian distribution for surfaces 1 and 2
surf(X,Y,Nx12m);
hold on
surf(X,Y,Nxv12m);
elseif p == 'g' && f == 12
%Plot the gi(x) function for surfaces 1 and 2
surf(X,Y,g1x12m);
hold on
surf(X,Y,g2x12m);
end

%Starting two more features.


%Making the training and testing sets.
%%%%%%%%%

trainf1 = vertcat(f22s,f22v);  %training set
testf1 = vertcat(f2st,f2vt); %testing set

trainf2 = vertcat(f22s2,f22v2);  %training set
testf2 = vertcat(f2st2,f2vt2); %testing set

trainf3 = vertcat(f22s3,f22v3);  %training set
testf3 = vertcat(f2st3,f2vt3); %testing set

trainf4 = vertcat(f22s4,f22v4);  %training set
testf4 = vertcat(f2st4,f2vt4); %testing set

trainc = vertcat(cs,cv);  %training set % same for all the classes
testc = vertcat(cst,cvt); %testing set

[Rtr,Ctr] = size(trainf1);
[Rte,Cte] = size(testf1);


if (f == 12)
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
%for j=1:Rtr  %CHANGED Find the training set by checking of the matrix for
%setosa is greater than that of versicolor, decide setosa otherwise
%versicolor
if g1x12m(trainf1(i,1)*10,trainf2(i,1)*10)> g2x12m(trainf1(i,1)*10,trainf2(i,1)*10)
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else;
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
%end

accuracytr12 = true / (true +false);
accuracytrs12 = trues / (trues +falsev);
accuracytrv12 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 1 and 2, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr12* 100);

S12tr = 'The training accuracy for class setosa is: ';
disp(S12tr); disp(accuracytrs12* 100);

S12tr = 'The training accuracy for class versicolor is: '; 
disp(S12tr); disp(accuracytrv12* 100);

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED
%Repeat for the testing set
if g1x12m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10))> g2x12m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10))
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
%end
%end

accuracyte12 = true / (true + false);
accuracytes12 = trues / (trues + falsev);
accuracytev12 = truev / (truev + falses);


S12tr = 'For features 1 and 2, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte12* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes12* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev12* 100);

end

%%%%%%%%
if f == 13     %Repeat the process of testing and training for other features.
%%%%%%%%
Nx13m=zeros(xr);
Nxv13m=zeros(xr);
g1x13m = zeros(xr);
g2x13m = zeros(xr);
for i= 1:xr
for j= 1:xr
xmu13 = [xt(i)-Ex1;xt(j)-Ex3];
xmu13t = xmu13'; % transpose

xmuv13 = [xt(i)-Exv1;xt(j)-Exv3];
xmuv13t = xmuv13'; % transpose

Nx13 =  (1/((2 *3.1416) * ((det(xmu13co)).^0.5)))* exp(-1/2 *xmu13t * inv(xmu13co)* xmu13);
Nx13m(i,j) = Nx13; 
Nxv13 =  (1/((2 *3.1416) * ((det(xmuv13co)).^0.5)))* exp(-1/2 *xmuv13t * inv(xmuv13co)* xmuv13);
Nxv13m(i,j) = Nxv13; 
g1x13 = -1/2 *xmu13t * inv(xmu13co)* xmu13 - log(2 *3.1416) - 0.5 *log(det(xmu13co));
g2x13 = -1/2 *xmuv13t * inv(xmuv13co)* xmuv13 - log(2 *3.1416) - 0.5 * log(det(xmuv13co));
g1x13m(i,j) = g1x13;
g2x13m(i,j) = g2x13;
end
end


%Nx13m > Nxv13m
Nx13compare = ans;

if p == 'n'
%Plot the gaussian distribution for surfaces 1 and 2
surf(X,Y,Nx13m);
hold on
surf(X,Y,Nxv13m);
elseif p == 'g'
%Plot the gi(x) function for surfaces 1 and 2
surf(X,Y,g1x13m);
hold on
surf(X,Y,g2x13m);
end
%%%%%
%Making the training and testing sets.
%%%%%%%%%


b13 = g1x13m - g2x13m;
%xs = zeros(xr,1)
b13> -1.5;
b13r1 = ans;
b13 < 1.5;
b13r2 = ans;
b13r1.*b12r2;

b13r3 = ans;




%g1x12m
%g2x13m
y = x;
[X,Y] = meshgrid(x,y);

%surf(X,Y,b13r3);




class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
%for j=1:Rtr    %CHANGED
%if g1x13m(trainf1(i,1)*10,trainf3(j,1)*10)> g2x13m(trainf1(i,1)*10,trainf3(j,1)*10)
%if (Nx13compare(trainf1(i,1)*10,trainf3(j,1)*10) == 1)
if ( b13(trainf1(i,1)*10,trainf3(i,1)*10) > 1.5)
     %b13(trainf1(i,1)*10,trainf3(i,1)*10)  
    class = 'Iris-setosa';

        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    
elseif ( b13(trainf1(i,1)*10,trainf3(i,1)*10) < -1.5)
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
%end

accuracytr13 = true / (true +false);
accuracytrs13 = trues / (trues +falsev);
accuracytrv13 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 1 and 3, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr13* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs13* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv13* 100);


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte %CHANGED

if g1x13m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(i,1))*10))> g2x13m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(i,1))*10))
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
%end

accuracyte13 = true / (true + false);
accuracytes13 = trues / (trues + falsev);
accuracytev13 = truev / (truev + falses);

S12tr = 'For features 1 and 3, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte13* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes13* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev13* 100);


end
%%%%%%%
if f ==14
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

Nx14 =  (1/((2 *3.1416) * ((det(xmu14co)).^0.5)))* exp(-1/2 *xmu14t * inv(xmu14co)* xmu14);
Nx14m(i,j) = Nx14; 
Nxv14 =  (1/((2 *3.1416) * ((det(xmuv14co)).^0.5)))* exp(-1/2 *xmuv14t * inv(xmuv14co)* xmuv14);
Nxv14m(i,j) = Nxv14; 
g1x14 = -1/2 *xmu14t * inv(xmu14co)* xmu14 - log(2 *3.1416) - 0.5 *log(det(xmu14co));
g2x14 = -1/2 *xmuv14t * inv(xmuv14co)* xmuv14 - log(2 *3.1416) - 0.5 * log(det(xmuv14co));
g1x14m(i,j) = g1x14;
g2x14m(i,j) = g2x14;
end
end

if (p == 'n')
%Plot the gaussian distribution for surfaces 1 and 2
surf(X,Y,Nx14m);
hold on
surf(X,Y,Nxv14m);
elseif (p == 'g')
%Plot the gi(x) function for surfaces 1 and 2
surf(X,Y,g1x14m);
hold on
surf(X,Y,g2x14m);
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
%for j=1:Rtr    %CHANGED
if g1x14m(trainf1(i,1)*10,trainf4(i,1)*10)> g2x14m(trainf1(i,1)*10,trainf4(i,1)*10)
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
%end

accuracytr14 = true / (true +false);
accuracytrs14 = trues / (trues +falsev);
accuracytrv14 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 1 and 4, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr14* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs14* 100);

S12tr = 'The training accuracy for class versicolor is: '; 
disp(S12tr); disp(accuracytrv14* 100);



class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED

if g1x14m((cell2mat(testf1(i,1))*10),(cell2mat(testf4(i,1))*10))> g2x14m((cell2mat(testf1(i,1))*10),(cell2mat(testf4(i,1))*10))
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
%end




accuracyte14 = true / (true + false);
accuracytes14 = trues / (trues + falsev);
accuracytev14 = truev / (truev + falses);

S12tr = 'For features 1 and 4, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte14* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes14* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev14* 100);

end
%%%%%
if f == 23
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

Nx23 =  (1/((2 *3.1416) * ((det(xmu23co)).^0.5)))* exp(-1/2 *xmu23t * inv(xmu23co)* xmu23);
Nx23m(i,j) = Nx23; 
Nxv23 =  (1/((2 *3.1416) * ((det(xmuv23co)).^0.5)))* exp(-1/2 *xmuv23t * inv(xmuv23co)* xmuv23);
Nxv23m(i,j) = Nxv23; 
g1x23 = -1/2 *xmu23t * inv(xmu23co)* xmu23 - log(2 *3.1416) - 0.5 *log(det(xmu23co));
g2x23 = -1/2 *xmuv23t * inv(xmuv23co)* xmuv23 - log(2 *3.1416) - 0.5 * log(det(xmuv23co));
g1x23m(i,j) = g1x23;
g2x23m(i,j) = g2x23;
end
end

if p == 'n'
%Plot the gaussian distribution for surfaces 1 and 2
surf(X,Y,Nx23m);
hold on
surf(X,Y,Nxv23m);

elseif p == 'g'
%Plot the gi(x) function for surfaces 1 and 2
surf(X,Y,g1x23m);
hold on
surf(X,Y,g2x23m);
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
%for j=1:Rtr %CHANGED
if g1x23m(trainf2(i,1)*10,trainf3(i,1)*10)> g2x23m(trainf2(i,1)*10,trainf3(i,1)*10)
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
%end

accuracytr23 = true / (true +false);
accuracytrs23 = trues / (trues +falsev);
accuracytrv23 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 2 and 3, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr23* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs23* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv23* 100);

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED

if g1x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))> g2x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))
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
%end

accuracyte23 = true / (true + false);
accuracytes23 = trues / (trues + falsev);
accuracytev23 = truev / (truev + falses);

S12tr = 'For features 2 and 3, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte23* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes23* 100);

S12tr = 'The testing accuracy class versicolor is: ';
disp(S12tr); disp(accuracytev23* 100);



if p == 'r'

g12x23m = g1x23m-g2x23m;
ming1g2 = min(g12x23m);
ming1g2 = min(ming1g2);
maxg1g2 = max(g12x23m);
maxg1g2 = max(maxg1g2);
ming1g2 = floor(ming1g2);
maxg1g2 = ceil(maxg1g2);

inc = (maxg1g2-ming1g2)/30; %the increments to use.


thresh = ming1g2;

for j=1:30



class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED

%g1x23 = -1/2 *xmu23t * inv(xmu23co)* xmu23 - log(2 *3.1416) - 0.5 *log(det(xmu23co));
%g2x23 = -1/2 *xmuv23t * inv(xmuv23co)* xmuv23 - log(2 *3.1416) - 0.5 * log(det(xmuv23co));
g12 = g1x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))- g2x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10));

if g12 > thresh 
%if g1x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))> g2x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))
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
%end

tpr(j) = trues / (trues + falsev);
fpr(j) = falses/ (falses + truev);

thresh = thresh + inc;


%accuracyte23 = true / (true + false);
%accuracytes23 = trues / (trues + falsev);
%accuracytev23 = truev / (truev + falses);



end

plot (fpr,tpr);
title('ROC curve. The true positive rate is based on class setosa');
xlabel('False positive rate'); % x-axis label
ylabel('True  positive rate'); % y-axis label
end
end




%%%%%%%
if f == 24
%%%%%%%%
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

Nx24 =  (1/((2 *3.1416) * ((det(xmu24co)).^0.5)))* exp(-1/2 *xmu24t * inv(xmu24co)* xmu24);
Nx24m(i,j) = Nx24; 
Nxv24 =  (1/((2 *3.1416) * ((det(xmuv24co)).^0.5)))* exp(-1/2 *xmuv24t * inv(xmuv24co)* xmuv24);
Nxv24m(i,j) = Nxv24; 
g1x24 = -1/2 *xmu24t * inv(xmu24co)* xmu24 - log(2 *3.1416) - 0.5 *log(det(xmu24co));
g2x24 = -1/2 *xmuv24t * inv(xmuv24co)* xmuv24 - log(2 *3.1416) - 0.5 * log(det(xmuv24co));
g1x24m(i,j) = g1x24;
g2x24m(i,j) = g2x24;
end
end

if p == 'n'
%Plot the gaussian distribution for surfaces 1 and 2
surf(X,Y,Nx24m);
hold on
surf(X,Y,Nxv24m);
elseif p == 'g'
%Plot the gi(x) function for surfaces 1 and 2
surf(X,Y,g1x24m);
hold on
surf(X,Y,g2x24m);
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
%for j=1:Rtr  %CHANGED
if g1x24m(trainf2(i,1)*10,trainf4(i,1)*10)> g2x24m(trainf2(i,1)*10,trainf4(i,1)*10)
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
%end

accuracytr24 = true / (true +false);
accuracytrs24 = trues / (trues +falsev);
accuracytrv24 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 2 and 4, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr24* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs24* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv24* 100);


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte   %CHANGED

if g1x24m((cell2mat(testf2(i,1))*10),(cell2mat(testf4(i,1))*10))> g2x24m((cell2mat(testf2(i,1))*10),(cell2mat(testf4(i,1))*10))
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
%end

accuracyte24 = true / (true + false);
accuracytes24 = trues / (trues + falsev);
accuracytev24 = truev / (truev + falses);


S12tr = 'For testing features 2 and 4, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte24* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes24* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev24* 100);

if p == 'r'

g12x24m = g1x24m-g2x24m;
ming1g2 = min(g12x24m);
ming1g2 = min(ming1g2);
maxg1g2 = max(g12x24m);
maxg1g2 = max(maxg1g2);
ming1g2 = floor(ming1g2);
maxg1g2 = ceil(maxg1g2);

inc = (maxg1g2-ming1g2)/30; %the increments to use.


thresh = ming1g2;

for j=1:30



class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED

%g1x23 = -1/2 *xmu23t * inv(xmu23co)* xmu23 - log(2 *3.1416) - 0.5 *log(det(xmu23co));
%g2x23 = -1/2 *xmuv23t * inv(xmuv23co)* xmuv23 - log(2 *3.1416) - 0.5 * log(det(xmuv23co));
g12 = g1x24m((cell2mat(testf2(i,1))*10),(cell2mat(testf4(i,1))*10))- g2x24m((cell2mat(testf2(i,1))*10),(cell2mat(testf4(i,1))*10));

if g12 > thresh 
%if g1x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))> g2x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))
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
%end

tpr(j) = trues / (trues + falsev);
fpr(j) = falses/ (falses + truev);

thresh = thresh + inc;


%accuracyte23 = true / (true + false);
%accuracytes23 = trues / (trues + falsev);
%accuracytev23 = truev / (truev + falses);


end

plot (fpr,tpr);
title('ROC curve. The true positive rate is based on class setosa');
xlabel('False positive rate'); % x-axis label
ylabel('True  positive rate'); % y-axis label







end

end
%%%%%%%
if f == 34
%%%%%%
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

Nx34 =  (1/((2 *3.1416) * ((det(xmu34co)).^0.5)))* exp(-1/2 *xmu34t * inv(xmu34co)* xmu34);
Nx34m(i,j) = Nx34; 
Nxv34 =  (1/((2 *3.1416) * ((det(xmuv34co)).^0.5)))* exp(-1/2 *xmuv34t * inv(xmuv34co)* xmuv34);
Nxv34m(i,j) = Nxv34; 
g1x34 = -1/2 *xmu34t * inv(xmu34co)* xmu34 - log(2 *3.1416) - 0.5 *log(det(xmu34co));
g2x34 = -1/2 *xmuv34t * inv(xmuv34co)* xmuv34 - log(2 *3.1416) - 0.5 * log(det(xmuv34co));
g1x34m(i,j) = g1x34;
g2x34m(i,j) = g2x34;
end
end

if p == 'n'
%Plot the gaussian distribution for surfaces 1 and 2
surf(X,Y,Nx34m);
hold on
surf(X,Y,Nxv34m);
elseif p == 'g'
%Plot the gi(x) function for surfaces 1 and 2
surf(X,Y,g1x34m);
hold on
surf(X,Y,g2x34m);
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
%for j=1:Rtr    %CHANGED
if g1x34m(trainf3(i,1)*10,trainf4(i,1)*10)> g2x34m(trainf3(i,1)*10,trainf4(i,1)*10)
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
%end

accuracytr34 = true / (true +false);
accuracytrs34 = trues / (trues +falsev);
accuracytrv34 = truev / (truev +falses);
%Repeat for testing set.
S12tr = 'For features 3 and 4, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr34* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs34* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv34* 100);


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte %Changed

if g1x34m((cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))> g2x34m((cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))
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
%end
accuracyte34 = true / (true + false);
accuracytes34 = trues / (trues + falsev);
accuracytev34 = truev / (truev + falses);

S12tr = 'For features 3 and 4, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte34* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes34* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev34* 100);


%if strcmp(c,'ROC')
if p == 'r'
g12x34m = g1x34m-g2x34m;
ming1g2 = min(g12x34m);
ming1g2 = min(ming1g2);
maxg1g2 = max(g12x34m);
maxg1g2 = max(maxg1g2);
ming1g2 = floor(ming1g2);
maxg1g2 = ceil(maxg1g2);

inc = (maxg1g2-ming1g2)/30; %the increments to use.


thresh = ming1g2;

for j=1:30



class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED

%g1x23 = -1/2 *xmu23t * inv(xmu23co)* xmu23 - log(2 *3.1416) - 0.5 *log(det(xmu23co));
%g2x23 = -1/2 *xmuv23t * inv(xmuv23co)* xmuv23 - log(2 *3.1416) - 0.5 * log(det(xmuv23co));
g12 = g1x34m((cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))- g2x34m((cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10));

if g12 > thresh 
%if g1x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))> g2x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))
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
%end

tpr(j) = trues / (trues + falsev);
fpr(j) = falses/ (falses + truev);

thresh = thresh + inc;


%accuracyte23 = true / (true + false);
%accuracytes23 = trues / (trues + falsev);
%accuracytev23 = truev / (truev + falses);



end

plot (fpr,tpr);
title('ROC curve. The true positive rate is based on class setosa');
xlabel('False positive rate'); % x-axis label
ylabel('True  positive rate'); % y-axis label




end
end
%%%%%%%
if f == 123 
%%%%%
load = 'loading results';
disp(load)
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

%Nx123 =  (1/((2 *3.1416).^1.5 * ((det(xmu123co)).^0.5)))* exp(-1/2 *xmu123t * inv(xmu123co)* xmu123);
%Nx123m(i,j,k) = Nx123; 
%Nxv123 =  (1/((2 *3.1416).^1.5 * ((det(xmuv123co)).^0.5)))* exp(-1/2 *xmuv123t * inv(xmuv123co)* xmuv123);
%Nxv123m(i,j,k) = Nxv123; 
g1x123 = -1/2 *xmu123t * inv(xmu123co)* xmu123 - 1.5*log(2 *3.1416) - 0.5 *log(det(xmu123co));
g2x123 = -1/2 *xmuv123t * inv(xmuv123co)* xmuv123 - 1.5*log(2 *3.1416) - 0.5 * log(det(xmuv123co));
g1x123m(i,j,k) = g1x123;
g2x123m(i,j,k) = g2x123;
end
end
end

%g1x123m
%g2x123m
%xmu123co
%xmuv123co
%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx34m);
%hold on
%surf(X,Y,Nxv34m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x123m);
%hold on
%surf(X,Y,g2x123m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
%for j=1:Rtr   %CHANGED
%for k=1:Rtr   %CHANGED
if g1x123m(trainf1(i,1)*10,trainf2(i,1)*10,trainf3(i,1)*10)> g2x123m(trainf1(i,1)*10,trainf2(i,1)*10,trainf3(i,1)*10)
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
%end
%end

accuracytr123 = true / (true +false);
accuracytrs123 = trues / (trues +falsev);
accuracytrv123 = truev / (truev +falses);
%Repeat for testing set.
S12tr = 'For features 1,2 and 3, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr123* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs123* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv123* 100);


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte   %CHANGED
%for k=1:Rte   %CHANGED
if g1x123m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))> g2x123m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))
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
%end
%end

accuracyte123 = true / (true + false);
accuracytes123 = trues / (trues + falsev);
accuracytev123 = truev / (truev + falses);

S12tr = 'For features 1,2 and 3, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte123* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes123* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev123* 100);



%if strcmp(c,'ROC')
if p == 'r'
g12x123m = g1x123m-g2x123m;
ming1g2 = min(g12x123m);
ming1g2 = min(ming1g2);
ming1g2 = min(ming1g2);
maxg1g2 = max(g12x123m);
maxg1g2 = max(maxg1g2);
maxg1g2 = max(maxg1g2);
ming1g2 = floor(ming1g2);
maxg1g2 = ceil(maxg1g2);

inc = (maxg1g2-ming1g2)/30; %the increments to use.


thresh = ming1g2;

for j=1:30



class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED

%g1x23 = -1/2 *xmu23t * inv(xmu23co)* xmu23 - log(2 *3.1416) - 0.5 *log(det(xmu23co));
%g2x23 = -1/2 *xmuv23t * inv(xmuv23co)* xmuv23 - log(2 *3.1416) - 0.5 * log(det(xmuv23co));
g12 = g1x123m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))- g2x123m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10));

if g12 > thresh 
%if g1x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))> g2x23m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10))
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
%end

tpr(j) = trues / (trues + falsev);
fpr(j) = falses/ (falses + truev);

thresh = thresh + inc;


%accuracyte23 = true / (true + false);
%accuracytes23 = trues / (trues + falsev);
%accuracytev23 = truev / (truev + falses);



end

plot (fpr,tpr);
title('ROC curve. The true positive rate is based on class setosa');
xlabel('False positive rate'); % x-axis label
ylabel('True  positive rate'); % y-axis label





end
end
%%%
if f == 124
%%%%%%%
disp('loading results')
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


%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx34m);
%hold on
%surf(X,Y,Nxv34m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x123m);
%hold on
%surf(X,Y,g2x123m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
%for j=1:Rtr   %CHANGED
%for k=1:Rtr   %CHANGED
if g1x124m(trainf1(i,1)*10,trainf2(i,1)*10,trainf4(i,1)*10)> g2x124m(trainf1(i,1)*10,trainf2(i,1)*10,trainf4(i,1)*10)
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
%end
%end

accuracytr124 = true / (true +false);
accuracytrs124 = trues / (trues +falsev);
accuracytrv124 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 1,2 and 4, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr124* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs124* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv124* 100);


class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte   
%for j=1:Rte   %CHANGED
%for k=1:Rte   %CHANGED
if g1x124m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf4(i,1))*10))> g2x124m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf4(i,1))*10))
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
%end
%end

accuracyte124 = true / (true + false);
accuracytes124 = trues / (trues + falsev);
accuracytev124 = truev / (truev + falses);


S12tr = 'For features 1,2 and 4, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte124* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes124* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev124* 100);

end 
%%%
if f == 134 
%%%%%%%
disp('loading results')
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


%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx34m);
%hold on
%surf(X,Y,Nxv34m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x123m);
%hold on
%surf(X,Y,g2x123m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
%for j=1:Rtr  %CHANGED
%for k=1:Rtr  %CHANGED
if g1x134m(trainf1(i,1)*10,trainf3(i,1)*10,trainf4(i,1)*10)> g2x134m(trainf1(i,1)*10,trainf3(i,1)*10,trainf4(i,1)*10)
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
%end
%end

accuracytr134 = true / (true +false);
accuracytrs134 = trues / (trues +falsev);
accuracytrv134 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 1,3 and 4, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr134* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs134* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv134* 100);




class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte   %CHANGED
if g1x134m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))> g2x134m((cell2mat(testf1(i,1))*10),(cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))
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
%end
%end

accuracyte134 = true / (true + false);
accuracytes134 = trues / (trues + falsev);
accuracytev134 = truev / (truev + falses);


S12tr = 'For features 1,3 and 4, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte134* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes134* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev134* 100);

end
%%%%%
if f == 234
%%%%%%%
disp('loading results')

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


%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx34m);
%hold on
%surf(X,Y,Nxv34m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x123m);
%hold on
%surf(X,Y,g2x123m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;


for i=1:Rtr
%for j=1:Rtr %CHANGED
%for k=1:Rtr %CHANGED
if g1x234m(trainf2(i,1)*10,trainf3(i,1)*10,trainf4(i,1)*10)> g2x234m(trainf2(i,1)*10,trainf3(i,1)*10,trainf4(i,1)*10)
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
%end
%end

accuracytr234 = true / (true +false);
accuracytrs234 = trues / (trues +falsev);
accuracytrv234 = truev / (truev +falses);
%Repeat for testing set.

S12tr = 'For features 2,3 and 4, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr234* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs234* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv234* 100);



class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte %CHANGED
%for k=1:Rte %CHANGED
if g1x234m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))> g2x234m((cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))
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
%end
%end
%end

accuracyte234 = true / (true + false);
accuracytes234 = trues / (trues + falsev);
accuracytev234 = truev / (truev + falses);

S12tr = 'For features 2,3 and 4, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte234* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes234* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev234* 100);


end
%%%%%
if f == 1234
%%%%%%%

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


g1x1234 = -1/2 *xmu1234t * inv(xmu1234co)* xmu1234 - 2 * log(2 *3.1416) - 0.5 *log(det(xmu1234co));
g2x1234 = -1/2 *xmuv1234t * inv(xmuv1234co)* xmuv1234 - 2 * log(2 *3.1416) - 0.5 * log(det(xmuv1234co));
g1x1234m(i,j,k,l) = g1x1234;
g2x1234m(i,j,k,l) = g2x1234;
end
end
end
end


%Plot the gaussian distribution for surfaces 1 and 2
%surf(X,Y,Nx34m);
%hold on
%surf(X,Y,Nxv34m);

%Plot the gi(x) function for surfaces 1 and 2
%surf(X,Y,g1x123m);
%hold on
%surf(X,Y,g2x123m);

%%%%%%%%%%%
class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
%for j=1:Rtr %CHANGED
%for k=1:Rtr %CHANGED
%for l=1:Rtr %CHANGED
if g1x1234m(trainf1(i,1)*10,trainf2(i,1)*10,trainf3(i,1)*10,trainf4(i,1)*10)> g2x1234m(trainf1(i,1)*10,trainf2(i,1)*10,trainf3(i,1)*10,trainf4(i,1)*10)
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
%end
%end
%end

accuracytr1234 = true / (true +false)
accuracytrs1234 = trues / (trues +falsev)
accuracytrv1234 = truev / (truev +falses)

%Repeat for testing set.
S12tr = 'For features 1,2,3 and 4, the overall training accuracy is: '; 
disp(S12tr); disp(accuracytr1234* 100);

S12tr = 'The training accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytrs1234* 100);

S12tr = 'The training accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytrv1234* 100);

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
%for j=1:Rte  %CHANGED
%for k=1:Rte  %CHANGED
%for l=1:Rte  %CHANGED
if g1x1234m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))> g2x1234m((cell2mat(testf1(i,1))*10),(cell2mat(testf2(i,1))*10),(cell2mat(testf3(i,1))*10),(cell2mat(testf4(i,1))*10))
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
%end
%end
%end

accuracyte1234 = true / (true + false);
accuracytes1234 = trues / (trues + falsev);
accuracytev1234 = truev / (truev + falses);

S12tr = 'For features 1,2,3 and 4, the overall testing accuracy is: '; 
disp(S12tr); disp(accuracyte1234* 100);

S12tr = 'The testing accuracy for class setosa is: ' ;
disp(S12tr); disp(accuracytes1234* 100);

S12tr = 'The testing accuracy class versicolor is: '; 
disp(S12tr); disp(accuracytev1234* 100);
end
%%%%%


end
 