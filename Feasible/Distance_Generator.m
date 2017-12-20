% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [ D ] = Distance_Generator(NU)
%Distance between the 2 users group which uniformly distributed in 2 500*500 square
%Coverage area and 2 base stations that they are located in (250,250)& (750,250)

%BS1 & its users specifications
x1=rand(1,NU).*500;
y1=rand(1,NU).*500;
BS1=[250,250];

%BS2 & its users specifications
x2=500 + rand(1,NU).*500;
y2=rand(1,NU).*500;
BS2=[750,250];


%  vector of users location, Row 1 is X axis & Row 2 is Y axis of users
%  which indicate by matrix column indexes
Users=zeros(2,NU*2);
for i=1:NU
    Users(1,i)=x1(1,i);
    Users(2,i)=y1(1,i);
    Users(1,i+NU)=x2(1,i);
    Users(2,i+NU)=y2(1,i);
end

%BS allocation Vector
%Column 1 is X axis & Column 2 is Y axis of a Base station that
  %it allocate to user which indicate by matrix row indexes
BS=zeros(NU*2,2);
for i=1:NU
   BS(i,1)=BS1(1,1);
   BS(i,2)=BS1(1,2);
   BS(i+NU,1)=BS2(1,1);
   BS(i+NU,2)=BS2(1,2);
end

%Distance matrix, According to Comments of Dr Rasti: distance between user 
  %of j and allocated Base Station to user of i
D = zeros(NU*2,NU*2);
for i=1:NU*2
    for j=1:NU*2
        D(i,j) = (((Users(1,j) - BS(i,1))^2) + ((Users(2,j) - BS(i,2))^2))^(0.5);
    end
end

%str='Users locations are :\n';
%for i=1:NU*2
%    str=strcat(str,sprintf('User %d : (%0.5f,%3.5f)  ',i,Users(1,i),Users(2,i)));
%end
%disp(str);

subplot(3,1,1);
plot(Users(1,:),Users(2,:),'rO ');
for i=1:NU*2
    text(Users(1,i)-10,Users(2,i)+30,int2str(i));
end
hold on;
plot(BS(:,1),BS(:,2),'B* ');
legend('Users','Base Stations');
xlabel('X');
ylabel('Y');
end