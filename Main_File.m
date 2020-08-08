% Power System Analysis I course project.
% Programmer: Pouya Aminaie
% Student Number: 9532545

% *************************Tips to Run The code************************

% First of all run this m-file. 
% Enter the inputs of program as a vector based on one of 8 types of
% systems indicated below.

% Input format for different types of systems: 
% (Note that your inputs must be in the format of a vector.)

% 1: single ckt & non-bundle: Input=[Dab,Dbc,Dac,r,l,A,ro,Pr,V]
%---------------------------------------------------------------------
% 2: single ckt & bundle: Input=[Dab,Dbc,Dac,r,l,A,ro,d,Pr,V]
%---------------------------------------------------------------------
% 3: two ckt & non-bundle: 
%    Input=[Da_aprime, Db_bprime, Dc_cprime, Dab, Dac, ... 
%    Dbc, Da_bprime, Daprime_c, Dbprime_c, Daprime_b, ...
%    Da_cprime, Db_cprime, Daprime_bprime, Daprime_cprime, Dbprime_cprime, ...
%    r,l,A,ro,Pr,V]
%---------------------------------------------------------------------
% 4: two ckt & bundle: 
%    Input=[Da_aprime, Db_bprime, Dc_cprime, Dab, Dac, ... 
%    Dbc, Da_bprime, Daprime_c, Dbprime_c, Daprime_b, ...
%    Da_cprime, Db_cprime, Daprime_bprime, Daprime_cprime, Dbprime_cprime, ...
%    r,l,A,ro,d,Pr,V]


close all; clear; clc;
Input=input("Enter Inputs as a Vector Based on The Type of System: ");
N=numel(Input);

if (N~=9) && (N~=10) && (N~=21) && (N~=22)
   disp(" *** Error in Entering Input Data. Please Enter Them Correctly ***")
else
    [VR, Eff]=PSA(Input)
end

