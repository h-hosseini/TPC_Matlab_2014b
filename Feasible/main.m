% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% Homework 2: TPC Simulation using MATLAB
% programmer: SeyedHedayat Hosseini
% Date: November, 2015
% Matlab Version: R2014b
% ************* MAIN SCRIPT ************* %

clc;
clear all ;


NU=5;
%NU = 0;%Number of Users 
%while NU==0
%      NU = input('Enter number of users in each cell: ');
%end

BG_Noise = 5*10^(-15);
%BG_Noise = 0;%Background nois
%BG_Noise = input('Enter Background nois: ');

P_Bar=1;
%P_Bar = 0;%Maximum Power 
%P_Bar = input('Enter Maximum Power: ');

Gamma_hat = 0.05;
%Gamma_hat = 0;%Gamma Hat
%Gamma_hat = input('Enter Gamma Hat: ');


D=Distance_Generator(NU);
H=PathGain_Generator(D,0.09);
target_SINR=ones(1,10).* Gamma_hat;
Powers = Power_to_reach_feasibility( NU,H,target_SINR,BG_Noise );
[Gamma_2cells,Gamma_eachcells] = SINR(H ,Powers, BG_Noise,NU);
if check_feasibility( Gamma_2cells,NU,target_SINR,Powers,P_Bar );
    initial_power=Random_Power(NU,P_Bar);
    P_Bar_vector=ones(1,NU*2)*P_Bar;
    [P_TPC,SINR_TPC]= Constrained_TPC( NU,P_Bar_vector,Gamma_hat,BG_Noise,initial_power,H);
else
    disp('This system is not Feasible, try again.' );
end
    