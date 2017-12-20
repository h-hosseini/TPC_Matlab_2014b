% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ******************************************************** %

function [ Power_Vector ] = Random_Power( NU,P_Bar)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

%Power_Vector=ones(1,NU*2).*(10^(-6));

Power_Vector=ones(1,NU*2).*(rand(1)*P_Bar);

%Power_Vector=rand(1,NU*2)*P_Bar;

%=zeros(1,NU);
%for i=1:NU
%    Power_Vector(1,i)=rand(1)*P_Bar;
%end

