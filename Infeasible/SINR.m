% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [Gamma_2cells,Gamma_eachcells] = SINR(H , P , noise,NU)
% Generate the SINR of users

for i=1:length(H(:,1))
   temp = 0;
   for j=1:length(H(1,:))%Interference imposed to user i from others at BS
       if(i~= j)
          temp = temp + H(i,j)*P(j);
       end
   end

temp = temp + noise; %Total interference imposed to user i at BS
Gamma_2cells(i) = (P(i)*H(i,i))/(temp);
end


for i = 1:NU
    temp_BS1 = 0;
    temp_BS2 = 0;
    for j = 1:NU %Interference imposed to user i from others at BS
        if(i~= j)
           temp_BS1 = temp_BS1 + H(i,j)*P(j);
           temp_BS2 = temp_BS2 + H(i+NU,j+NU)*P(j+NU);
        end
    end
    temp_BS1 = temp_BS1 + noise; %Total interference imposed to user i at BS1
    temp_BS2 = temp_BS2 + noise; %Total interference imposed to user i at BS2
    Gamma_eachcells(i) = (P(i)*H(i,i))/(temp_BS1);
    Gamma_eachcells(i+NU) = (P(i+NU)*H(i+NU,i+NU))/(temp_BS2);
end


end