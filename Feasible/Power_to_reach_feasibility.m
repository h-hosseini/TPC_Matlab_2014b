% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [ Powers ] = Power_to_reach_feasibility( Nu,Pathgain,Gammahat,Noise )
% This fanction create a transmit power to reach the Target-SINR Vector
% A*P>=B ===> P>=B/A ===> P>=inv(A)*B

Powers_v=zeros(Nu*2,1); %Vertical vector
Powers=zeros(1,Nu*2); % Horizontal vector
A=ones(Nu*2,Nu*2);
B=zeros(Nu*2,1);

% We creat matrix of A
for i=1:Nu*2
    for j=1:Nu*2
        if (i~=j)
            A(i,j)=(-1)*Gammahat(1,i)*Pathgain(i,j)/Pathgain(i,i);
        end
    end
end

% We creat matrix of B
for i=1:Nu*2
    B(i,1)=Gammahat(1,i)*Noise/Pathgain(i,i);
end

Powers_v=inv(A)*B;

for i=1:Nu*2
    Powers(1,i)=Powers_v(i,1);


end

