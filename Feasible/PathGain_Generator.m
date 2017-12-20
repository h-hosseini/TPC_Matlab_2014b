% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [ H ] = PathGain_Generator( D,K )
% Generate the path gain of users
% D is the distance matrix
for i=1:length(D(:,1))
    for j=1:length(D(1,:))
        H(i,j) = K*D(i,j)^(-4);
    end
end
end