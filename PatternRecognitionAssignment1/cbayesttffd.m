function [total,priors,priorv,setosa,versicolor,maxf2,minf2] = cbayesttffd(a,b,c,f)


%b and c contain setosa and versicolor datasets respectively, you insert
%filenames to run them
%f is the feature selected (you use numbers 1 to 4 to select one of 4
%features, 1 is the best one)
%import the seretosa dataset and select training and testing data respectively 

Ms =csvimport(b);
[Rs,Cs] = size(Ms);
f2s = Ms(1:34,f);   %select training set of features
f2st = Ms(35:Rs,f); %select testing set of features
cs = Ms(1:34,5);    %select training set of classes
cst = Ms(35:Rs,5);  %select testing set of classes


%Repeat the same process for versicolor dataset
Mv =csvimport(c);
[Rv,Cv] = size(Mv);
f2v = Mv(1:34,f); %select one feature versicolor
f2vt = Mv(35:Rv,f); %select one feature versicolor
cv = Mv(1:34,5);
cvt = Mv(35:Rv,5);


%The following code is used to calculate the prior probabilities using
%training and testing set.
class = vertcat(cs,cv);
f2 = vertcat(f2s,f2v);
[R,C] = size(class);
%[Rs,Cs] = size(Ms);
%f2s = Ms(:,f); %select one feature setosa


setosa = 0;
versicolor =1;
for i = 1:R
  single = class(i);
  if     strcmp(char(single),'Iris-setosa') 
      setosa = setosa+1;
  elseif strcmp(char(single),'Iris-versicolor')
      versicolor= versicolor +1
  end
end

total = setosa + versicolor
priors = setosa/total
priorv = versicolor/total
%We will only consider two classes Iris Setosa and Iris-Vericolor


single = 0.0;
f22 = str2double(cell2mat (f2(1)));
for j = 2:R
  if isstr (cell2mat (f2(j,1)))
     str2double(cell2mat (f2(j,1)));
  else  
      single = cell2mat (f2(j,1));
  end
   f22 = vertcat(f22,single);
 
end

maxf2=max(f22)
minf2=min(f22)
single = 0.0;
%Using the above code we find the minimum and maximum values of the
%features selected this will be used to calculate boundary later.






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

%single ='';

    
x0103= 0;
x0406= 0;
x0709= 0;
x1012= 0;
x1315= 0;
x1618= 0;
x1921= 0;
x2224= 0;
x2527= 0;
x2830= 0;
x3133= 0;
x3436= 0;
x3739= 0;
x4042= 0;
x4345= 0;
x4648 = 0;
x4951 = 0;
x5254 = 0;
x5557 = 0;
x5860 = 0;
x6163 = 0;
x6466 = 0;
x6769 = 0;
x7072 =0;

x0103ppv= 0;
x0406ppv= 0;
x0709ppv= 0;
x1012ppv= 0;
x1315ppv= 0;
x1618ppv= 0;
x1921ppv= 0;
x2224ppv= 0;
x2527ppv= 0;
x2830ppv= 0;
x3133ppv= 0;
x3436ppv= 0;
x3739ppv= 0;
x4042ppv= 0;
x4345ppv=  0;
x4648ppv= 0;
x4951ppv = 0;
x5254ppv = 0;
x5557ppv = 0;
x5860ppv = 0; 
x6163ppv = 0;
x6466ppv = 0;
x6769ppv = 0;
x7072ppv = 0;




x0103pp= 0;
x0406pp= 0;
x0709pp= 0;
x1012pp= 0;
x1315pp= 0;
x1618pp= 0;
x1921pp= 0;
x2224pp= 0;
x2527pp= 0;
x2830pp= 0;
x3133pp= 0;
x3436pp= 0;
x3739pp= 0;
x4042pp= 0;
x4345pp=  0;
x4648pp = 0;
x4951pp = 0;
x5254pp = 0;
x5557pp = 0;
x5860pp = 0; 
x6163pp = 0;
x6466pp = 0;
x6769pp = 0;
x7072pp = 0;


x0103l= 0;
x0406l= 0;
x0709l= 0;
x1012l= 0;
x1315l= 0;
x1618l= 0;
x1921l= 0;
x2224l= 0;
x2527l= 0;
x2830l= 0;
x3133l= 0;
x3436l= 0;
x3739l= 0;
x4042l= 0;
x4345l=  0;
x4648l = 0;
x4951l = 0;
x5254l = 0;
x5557l = 0;
x5860l = 0; 
x6163l = 0;
x6466l = 0;
x6769l = 0;
x7072l = 0;

x0103v= 0;
x0406v= 0;
x0709v= 0;
x1012v= 0;
x1315v= 0;
x1618v= 0;
x1921v= 0;
x2224v= 0;
x2527v= 0;
x2830v= 0;
x3133v= 0;
x3436v= 0;
x3739v= 0;
x4042v= 0;
x4345v = 0;
x4648v = 0;
x4951v = 0;
x5254v = 0;
x5557v = 0;
x5860v = 0;
x6163v = 0;
x6466v = 0;
x6769v = 0;
x7072v = 0;

x0103vl= 0;
x0406vl= 0;
x0709vl= 0;
x1012vl= 0;
x1315vl= 0;
x1618vl= 0;
x1921vl= 0;
x2224vl= 0;
x2527vl= 0;
x2830vl= 0;
x3133vl= 0;
x3436vl= 0;
x3739vl= 0;
x4042vl= 0;
x4345vl = 0;
x4648vl = 0;
x4951vl = 0;
x5254vl = 0;
x5557vl = 0;
x5860vl = 0;
x6163vl = 0;
x6466vl = 0;
x6769vl = 0;
x7072vl = 0;


%collect each feature in bins as shown below, calculate once for setosa and
%once for versicolor. The following will be used to calculate the liklihood
%for setosa

for k =1:34
    if f22s(k) == 0.1 || f22s(k) == 0.2 || f22s (k) == 0.3
    x0103= x0103 +1
    end
    if f22s(k) == 0.4 || f22s(k) == 0.5 || f22s (k) == 0.6
    x0406= x0406 +1
    end
    if f22s(k) == 0.7 || f22s(k) == 0.8 || f22s (k) == 0.9
    x0709= x0709 +1
    end
    if f22s(k) == 1.0 || f22s(k) == 1.1 || f22s (k) == 1.2
    x1012= x1012 +1
    end
    if f22s(k) == 1.3 || f22s(k) == 1.4 || f22s (k) == 1.5
    x1315= x1315 +1
    end
    if f22s(k) == 1.6 || f22s(k) == 1.7 || f22s (k) == 1.8
    x1618= x1618+1
    end
    if f22s(k) == 1.9 || f22s(k) == 2.0 || f22s (k) == 2.1
    x1921= x1921+1
    end
    if f22s(k) == 2.2 || f22s(k) == 2.3 || f22s (k) == 2.4
    x2224= x2224+1
    end
     if f22s(k) == 2.5 || f22s(k) == 2.6 || f22s (k) == 2.7
     x2527= x2527+1
    end
    if f22s(k) == 2.8 || f22s(k) == 2.9 || f22s (k) == 3.0
     x2830= x2830+1
    end
     if f22s(k) == 3.1 || f22s(k) == 3.2 || f22s (k) == 3.3
     x3133= x3133+1
    end
    if f22s(k) == 3.4 || f22s(k) == 3.5 || f22s (k) == 3.6
     x3436= x3436+1
    end
    if f22s(k) == 3.7 || f22s(k) == 3.8 || f22s (k) == 3.9
      x3739= x3739+1
    end
    if f22s(k) == 4.0 || f22s(k) == 4.1 || f22s (k) == 4.2
      x4042= x4042+1
    end
    if f22s(k) == 4.3 || f22s(k) == 4.4 || f22s (k) == 4.5
      x4345= x4345+1
    end
    if f22s(k) == 4.6 || f22s(k) == 4.7 || f22s (k) == 4.8
      x4648= x4648+1
    end
      if f22s(k) == 4.9 || f22s(k) == 5.0 || f22s (k) == 5.1
      x4951= x4951+1 
      end
      if f22s(k) == 5.2 || f22s(k) == 5.3 || f22s (k) == 5.4
      x5254= x5254+1
      end
      if f22s(k) == 5.5 || f22s(k) == 5.6 || f22s (k) == 5.7
      x5557= x5557+1  
      end
      if f22s(k) == 5.8 || f22s(k) == 5.9 || f22s (k) == 6.0
      x5860= x5860+1
      end
      if f22s(k) == 6.1 || f22s(k) == 6.2 || f22s (k) == 6.3
      x6163= x6163+1    
      end
      if f22s(k) == 6.4 || f22s(k) == 6.5 || f22s (k) == 6.6
      x6466= x6466+1 
      end
      if f22s(k) == 6.7 || f22s(k) == 6.8 || f22s (k) == 6.9
      x6769= x6769 +1
      end
      if f22s(k) == 7.0 || f22v(k) == 7.1 || f22s (k) == 7.2
      x7072= x7072 +1
      end
end

%final calculation for liklihoold of setosa p(x|w1)

x0103l= x0103/34;
x0406l= x0406/34;
x0709l= x0709/34;
x1012l= x1012/34;
x1315l= x1315/34;
x1618l= x1618/34;
x1921l= x1921/34;
x2224l= x2224/34;
x2527l= x2527/34;
x2830l= x2830/34;
x3133l= x3133/34;
x3436l= x3436/34;
x3739l= x3739/34;
x4042l= x4042/34;
x4345l = x4345/34
x4648l = x4648/34
x4951l = x4951/34
x5254l = x5254/34
x5557l = x5557/34
x5860l = x5860/34
x6163l = x6163/34
x6466l = x6466/34
x6769l = x6769/34
x7072l = x7072/34

%Collecting values in bins for versicolor

for k =1:34
   
    if f22v(k) == 0.1 || f22v(k) == 0.2 || f22v (k) == 0.3
    x0103v= x0103v +1
    end
    if f22v(k) == 0.4 || f22v(k) == 0.5 || f22v (k) == 0.6
    x0406v= x0406v +1
    end
    if f22v(k) == 0.7 || f22v(k) == 0.8 || f22v (k) == 0.9
    x0709v= x0709v +1
    end
    if f22v(k) == 1.0 || f22v(k) == 1.1 || f22v (k) == 1.2
    x1012v= x1012v +1
    end
    if f22v(k) == 1.3 || f22v(k) == 1.4 || f22v (k) == 1.5
    x1315v= x1315v +1
    end
    if f22v(k) == 1.6 || f22v(k) == 1.7 || f22v (k) == 1.8
    x1618v= x1618v+1
    end
    if f22v(k) == 1.9 || f22v(k) == 2.0 || f22v (k) == 2.1
    x1921v= x1921v+1
    end
    if f22v(k) == 2.2 || f22v(k) == 2.3 || f22v (k) == 2.4
    x2224v= x2224v+1
    end
     if f22v(k) == 2.5 || f22v(k) == 2.6 || f22v (k) == 2.7
     x2527= x2527v+1
    end
    if f22v(k) == 2.8 || f22v(k) == 2.9 || f22v (k) == 3.0
     x2830v= x2830v+1
    end
     if f22v(k) == 3.1 || f22v(k) == 3.2 || f22v (k) == 3.3
     x3133v= x3133v+1
    end
    if f22v(k) == 3.4 || f22v(k) == 3.5 || f22v (k) == 3.6
     x3436v= x3436v+1
    end
    if f22v(k) == 3.7 || f22v(k) == 3.8 || f22v (k) == 3.9
      x3739v= x3739v+1
    end
    if f22v(k) == 4.0 || f22v(k) == 4.1 || f22v (k) == 4.2
      x4042v= x4042v+1
    end
   if f22v(k) == 4.3 || f22v(k) == 4.4 || f22v (k) == 4.5
      x4345v= x4345v+1
    end
    if f22v(k) == 4.6 || f22v(k) == 4.7 || f22v (k) == 4.8
      x4648v= x4648v+1
    end
      if f22v(k) == 4.9 || f22v(k) == 5.0 || f22v (k) == 5.1
      x4951v= x4951v+1 
      end
      if f22v(k) == 5.2 || f22v(k) == 5.3 || f22v (k) == 5.4
      x5254v= x5254v+1
      end
      if f22v(k) == 5.5 || f22v(k) == 5.6 || f22v (k) == 5.7
      x5557v= x5557v+1  
      end
      if f22v(k) == 5.8 || f22v(k) == 5.9 || f22v (k) == 6.0
      x5860v= x5860v+1
      end
      if f22v(k) == 6.1 || f22v(k) == 6.2 || f22v (k) == 6.3
      x6163v= x6163v+1    
      end
      if f22v(k) == 6.4 || f22v(k) == 6.5 || f22v (k) == 6.6
      x6466v= x6466v+1 
      end
      if f22v(k) == 6.7 || f22v(k) == 6.8 || f22v (k) == 6.9
      x6769v= x6769v +1
      end
      if f22v(k) == 7.0 || f22v(k) == 7.1 || f22v (k) == 7.2
      x7072v= x7072v +1
      end
      
end

%finalcalculation for likelihood of versicolor p(x|w2)

x0103vl = x0103v/34;
x0406vl = x0406v/34;
x0709vl = x0709v/34;
x1012vl = x1012v/34;
x1315vl = x1315v/34;
x1618vl = x1618v/34;
x1921vl = x1921v/34;
x2224vl = x2224v/34;
x2527vl = x2527v/34;
x2830vl = x2830v/34;
x3133vl = x3133v/34;
x3436vl = x3436v/34;
x3739vl = x3739v/34;
x4042vl = x4042v/34
x4345vl = x4345v/34
x4648vl = x4648v/34
x4951vl = x4951v/34
x5254vl = x5254v/34
x5557vl = x5557v/34
x5860vl = x5860v/34
x6163vl = x6163v/34
x6466vl = x6466v/34
x6769vl = x6769v/34
x7072vl = x7072v/34

% calculating p(x)

x0103p = x0103l * priors + x0103vl * priorv;
x0406p = x0406l * priors + x0406vl * priorv;
x0709p = x0709l * priors + x0709vl * priorv;
x1012p = x1012l * priors + x1012vl * priorv;
x1315p = x1315l * priors + x1315vl * priorv;
x1618p = x1618l * priors + x1618vl * priorv;
x1921p = x1921l * priors + x1921vl * priorv;
x2224p = x2224l * priors + x2224vl * priorv;
x2527p = x2527l * priors + x2527vl * priorv;
x2830p = x2830l * priors + x2830vl * priorv;
x3133p = x3133l * priors + x3133vl * priorv;
x3436p = x3436l * priors + x3436vl * priorv;
x3739p = x3739l * priors + x3739vl * priorv;
x4042p = x4042l * priors + x4042vl * priorv;
x4345p = x4345l * priors + x4345vl * priorv
x4648p = x4648l * priors + x4648vl * priorv
x4951p = x4951l * priors + x4951vl * priorv
x5254p = x5254l * priors + x5254vl * priorv
x5557p = x5557l * priors + x5557vl * priorv
x5860p = x5860l * priors + x5860vl * priorv
x6163p = x6163l * priors + x6163vl * priorv
x6466p = x6466l * priors + x6466vl * priorv
x6769p = x6769l * priors + x6769vl * priorv
x7072p = x7072l * priors + x7072vl * priorv



%Calculating posterior for setosa
if (x0103p)> 0 
x0103pp = (x0103l * priors) / x0103p;
end 
if (x0406p) >0
x0406pp = (x0406l * priors) / x0406p; 
end

if (x0709p) >0
x0709pp = (x0709l * priors) / x0709p; 
end

if (x1012p) >0
x1012pp = (x1012l * priors) / x1012p; 
end

if (x1315p) > 0
x1315pp = (x1315l * priors) / x1315p;
end

if (x1618p) >0
x1618pp = (x1618l * priors) / x1618p;
end

if (x1921p) > 0
x1921pp = (x1921l * priors) / x1921p;
end

if (x2224p > 0)
x2224pp = (x2224l * priors) / x2224p;
end

if (x2527p> 0 )
x2527pp = (x2527l * priors) / x2527p;
end

if (x2830p > 0)
x2830pp = (x2830l * priors) / x2830p;
end

if (x3133p >0)
x3133pp = (x3133l * priors) / x3133p;
end

if (x3436p >0)
x3436pp = (x3436l * priors) / x3436p;
end

if (x3739p >0)
x3739pp = (x3739l * priors) / x3739p; 
end

if (x4042p >0)
x4042pp = (x4042l * priors) / x4042p;
end

if(x4345p >0)
x4345pp = (x4345l * priors) / x4345p
end

if(x4648p >0)
x4648pp = (x4648l * priors) / x4648p
end

if(x4951p >0)
x4951pp = (x4951l * priors)  / x4951p
end

if(x5254p >0)
x5254pp = (x5254l * priors) / x5254p
end

if(x5557p >0)
x5557pp = (x5557l * priors) / x5557p 
end

if(x5860p >0)
x5860pp = (x5860l * priors) / x5860p
end

if(x6163 >0)
x6163pp = (x6163l * priors) / x6163p
end

if(x6466p >0)
x6466pp = (x6466l * priors) / x6466p
end

if(x6769p>0)
x6769pp = (x6769l * priors) / x6769p
end

if(x7072p>0)
x7072pp = (x7072l * priors) / x7072p
end


%calculating the posterior for versicolor

if(x0103p>0)
x0103ppv = (x0103vl * priorv) / x0103p;
end

if(x0406p>0)
x0406ppv = (x0406vl * priorv) / x0406p; 
end

if(x0709p>0)
x0709ppv = (x0709vl * priorv) / x0709p; 
end

if(x1012p >0)
x1012ppv = (x1012vl * priorv) / x1012p; 
end

if(x1315p>0)
x1315ppv = (x1315vl * priorv) / x1315p;
end

if(x1618p>0)
x1618ppv = (x1618vl * priorv) / x1618p;
end

if(x1921p>0)
x1921ppv = (x1921vl * priorv) / x1921p;
end

if(x2224p>0)
x2224ppv = (x2224vl * priorv) / x2224p;
end

if(x2527p>0)
x2527ppv = (x2527vl * priorv) / x2527p;
end

if(x2830p>0)
x2830ppv = (x2830vl * priorv) / x2830p;
end

if(x3133p>0)
x3133ppv = (x3133vl * priorv) / x3133p;
end

if(x3436p>0)
x3436ppv = (x3436vl * priorv) / x3436p;
end

if(x3739p>0)
x3739ppv = (x3739vl * priorv) / x3739p; 
end

if(x4042p>0)
x4042ppv = (x4042vl * priorv) / x4042p;
end

if(x4345p>0)
x4345ppv = (x4345vl * priorv) / x4345p
end

if(x4648p>0)
x4648ppv = (x4648vl * priorv) / x4648p
end

if(x4951p>0)
x4951ppv = (x4951vl * priorv)  / x4951p
end

if(x5254p>0)
x5254ppv = (x5254vl * priorv) / x5254p
end

if(x5557p>0)
x5557ppv = (x5557vl * priorv) / x5557p 
end

if(x5860p>0)
x5860ppv = (x5860vl * priorv) / x5860p
end

if(x6163p>0)
x6163ppv = (x6163vl * priorv) / x6163p
end

if(x6466p>0)
x6466ppv = (x6466vl * priorv) / x6466p
end

if(x6769p>0)
x6769ppv = (x6769vl * priorv) / x6769p
end

if(x7072p>0)
x7072ppv = (x7072vl * priorv) / x7072p
end

%The bins are the average value of each bin
x1 = [0.2,0.5,0.8,1.1,1.4,1.7,2.0,2.3,2.6,2.9,3.2,3.5,3.8,4.1,4.4,4.7,5.0,5.3,5.6,5.9,6.2,6.5,6.8,7.1];

% The likelihood of classes setosa, versicolor, then the posterior
% probabilities of classes setosa, and versicolor respectively.

y = [x0103l,x0406l,x0709l,x1012l, x1315l, x1618l, x1921l, x2224l, x2527l, x2830l, x3133l, x3436l, x3739l, x4042l ,x4345l,x4648l,x4951l,x5254l,x5557l,x5860l,x6163l,x6466l,x6769l,x7072l];
y1 = [x0103vl,x0406vl,x0709vl,x1012vl, x1315vl, x1618vl, x1921vl, x2224vl, x2527vl, x2830vl, x3133vl, x3436vl, x3739vl, x4042vl,x4345vl,x4648vl,x4951vl,x5254vl,x5557vl,x5860vl,x6163vl,x6466vl,x6769vl,x7072vl];
y2 = [x0103pp,x0406pp,x0709pp,x1012pp, x1315pp, x1618pp, x1921pp, x2224pp, x2527pp, x2830pp, x3133pp, x3436pp, x3739pp, x4042pp,x4345pp,x4648pp,x4951pp,x5254pp,x5557pp,x5860pp,x6163pp,x6466pp,x6769pp,x7072pp];
y3 = [x0103ppv,x0406ppv,x0709ppv,x1012ppv, x1315ppv, x1618ppv, x1921ppv, x2224ppv, x2527ppv, x2830ppv, x3133ppv, x3436ppv, x3739ppv, x4042ppv,x4345ppv,x4648ppv,x4951ppv,x5254ppv,x5557ppv,x5860ppv,x6163ppv,x6466ppv,x6769ppv,x7072ppv];


%plot all the above in one diagram.
plot(x1,y1,x1,y,x1,y2,x1,y3);


%calculating the boundary. Provided that both values are within the
%minimum and maximum value the boundary is the location where both
%posterior possiblities intersect. The code below is used to roughly
%calculate that.

boundary2 = 0;

for i=2:24

     if x1(i) >= minf2 && x1(i) <=maxf2
    if y3(i) > y2(i) && y2(i-1) > y3(i-1) 
    boundary2 = (x1(i) + x1(i-1))/2; 
     end
     end
end
for i=1:24
    if x1(i) >=minf2 && x1(i) <=maxf2
if (y3(i)==y2(i))
    boundary2 = x1(i);
end
end
end

boundary2



%Making the trainging and testing sets for setosa and versicolor
%respectively

train = vertcat(f22s,f22v);  %training set
test = vertcat(f2st,f2vt); %testing set

trainc = vertcat(cs,cv);  %training set
testc = vertcat(cst,cvt); %testing set

[Rtr,Ctr] = size(train);
[Rte,Cte] = size(test);


%Calculating the training error by dividing true positives by total amount
%of classified data.

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
    if train(i,1) <= boundary2
        class = 'Iris-setosa';
        if strcmp(class,char(trainc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false+1;
            falses = falses+1;
        end
    end 
        if train(i,1) > boundary2
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

accuracytr = true / (true +false)
accuracytrs = trues / (trues +falsev)
accuracytrv = truev / (truev +falses)
%Repeat for testing set.

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rte
    if cell2mat(test(i,1)) <= boundary2
        class = 'Iris-setosa';
        if strcmp(class,char(testc(i,1)))
            true = true+1;
            trues = trues+1;
        else
            false = false +1;
            falses = falses+1;
        end
    end 
        if cell2mat(test(i,1)) > boundary2
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

accuracyte = true / (true + false)
accuracytes = trues / (trues + falsev)
accuracytev = truev / (truev + falses)
true 
both = true + false


end
