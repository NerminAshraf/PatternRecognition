function [ Ex1, Exv1,Sigx1,Sigxv1 ] = smartNormalx2( b,c,f )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


Ms =csvimport(b);
[Rs,Cs] = size(Ms);
f2s = Ms(1:34,f);   %select training set of features
f2st = Ms(35:Rs,f); %select testing set of features
cs = Ms(1:34,5);    %select training set of classes
cst = Ms(35:Rs,5);  %select testing set of classes


%Repeat the same process for versicolor dataset
Mv =csvimport(c);
[Rv,Cv] = size(Mv);
f2v = Mv(1:34,f); %training set
f2vt = Mv(35:Rv,f); %select one feature versicolor
cv = Mv(1:34,5);
cvt = Mv(35:Rv,5);

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



x = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2]

[rx,cx]= size(x')
xsc = zeros(rx,1) %count of x in setosa
for i=1:rx
for j=1:34
if f22s(j) == x(i)
    f22s(j)
    x(i)
    xsc(i)= xsc(i)+1 
end
end
end

xsc


xsl = xsc./34  %calculate the likelihood of x


%[rx,cx]= size(x')
xvc = zeros(rx,1) %count of x in setosa
for i=1:rx
for j=1:34
if f22v(j) == x(i)
   % f22v(j)
   % x(i)
    xvc(i)= xvc(i)+1 
end
end
end

xsc


xvl = xvc./34  %calculate the likelihood of x




total1 = 0;
for j = 1:34

total1 = total1 +  f22s(j);
end
Ex1 = total1/34


total2 = 0;
for j = 1:34

total2 = total2 +  f22v(j);
end
Exv1 = total2/34

Sigx = 0
for j  = 1:34
Sigx = Sigx + ((f22s(j) - Ex1).^2)
end

Sigx = Sigx/34


Sigx1 = 0
for j  = 1:34
Sigx1 = Sigx1 + ((f22s(j) - Ex1).^2)*xsl(f22s(j)*10) 
end

Sigx
%Sigx = Sigx/34



Sigxv = 0
for j  = 1:34
Sigxv = Sigxv + (f22v(j) - Exv1).^2;
end

Sigxv = Sigxv/34





Sigxv1 = 0
for j  = 1:34
Sigxv1 = Sigxv1 + ((f22v(j) - Exv1).^2)*xvl(f22v(j)*10) 
end

Sigxv
xvl

[xr,xc] = size (x')
%Nx = zeros(xr,xc);
%j = 1;


x = x';


mini = min (f22s) *10
maxi = max (f22s) *10
xNx = x(mini:maxi)
[xr1,xc1] = size(xNx)

%for j = 1:xr1
%Nx(j) = (1 / sqrt(2 * 3.1416 * Sigx1)) * exp ( (-1/(2 * Sigx1))*(xNx(j) - Ex1).^2);
%end

for j = 1:xr
Nx(j) = (1 / sqrt(2 * 3.1416 * Sigx1)) * exp ( (-1/(2 * Sigx1))*(x(j) - Ex1).^2);
end


mini = min (f22v) *10
maxi = max (f22v) *10
xNxv = x(mini:maxi)
[xrv1,xcv1] = size(xNxv)
%for j = 1:xrv1
%Nxv(j) = (1 / sqrt(2 * 3.1416 * Sigxv1)) * exp ( (-1/(2 * Sigxv1))*(xNxv(j) - Ex1).^2);
%end

for j = 1:xr
Nxv(j) = (1 / sqrt(2 * 3.1416 * Sigxv1)) * exp ( (-1/(2 * Sigxv1))*(x(j) - Exv1).^2);
end

%

%mini = min (f22s) *10
%maxi = max (f22s) *10


%xNx = x(mini:maxi)

%plot(xNx,Nx,xNxv,Nxv);
plot(x,Nx,x,Nxv);

%g1x(1,1) = -0.5 * ((x(50) - Ex).^2 * 1/(Sigx))- (0.5 *log(2*3.1416)) - double (0.5 * log(Sigx))






%for i = 1:xr
%Nxv(i) = (1 / sqrt(2 * 3.1416 * Sigxv)) * exp ( (-1/(2 * Sigxv))*(x(i) - Exv1).^2);
%end



%Nxv
%plot(xNx,Nx,x,Nxv);

px = 0;
px = (Nx * 0.5) + (Nxv * 0.5)


%posts = 0;
%postw =0;
for i = 1:xr
if x(i) > 0
posts(i) = (Nx(i)*0.5)/px(i); 
else
posts(i) = 0 
end
end

plot(x,posts);
x

%posts = 0;
%postw =0;
for i = 1:xr
if x(i) > 0
postv(i) = (Nxv(i)*0.5)/px(i); 
else
postv(i) = 0 
end
end

plot(x,postv,x,posts);
x

%for i = 1:x
%g1x(1,i) = -0.5 * ((x(1,i) - Ex).^2  *  inv(Sigx)) - (0.5 * log(2 *3.1416)) - double(0.5 * (log (Sigx)));
%g2x(1,i) = -0.5 * ((x(1,i) - Exv).^2 * inv(Sigxv)) - (0.5* log(2 *3.1416) - double(0.5 * log (Sigxv));
%end


train = vertcat(f22s,f22v);  %training set
test = vertcat(f2st,f2vt); %testing set

trainc = vertcat(cs,cv);  %training set
testc = vertcat(cst,cvt); %testing set

[Rtr,Ctr] = size(train);
[Rte,Cte] = size(test);

class ='';
false = 0;
true = 0;
falses = 0;
trues = 0;
falsev = 0;
truev = 0;
for i=1:Rtr
%g1x = 0;
%g2x = 0;  
%g1x = -0.5 * ((train(i,1) - Ex1).^2  *  inv(Sigx)) - (0.5 * log(2 *3.1416)) -(0.5 * log (Sigx));
%g2x = -0.5 * ((train(i,1) - Exv1).^2 * inv(Sigxv)) - (0.5* log(2 *3.1416)) - (0.5 * log (Sigxv));
   
% if g1x > g2x
if posts(train(i,1)*10)> postv(train(i,1)*10)
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
%g1x = 0;
%g2x = 0;
%g1x = -0.5 * ((train(i,1) - Ex1).^2  *  inv(Sigx)) - (0.5 * log(2 *3.1416)) - double(0.5 * (log (Sigx)));
%g2x = -0.5 * ((train(i,1) - Exv1).^2 * inv(Sigxv)) - (0.5* log(2 *3.1416)) - double(0.5 * log (Sigxv));
%   if g1x > g2x
if posts(cell2mat((test(i,1)))*10)> postv(cell2mat((test(i,1)))*10)
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

accuracyte = true / (true + false)
accuracytes = trues / (trues + falsev)
accuracytev = truev / (truev + falses)
true 
truev
trues
false
falsev
falses
both = true + false


end
 