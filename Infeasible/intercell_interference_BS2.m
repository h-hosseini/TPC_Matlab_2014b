% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [ inter_cell_interference_BS2, max_interference ] = intercell_interference_BS2( H,NU,noise,P )
% For the user i served by the second BS, express the inter-cell
% interference, i.e., the interference caused by the users in the first
% cell at the second BS
inter_cell_interference_BS2 =zeros(1,5);
max_interference=zeros(1,2);
for i=1:NU
    for j = 1:NU %Interference imposed to user i in BS1 from others users at BS2
           inter_cell_interference_BS2(1,i) = inter_cell_interference_BS2(1,i) + H(i+NU,j)*P(j);
           if (H(i+NU,j)*P(j))>max_interference(1,1)
               max_interference(1,1)=H(i+NU,j)*P(j);
               max_interference(1,2)=j;
           end
    end
    inter_cell_interference_BS2(1,i)=inter_cell_interference_BS2(1,i)+noise;
end


