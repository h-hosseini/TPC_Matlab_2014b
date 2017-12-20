% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [isfeasible ] = check_feasibility( SINR,NU,target_SINR,Power,P_bar )




isfeasible=true;
for i=1:NU*2
    if (Power(1,i)<0) || (Power(1,i)>P_bar) 
        isfeasible=false;
        str=sprintf('Power of user %d is not in range ',i);
        disp(str);
    end
end
for i=1:NU*2
   disp (abs(SINR(1,i)-target_SINR(1,i)));
    if abs(SINR(1,i)-target_SINR(1,i))<=10^(-10) % 10^(-5) is the smal value
       str=sprintf('User %d meets its Target SINR ',i); 
        
    else
        %isfeasible=true;  % For network feasibility not for user feasibility
        isfeasible=false;
        str=sprintf('User %d dosn`t meet its Target SINR ',i);
     end
    disp(str);
    
   
end

 if isfeasible
    disp('Network is Feasible');
else
    disp('Network is Infeasible');
end
    