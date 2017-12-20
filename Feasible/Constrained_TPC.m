% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [P,Gamma]= Constrained_TPC( NU,P_bar,Gamma_hat,Noise,initial_power,H)
%This function simulate Costrained TPC algorithm
iteration = 15;
P(1,:)=initial_power;
Gamma(1,:)=SINR(H,initial_power,Noise,NU);

for i=1:NU*2 
%i=2;
%while abs(Gamma(i,:).-Gamma(i-1,:))>10^(-4)
    if P(1,i)>P_bar(1,i)
            P(1,i)= P_bar(1,i);
        end
end

for i=2:iteration
    P(i,:)=Gamma_hat(1,:)./Gamma(i-1,:).*P(i-1,:);
    for j=1:NU*2 
        if P(i,j)>P_bar(1,j)
            P(i,j)= P_bar(1,j);
        end
     Gamma(i,:)=SINR(H,P(i,:),Noise,NU);
    end



 
end
subplot(3,1,2);

for i=1:10
    

   
    plot(1:iteration,P(:,i));
    
    xlabel('Iteration');
    ylabel('Powers');
    hold on;
end

subplot(3,1,3);

for i=1:10
    

   
    plot(1:iteration,Gamma(:,i));
    
    xlabel('Iteration');
    ylabel('SINR');
    hold on;
end


end



