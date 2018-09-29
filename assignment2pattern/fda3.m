function [ Ex1, Exv1 ] = fda3(s,v,f,c)

%Performs linear discriminant analysis on the iris dataset


% s- setosa dataset
% v- versicolor dataset

%curves that can be drawn are specified using the c argument.
% c = 'ROC' draws an ROC curve
% c = 'n' draws the gaussian curves using the training set.
% c = 'g' draws the gaussian curves using the training set.
% c = 'gm' draws the difference of the curves using the training set.

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


fvvt4
fvt4



x = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2];

%%%%%Calculated means for both classes and all four features.
%Calculating the mean for setosa.
totalx1 = 0;
for j = 1:34

totalx1 = totalx1 +  fss(j);
end
Ex1 = totalx1/34;


totalx2 = 0;
for j = 1:34

totalx2 = totalx2 +  fss2(j);
end
Ex2 = totalx2/34;

totalx3 = 0;
for j = 1:34

totalx3 = totalx3 +  fss3(j);
end
Ex3 = totalx3/34;

totalx4 = 0;
for j = 1:34

totalx4 = totalx4 +  fss4(j);
end
Ex4 = totalx4/34;


%%%%%%%
%Calculating the means for versicolor
totalx1 = 0;
for j = 1:34

totalx1 = totalx1 +  fvv(j);
end
Exv1 = totalx1/34;



totalx2 = 0;




for j = 1:34

totalx2 = totalx2 +  fvv2(j);
end
Exv2 = totalx2/34;

totalx3 = 0;
for j = 1:34

totalx3 = totalx3 +  fvv3(j);
end
Exv3 = totalx3/34;

totalx4 = 0;
for j = 1:34

totalx4 = totalx4 +  fvv4(j);
end
Exv4 = totalx4/34;




%Assign the means for more than one features
%Mu means mean, and the numbers represents the features being used.
%The following values were calculated for class setosa


mu12 = [Ex1;Ex2];   %Means for features 1 and 2
mu23 = [Ex2;Ex3];   %Means for features 2 and 3
mu13 = [Ex1;Ex3];   
mu14 = [Ex1;Ex4];
mu24 = [Ex2;Ex4];
mu34 = [Ex3;Ex4];
mu123 = [Ex1;Ex2;Ex3];
mu124 = [Ex1;Ex2;Ex4];
mu134 = [Ex1;Ex3;Ex4];
mu234 = [Ex2;Ex3;Ex4];
mu1234 = [Ex1;Ex2;Ex3;Ex4];






%Calculate inbetween scatter matrices for both classes and multiple features.

%e.g. xmusq12 is the intbetween scatter matrix for features 1, and 2, and
%so forth. 

xmu12sq = zeros(2);
for j = 1:34
xmu12 = [fss(j)-Ex1;fss2(j)-Ex2];
xmu12t = xmu12';
xmu12sq = xmu12sq + xmu12 * xmu12t;
end
%xmu12co = xmu12sq/34;
%sw12 = xmu12sq(1) + xmu12sq(2);

%%%%%
xmu23sq = zeros(2); 
for i = 1:34
xmu23 = [fss2(i)-Ex2;fss3(i)-Ex3];
xmu23t = xmu23';
xmu23sq = xmu23sq + xmu23 * xmu23t;
end

%sw23 = xmu23sq(1) + xmu23sq(2);
%xmu23co = xmu23sq/34;
%%%%%%

xmu13sq = zeros(2);
for i = 1:34
xmu13 = [fss(i)-Ex1;fss3(i)-Ex3];
xmu13t = xmu13';
xmu13sq = xmu13sq + xmu13 * xmu13t;
end

%sw13 = xmu13sq(1) + xmu13sq(2);
%xmu13co = xmu13sq/34;
%%%%%%%


xmu14sq = zeros(2);
for i = 1:34
xmu14 = [fss(i)-Ex1;fss4(i)-Ex4];
xmu14t = xmu14';
xmu14sq = xmu14sq + xmu14 * xmu14t;
end

%sw14 = xmu14sq(1) + xmu14sq(2)

%xmu14co = xmu14sq/34;
%%%%%%%
xmu24sq = zeros(2);
for i = 1:34
xmu24 = [fss2(i);fss4(i)]- mu24;
xmu24t = xmu24';
xmu24sq = xmu24sq + xmu24 * xmu24t;
end
%xmu24co = xmu24sq/34;
%sw24 = xmu24sq(1) + xmu24sq(2);
%%%%%%%
mu34 = [Ex3;Ex4];
xmu34sq = zeros(2);
for i = 1:34
xmu34 = [fss3(i);fss4(i)]- mu34;
xmu34t = xmu34';
xmu34sq = xmu34sq + xmu34 * xmu34t;
end
%xmu34co = xmu34sq/34;
%sw34 = xmu34sq(1) + xmu34sq(2);
%%%%%%

xmu123sq = zeros(3);
for i = 1:34
xmu123 = [fss(i)-Ex1;fss2(i)-Ex2;fss3(i)-Ex3];
xmu123t = xmu123';
xmu123sq = xmu123sq + xmu123 * xmu123t;
end
%sw123 = xmu123sq(1) + xmu123sq(2) + xmu123sq(3);
%xmu123co = xmu123sq/34;

%%%%%%
xmu124sq = zeros(3);
for i = 1:34
xmu124 = [fss(i)-Ex1;fss2(i)-Ex2;fss4(i)-Ex4];
xmu124t = xmu124';
xmu124sq = xmu124sq + xmu124 * xmu124t;
end
%sw124 = xmu124sq(1) + xmu124sq(2) + xmu124sq(3);
%xmu124co = xmu124sq/34;
%%%%%


xmu134sq = zeros(3);
for i = 1:34
xmu134 = [fss(i)-Ex1;fss3(i)-Ex3;fss4(i)-Ex4];
xmu134t = xmu134';
xmu134sq = xmu134sq + xmu134 * xmu134t;
end
%sw134 = xmu134sq(1) + xmu134sq(2) + xmu134sq(3);
%xmu134co = xmu134sq/34;

%%%%%%%%

xmu234sq = zeros(3);
for i = 1:34
xmu234 = [fss2(i)-Ex2;fss3(i)-Ex3;fss4(i)-Ex4];
xmu234t = xmu234';
xmu234sq = xmu234sq + xmu234 * xmu234t;
end
%sw234 = xmu234sq(1) + xmu234sq(2) + xmu234sq(3);
%xmu234co = xmu234sq/34;

%%%%%%

xmu1234sq = zeros(4);
for i = 1:34
xmu1234 = [fss(i)-Ex1;fss2(i)-Ex2;fss3(i)-Ex3;fss4(i)-Ex4];
xmu1234t = xmu1234';
xmu1234sq = xmu1234sq + xmu1234 * xmu1234t;
end
%sw1234 = xmu1234sq(1) + xmu1234sq(2) + xmu1234sq(3) + xmu1234sq(4);
%xmu1234co = xmu1234sq/34;



%Calculate Sw for two classes


%%%%%%%%
%Repeat the same process for class versicolor
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



%Calculate the difference between the means.

dm12 = muv12 -mu12;   %Difference of means for features 1 and 2
dm23 = muv23 -mu23;   %Difference of means for features 2 and 3
dm13 = muv13 -mu13;   
dm14 = muv14 -mu14; 
dm24 = muv24 -mu24; 
dm34 = muv34 -mu34; 
dm123 = muv123 -mu123; 
dm124 = muv124 -mu124; 
dm134 = muv134 -mu134; 
dm234 = muv234 -mu234; 
dm1234 = muv1234 -mu1234; 




xmuv12sq = zeros(2);
for i = 1:34
xmuv12 = [fvv(i);fvv2(i)]-muv12;
xmuv12t = xmuv12.';
xmuv12sq = xmuv12sq + xmuv12 * xmuv12t;
end

%xmuv12co = xmuv12sq/34;

sw12 = xmu12sq + xmuv12sq;  %In between scatter matrix for features 1 and 2 for classes setosa and versicolor.
sw12inv = inv(sw12); %The inverse of the inbetween scatter matrix for features 1 and 2


%The idea vector direction v which maximizes the difference between the
%classes. 
v12 = sw12inv * dm12;
%sw12inv
%dm12
%nankika = 'danger'
%g = finverse(f)
%g = finverse(f,var)

%%%%%
xmuv23sq = zeros(2); 
for i = 1:34
xmuv23 = [fvv2(i);fvv3(i)]-muv23;
xmuv23t = xmuv23';
xmuv23sq = xmuv23sq + xmuv23 * xmuv23t;
end

%xmuv23co = xmuv23sq/34;
sw23 = xmu23sq + xmuv23sq;
sw23inv = inv(sw23);

v23 = sw23inv * dm23;
%%%%%%

xmuv13sq = zeros(2);
for i = 1:34
xmuv13 = [fvv(i);fvv3(i)]-muv13;
xmuv13t = xmuv13';
xmuv13sq = xmuv13sq + xmuv13 * xmuv13t;
end

%xmuv13co = xmuv13sq/34;
sw13 = xmu13sq + xmuv13sq;
sw13inv = inv(sw13);

v13 = sw13inv * dm13;
%%%%%%%


xmuv14sq = zeros(2);
for i = 1:34
xmuv14 = [fvv(i);fvv4(i)]-muv14;
xmuv14t = xmuv14';
xmuv14sq = xmuv14sq + xmuv14 * xmuv14t;
end

%xmuv14co = xmuv14sq/34;
sw14 = xmu14sq + xmuv14sq;
sw14inv = inv(sw14);

v14 = sw14inv * dm14;
%%%%%%%

xmuv24sq = zeros(2);
for i = 1:34
xmuv24 = [fvv2(i);fvv4(i)]-muv24;
xmuv24t = xmuv24';
xmuv24sq = xmuv24sq + xmuv24 * xmuv24t;
end

%xmuv24co = xmuv24sq/34;
sw24 = xmu24sq + xmuv24sq;
sw24inv = inv(sw24);
v24 = sw24inv * dm24;
%%%%%%%

xmuv34sq = zeros(2);
for i = 1:34
xmuv34 = [fvv3(i);fvv4(i)]-muv34;
xmuv34t = xmuv34';
xmuv34sq = xmuv34sq + xmuv34 * xmuv34t;
end

%xmuv34co = xmuv34sq/34;
%%%%%%
sw34 = xmu34sq + xmuv34sq;
sw34inv = inv(sw34);
v34 = sw34inv * dm34;



xmuv123sq = zeros(3);
for i = 1:34
xmuv123 = [fvv(i);fvv2(i);fvv3(i)]- muv123;
xmuv123t = xmuv123';
xmuv123sq = xmuv123sq + xmuv123 * xmuv123t;
end

%xmuv123co = xmuv123sq/34;
sw123 = xmu123sq + xmuv123sq;
sw123inv = inv(sw123);


v123 = sw123inv * dm123;
%%%%%%
xmuv124sq = zeros(3);
for i = 1:34
xmuv124 = [fvv(i);fvv2(i);fvv4(i)]-muv124;
xmuv124t = xmuv124';
xmuv124sq = xmuv124sq + xmuv124 * xmuv124t;
end

%xmuv124co = xmuv124sq/34;
%%%%%
sw124 = xmu124sq + xmuv124sq;
sw124inv = inv(sw124);

v124 = sw124inv * dm124;

xmuv134sq = zeros(3);
for i = 1:34
xmuv134 = [fvv(i);fvv3(i);fvv4(i)]-muv134;
xmuv134t = xmuv134';
xmuv134sq = xmuv134sq + xmuv134 * xmuv134t;
end

%xmuv134co = xmuv134sq/34;
sw134 = xmu134sq + xmuv134sq;
sw134inv = inv(sw134);
v134 = sw134inv * dm134;

%%%%%%%%

xmuv234sq = zeros(3);
for i = 1:34
xmuv234 = [fvv2(i);fvv3(i);fvv4(i)]- muv234;
xmuv234t = xmuv234';
xmuv234sq = xmuv234sq + xmuv234 * xmuv234t;
end

%xmuv234co = xmuv234sq/34;
sw234 = xmu234sq + xmuv234sq;
sw234inv = inv(sw234);


v234 = sw234inv * dm234;
%%%%%%

xmuv1234sq = zeros(4);
for i = 1:34
xmuv1234 = [fvv(i);fvv2(i);fvv3(i);fvv4(i)]-muv1234;
xmuv1234t = xmuv1234';
xmuv1234sq = xmuv1234sq + xmuv1234 * xmuv1234t;
end

%xmuv1234co = xmuv1234sq/34;
sw1234 = xmu1234sq + xmuv1234sq;
sw1234inv = inv(sw1234);

v1234 = sw1234inv * dm1234;
%%%%%%%%Create g(x) for features 1 and 2



%The next step is to multiply the original points with respective v's for
%training and testing sets respectively.



newfs12 = zeros(34,1);
newfs23 = zeros(34,1);
newfs13 = zeros(34,1);
newfs14 = zeros(34,1);
newfs24 = zeros(34,1);
newfs34 = zeros(34,1);
newfs123 = zeros(34,1);
newfs124 = zeros(34,1);
newfs134 = zeros(34,1);
newfs234 = zeros(34,1);
newfs1234 = zeros(34,1);

newfv12 = zeros(34,1);
newfv23 = zeros(34,1);
newfv13 = zeros(34,1);
newfv14 = zeros(34,1);
newfv24 = zeros(34,1);
newfv34 = zeros(34,1);
newfv123 = zeros(34,1);
newfv124 = zeros(34,1);
newfv134 = zeros(34,1);
newfv234 = zeros(34,1);
newfv1234 = zeros(34,1);

newfst12 = zeros(sst,1);
newfst23 = zeros(sst,1);
newfst13 = zeros(sst,1);
newfst14 = zeros(sst,1);
newfst24 = zeros(sst,1);
newfst34 = zeros(sst,1);
newfst123 = zeros(sst,1);
newfst124 = zeros(sst,1);
newfst134 = zeros(sst,1);
newfst234 = zeros(sst,1);
newfst1234 = zeros(sst,1);

newfvt12 = zeros(svt,1);
newfvt23 = zeros(svt,1);
newfvt13 = zeros(svt,1);
newfvt14 = zeros(svt,1);
newfvt24 = zeros(svt,1);
newfvt34 = zeros(svt,1);
newfvt123 = zeros(svt,1);
newfvt124 = zeros(svt,1);
newfvt134 = zeros(svt,1);
newfvt234 = zeros(svt,1);
newfvt1234 = zeros(svt,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%For the training set
for j = 1:34

%Get the new points for the training set of setosa for each of the feature
%combinations.

newfs12(j) = v12' * [fss(j); fss2(j)];   %New dataset for  features 1 and 2
newfs23(j) = v23' * [fss2(j); fss3(j)];   %New dataset for  features 2 and 3
newfs13(j) = v13' * [fss(j); fss3(j)]; %New dataset for  features 1 and 3
newfs14(j) = v14' * [fss(j); fss4(j)];  %New dataset for  features 1 and 4
newfs24(j) = v24' * [fss2(j); fss4(j)];  %New dataset for  features 2 and 4
newfs34(j) = v34' * [fss3(j); fss4(j)];  %New dataset for  features 3 and 4
newfs123(j) = v123' * [fss(j); fss2(j); fss3(j)]; %New dataset for  features 1, 2 and 3
newfs124(j) = v124' * [fss(j); fss2(j); fss4(j)]; %New dataset for  features 1, 2 and 4
newfs134(j) = v134' * [fss(j); fss3(j); fss4(j)]; %New dataset for  features 1, 3 and 4
newfs234(j) = v134' * [fss2(j); fss3(j); fss4(j)]; %New dataset for  features 2,3  and 4
newfs1234(j) = v1234' * [fss(j);fss2(j); fss3(j); fss4(j)];  %New dataset for  features 1,2,3 and 4





%Repeat the same process with the versicolor dataset.
newfv12(j) = v12' * [fvv(j); fvv2(j)];   
newfv23(j) = v23' * [fvv2(j); fvv3(j)]; 
newfv13(j) = v13' * [fvv(j); fvv3(j)]; 
newfv14(j) = v14' * [fvv(j); fvv4(j)];  
newfv24(j) = v24' * [fvv2(j); fvv4(j)];  
newfv34(j) = v34' * [fvv3(j); fvv4(j)];  
newfv123(j) = v123' * [fvv(j); fvv2(j); fvv3(j)]; 
newfv124(j) = v124' * [fvv(j); fvv2(j); fvv4(j)]; 
newfv134(j) = v134' * [fvv(j); fvv3(j); fvv4(j)]; 
newfv234(j) = v234' * [fvv2(j); fvv3(j); fvv4(j)]; 
newfv1234(j) = v1234' * [fvv(j); fvv2(j); fvv3(j); fvv4(j)]; 

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%Since the original value of the points is really small we are going to
%multiply the value we got by 10
%Let's try taking out the values.


%newfs12 = newfs12 * 10
%newfv12 = newfv12 *10

%Ex12s = Ex(newfs12); %expected value of combined features 1 and 2 of setosa dataset
%Ex12v = Ex(newfv12); %expected value of combined features 1 and 2 of versicolor dataset

%fs12m = newfs12 - Ex12s;  %Value of each array minus the mean to calculate the variance
%fv12m = newfv12 - Ex12v;

%fs12m2 = fs12m.^2; %Squaring the values after subtracting the mean.
%fv12m2 = fv12m.^2;

%sigs12= Ex(fs12m2); %Finding the variance by finding expected value of (x-m).^2
%sigv12 = Ex(fv12m2);



%sns =size(newfs12)
%snv =size(newfv12)
%The sizes are the same.

%Nx12m=zeros(sns);
%Nxv12m=zeros(snv);
%g1x12m = zeros(sns);
%g2x12m = zeros(snv);

%fs12 = sort(newfs12);
%fv12 = sort(newfv12);

%fs12 = round2(fs12,0.1);
%fv12 = round2(fv12,0.1);

%minfs12 = min(fs12)
%minfv12 = min(fv12)

%maxfs12 = max(fs12)
%maxfv12 = max(fv12)

%if minfs12 < minfv12
%min12 = minfs12
%minval = 's';
%else 
%min12 = minfv12
%minval = 'v';
%end

%if maxfs12 > maxfv12
%max12 = maxfs12
%maxval= 's';
%else 
%max12 = maxfv12
%maxval = 'v';
%end

%dif = (max12 - min12) * 10

%x =0;
%x(1) = min12

%for i= 2:dif+1
%x(i) = x(i-1) +0.1
%end



%for i= 1:dif+1

%xmu12 = [fs12(i)-Ex12s];  %short for x - Ex value the s represents setosa, xmu12 is for setosa.
%xmu12t = xmu12'; % transpose
%xmu12 = [x(i)-Ex12s]

%xmuv12 = [fv12(i)-Ex12v]; %short for x - Ex value the v represents versicolor, xmu12 is for versicolor.
%xmuv12 = [x(i)-Ex12v];

%xmuv12t = xmuv12'; % transpose

%Nx12 =   (1/(sqrt(2 *3.1416 * sigs12))) * exp((-1/(2 *sigs12)) *(xmu12.^2));
%Nx12m(i) = Nx12; 
%Nxv12 =  (1/(sqrt(2 *3.1416 * sigv12))) * exp((-1/(2 *sigv12)) *(xmuv12.^2));
%Nxv12m(i) = Nxv12; 

%The priors are equal so are not included in the equation
%g1x12 = ((-1/(2 *sigs12)) *xmu12.^2) - 0.5 * log(2 *3.1416) - 0.5 *log(sigs12);
%g2x12 = ((-1/(2 *sigv12)) *xmuv12.^2)- 0.5 * log(2 *3.1416) - 0.5 * log(sigv12);
%g1x12m(i) = g1x12;
%g2x12m(i) = g2x12;
%end

%size(x)
%size(Nx12m)


%g1g2x12m = g1x12m-g2x12m;
%ming1g2 = min(g1g2x12m)
%maxg1g2 = max(g1g2x12m)
%plot(x,Nx12m,x,Nxv12m);
%plot(x,g1x12m,x,g2x12m);
%plot(x,g1x12m-g2x12m);


%only accuracy of the testing set will be taken into consideration.


for j = 1:sst

%Get the new points for the testing set of setosa for each of the feature
%combinations.

newfst12(j) = v12' * [fsst(j); fsst2(j)];   %New dataset for  features 1 and 2
newfst23(j) = v23' * [fsst2(j); fsst3(j)];   %New dataset for  features 2 and 3
newfst13(j) = v13' * [fsst(j); fsst3(j)]; %New dataset for  features 1 and 3
newfst14(j) = v14' * [fsst(j); fsst4(j)];  %New dataset for  features 1 and 4
newfst24(j) = v24' * [fsst2(j); fsst4(j)];  %New dataset for  features 2 and 4
newfst34(j) = v34' * [fsst3(j); fsst4(j)];  %New dataset for  features 3 and 4
newfst123(j) = v123' * [fsst(j); fsst2(j); fsst3(j)]; %New dataset for  features 1, 2 and 3
newfst124(j) = v124' * [fsst(j); fsst2(j); fsst4(j)]; %New dataset for  features 1, 2 and 4
newfst134(j) = v134' * [fsst(j); fsst3(j); fsst4(j)]; %New dataset for  features 1, 3 and 4
newfst234(j) = v134' * [fsst2(j); fsst3(j); fsst4(j)]; %New dataset for  features 2,3  and 4
newfst1234(j) = v1234' * [fsst(j);fsst2(j); fsst3(j); fsst4(j)];  %New dataset for  features 1,2,3 and 4
end



svt
size (fvvt)
size (fvvt2)
for j =1:svt

%Repeat the same process with the versicolor dataset.
newfvt12(j) = v12' * [fvvt(j); fvvt2(j)];   
newfvt23(j) = v23' * [fvvt2(j); fvvt3(j)]; 
newfvt13(j) = v13' * [fvvt(j); fvvt3(j)]; 
newfvt14(j) = v14' * [fvvt(j); fvvt4(j)];  
newfvt24(j) = v24' * [fvvt2(j); fvvt4(j)];  
newfvt34(j) = v34' * [fvvt3(j); fvvt4(j)];  
newfvt123(j) = v123' * [fvvt(j); fvvt2(j); fvvt3(j)]; 
newfvt124(j) = v124' * [fvvt(j); fvvt2(j); fvvt4(j)]; 
newfvt134(j) = v134' * [fvvt(j); fvvt3(j); fvvt4(j)]; 
newfvt234(j) = v234' * [fvvt2(j); fvvt3(j); fvvt4(j)]; 
newfvt1234(j) = v1234' * [fvvt(j); fvvt2(j); fvvt3(j); fvvt4(j)]; 

end


%newfst12
%fsvt12 = vertcat(newfst12,newfvt12) %testing set containing features from both setosa and versicolor after projection.
%testc = vertcat(cst,cvt) %list of classes for the training set.


%fsvt12 = fsvt12 *10;
%fsvt12 = round2(fsvt12,0.1);

%class ='';
%false = 0;
%true = 0;
%falses = 0;
%trues = 0;
%falsev = 0;
%truev = 0;
%Rte = 0;

%Rte= size(fsvt12)
%Rte2= size(testc)

%testc2 = zeros(2,Rte)


%for i=1:Rte
% if strcmp('Iris-setosa',char(testc(i)))
%testc2(1,i) = 1;
%testc2(2,i) = 0;
%k = 'hey'
%testc2(i) = 1
%else
%testc2(1,i) = 0;
%testc2(2,i) = 1;
%testc2(i) = -1
%end
%end

%test = [fsvt12 testc2']
%test = sortrows(test)
%outputs = zeros(Rte,1);


%dif2 = (test(1,1) - test(30,1)) * 10;
%x2(1) = test(1,1);
%for i=2:dif2
%x2(i) = x(i-1) + 0.1;
%end
%sizex2 = size(x2);
 
%for i=1:Rte
%fsvt12(i)

%xmu12t = [fsvt12(i)-Ex12s]
%xmuv12t = [fsvt12(i)-Ex12v]
%g1x12 = ((-1/(2 *sigs12)) *xmu12t.^2) - 0.5 * log(2 *3.1416) - 0.5 *log(sigs12)
%g2x12 = ((-1/(2 *sigv12)) *xmuv12t.^2)- 0.5 * log(2 *3.1416) - 0.5 * log(sigv12)
%if g1x12 > g2x12
%        class = 'Iris-setosa'
%        testc(i)
%        outputs(1,i) = 1;%1;
%        outputs(2,i) = 0;
%if strcmp(class,char(testc(i)))
%            true = true+1;
%            trues = trues + 1;
%        else
%            false = false +1;
%            falses = falses +1;
%        end
%   else 
%        class = 'Iris-versicolor'
%        testc(i)
%        outputs(1,i) = 0;%-1;
%        outputs(2,i) = 1;
%        if strcmp(class,char(testc(i)))
%            true = true + 1;
%            truev = truev + 1;
%        else
%            false = false +1 ;
%            falsev = falsev + 1;
%        end
%end
%end
%end
%end

%accuracyte12 = true / (true + false);
%accuracytes12 = trues / (trues + falsev);
%accuracytev12 = truev / (truev + falses);


%S12tr = 'For features 1 and 2, the overall testing accuracy is: '; 
%disp(S12tr); disp(accuracyte12* 100);

%S12tr = 'The testing accuracy for class setosa is: ' ;
%disp(S12tr); disp(accuracytes12* 100);

%S12tr = 'The testing accuracy class versicolor is: '; 
%disp(S12tr); disp(accuracytev12* 100);




%ming1g2 = floor(ming1g2)
%maxg1g2 = ceil(maxg1g2)

%inc = (maxg1g2-ming1g2)/30; %the increments to use.


%thresh = ming1g2; 

%for j=1:30


%true = 0;
%false = 0;
%trues =0;
%falses=0;
%truev = 0;
%falsev= 0;



%for i=1:Rte
%fsvt12(i)

%xmu12t = [fsvt12(i)-Ex12s]
%xmuv12t = [fsvt12(i)-Ex12v]
%g1x12 = ((-1/(2 *sigs12)) *xmu12t.^2) - 0.5 * log(2 *3.1416) - 0.5 *log(sigs12)
%g2x12 = ((-1/(2 *sigv12)) *xmuv12t.^2)- 0.5 * log(2 *3.1416) - 0.5 * log(sigv12)
%if g1x12 - g2x12 > thresh 
 %       class = 'Iris-setosa'
   %     testc(i)
  %      outputs(1,i) = 1;%1;
   %     outputs(2,i) = 0;
%if strcmp(class,char(testc(i)))
 %           true = true+1;        
  %          trues = trues + 1;   %true positive
   %     else
    %        false = false +1;
     %       falses = falses +1; %false posotive
      %  end
  % else 
   %     class = 'Iris-versicolor'
    %    testc(i)
     %   outputs(1,i) = 0;%-1;
      %  outputs(2,i) = 1;
       % if strcmp(class,char(testc(i)))
        %    true = true + 1;     
         %   truev = truev + 1; %true negative
       % else
        %    false = false +1 ; 
         %   falsev = falsev + 1; %false negative
       % end
%end
%end


%tpr(j) = trues / (trues + falsev);
%fpr(j) = falses/ (falses + truev);
%end
%end
%thresh = thresh + inc;
%end


%plot (fpr,tpr);

%newfvt12(j) = v12' * [fvvt(j); fvvt2(j)];   
%newfvt23(j) = v23' * [fvvt2(j); fvvt3(j)]; 
%newfvt13(j) = v13' * [fvvt(j); fvvt3(j)]; 
%newfvt14(j) = v14' * [fvvt(j); fvvt4(j)];  
%newfvt24(j) = v24' * [fvvt2(j); fvvt4(j)];  
%newfvt34(j) = v34' * [fvvt3(j); fvvt4(j)];  
%newfvt123(j) = v123' * [fvvt(j); fvvt2(j); fvvt3(j)]; 
%newfvt124(j) = v124' * [fvvt(j); fvvt2(j); fvvt4(j)]; 
%newfvt134(j) = v134' * [fvvt(j); fvvt3(j); fvvt4(j)]; 
%newfvt234(j) = v234' * [fvvt2(j); fvvt3(j); fvvt4(j)]; 
%newfvt1234(j) = v1234' * [fvvt(j); fvvt2(j); fvvt3(j); fvvt4(j)]; 


%Train and test features using Bayesian

if f ==12

if strcmp(c,'ROC')
traintest(newfs12,newfv12,newfst12,newfvt12,cst,cvt,'ROC',12);
elseif strcmp(c,'n')
traintest(newfs12,newfv12,newfst12,newfvt12,cst,cvt,'n',12);
elseif strcmp(c,'g')
traintest(newfs12,newfv12,newfst12,newfvt12,cst,cvt,'g',12);
elseif c == 'gm'
traintest(newfs12,newfv12,newfst12,newfvt12,cst,cvt,'gm',12);

end
end


if f == 23
if strcmp(c,'ROC')
traintest(newfs23,newfv23,newfst23,newfvt23,cst,cvt,'ROC',23);
elseif strcmp(c,'n')
traintest(newfs23,newfv23,newfst23,newfvt23,cst,cvt,'n',23);
elseif strcmp(c,'g')
traintest(newfs23,newfv23,newfst23,newfvt23,cst,cvt,'g',23);
elseif strcmp(c,'gm')
traintest(newfs23,newfv23,newfst23,newfvt23,cst,cvt,'gm',23);
end
end

if f == 13
if strcmp(c,'ROC')
traintest(newfs13,newfv13,newfst13,newfvt13,cst,cvt,'ROC',13);
elseif strcmp(c,'n')
traintest(newfs13,newfv13,newfst13,newfvt13,cst,cvt,'n',13);
elseif strcmp(c,'g')
traintest(newfs13,newfv13,newfst13,newfvt13,cst,cvt,'g',13);
elseif strcmp(c,'gm')
traintest(newfs13,newfv13,newfst13,newfvt13,cst,cvt,'gm',13);
end
end

if f == 14
    blah
    if strcmp(c,'ROC')
traintest(newfs14,newfv14,newfst14,newfvt14,cst,cvt,'ROC',14);
elseif strcmp(c,'n')
traintest(newfs14,newfv14,newfst14,newfvt14,cst,cvt,'n',14);
elseif strcmp(c,'g')
traintest(newfs14,newfv14,newfst14,newfvt14,cst,cvt,'g',14);
elseif strcmp(c,'gm')
traintest(newfs14,newfv14,newfst14,newfvt14,cst,cvt,'gm',14);
    end
end

if f == 24
if strcmp(c,'ROC')
traintest(newfs24,newfv24,newfst24,newfvt24,cst,cvt,'ROC',24);
elseif strcmp(c,'n')
traintest(newfs24,newfv24,newfst24,newfvt24,cst,cvt,'n',24);
elseif strcmp(c,'g')
traintest(newfs24,newfv24,newfst24,newfvt24,cst,cvt,'g',24);
elseif strcmp(c,'gm')
traintest(newfs24,newfv24,newfst24,newfvt24,cst,cvt,'gm',24);
end
end

if f == 34
if strcmp(c,'ROC')
traintest(newfs34,newfv34,newfst34,newfvt34,cst,cvt,'ROC',34);
elseif strcmp(c,'n')
traintest(newfs34,newfv34,newfst34,newfvt34,cst,cvt,'n',34);
elseif strcmp(c,'g')
traintest(newfs34,newfv34,newfst34,newfvt34,cst,cvt,'g',34);
elseif strcmp(c,'gm')
traintest(newfs34,newfv34,newfst34,newfvt34,cst,cvt,'gm',34);
end
end

if f == 123
if strcmp(c,'ROC')
traintest(newfs123,newfv123,newfst123,newfvt123,cst,cvt,'ROC',123);
elseif strcmp(c,'n')
traintest(newfs123,newfv123,newfst123,newfvt123,cst,cvt,'n',123);
elseif strcmp(c,'g')
traintest(newfs123,newfv123,newfst123,newfvt123,cst,cvt,'g',123);
elseif strcmp(c,'gm')
traintest(newfs123,newfv123,newfst123,newfvt123,cst,cvt,'gm',123);
end 
end

if f == 124
if strcmp(c,'ROC')
traintest(newfs124,newfv124,newfst124,newfvt124,cst,cvt,'ROC',124);
elseif strcmp(c,'n')
traintest(newfs124,newfv124,newfst124,newfvt124,cst,cvt,'n',124);
elseif strcmp(c,'g')
traintest(newfs124,newfv124,newfst124,newfvt124,cst,cvt,'g',124);
elseif strcmp(c,'gm')
traintest(newfs124,newfv124,newfst124,newfvt124,cst,cvt,'gm',124);
end
end

if f == 134
if strcmp(c,'ROC')
traintest(newfs134,newfv134,newfst134,newfvt134,cst,cvt,'ROC',134);
elseif strcmp(c,'n')
traintest(newfs134,newfv134,newfst134,newfvt134,cst,cvt,'n',134);
elseif strcmp(c,'g')
traintest(newfs134,newfv134,newfst134,newfvt134,cst,cvt,'g',134);
elseif strcmp(c,'gm')
traintest(newfs134,newfv134,newfst134,newfvt134,cst,cvt,'gm',134);
end 
end

if f == 234
if strcmp(c,'ROC')
traintest(newfs234,newfv234,newfst234,newfvt13,cst,cvt,'ROC',234);
elseif strcmp(c,'n')
traintest(newfs234,newfv234,newfst234,newfvt13,cst,cvt,'n',234);
elseif strcmp(c,'g')
traintest(newfs234,newfv234,newfst234,newfvt13,cst,cvt,'g',234);
elseif strcmp(c,'gm')
traintest(newfs234,newfv234,newfst234,newfvt13,cst,cvt,'gm',234);
end
end

if f == 1234
if strcmp(c,'ROC')
traintest(newfs1234,newfv1234,newfst1234,newfvt1234,cst,cvt,'ROC',1234);
elseif strcmp(c,'n')
traintest(newfs1234,newfv1234,newfst1234,newfvt1234,cst,cvt,'n',1234);
elseif strcmp(c,'g')
traintest(newfs1234,newfv1234,newfst1234,newfvt1234,cst,cvt,'g',1234);
elseif strcmp(c,'gm')
traintest(newfs1234,newfv1234,newfst1234,newfvt1234,cst,cvt,'gm',1234);
end
end





%blah




end
 