function [VR, Eff]=PSA(Input)

w=2*pi*50;

% 1: single ckt & non-bundle & non-symetric: Input=[Dab,Dbc,Dac,r,l,A,ro,Pr,V]
if numel(Input)==9
    Dab=Input(1);
    Dbc=Input(2);
    Dac=Input(3);
    r=Input(4);
    l=Input(5);
    A=Input(6);
    ro=Input(7);
    Pr=Input(8);
    V=Input(9);

    Ds=r*exp(-1/4);
    Vr=V/sqrt(3);
    Ir=Pr/((sqrt(3))*V);
    VI_r=[Vr;Ir];
    
    L=2*(10^(-7)*log(((Dab*Dbc*Dac)^(1/3))/Ds)); % per length
    C=(2*pi*8.85*(10^(-12)))/(log(((Dab*Dbc*Dac)^(1/3))/r)); % per length
    R=(ro)/A; % per length
% ========================================================================    

% 2: single ckt & bundle & non-symetric: Input=[Dab,Dbc,Dac,r,l,A,ro,d,Pr,V]
elseif numel(Input)==10    
    n=input("Number of bundles: ");
    Dab=Input(1);
    Dbc=Input(2);
    Dac=Input(3);
    r=Input(4);
    l=Input(5);
    A=Input(6);
    ro=Input(7);
    d=Input(8);
    Pr=Input(9);
    V=Input(10);
    
    Ds=r*exp(-1/4);
    
    % DsBundle Calculation:
    if n==2
        DsBundle=sqrt(Ds*d);
        rsBundle=sqrt(r*d);
    elseif n==3
        DsBundle=(Ds*(d)^2)^(1/3);
        rsBundle=(r*(d)^2)^(1/3);
    elseif n==4
        DsBundle=1.09*(Ds*(d)^3)^(1/4);
        rsBundle=1.09*(r*(d)^3)^(1/4);
    end
    
    Vr=V/sqrt(3);
    Ir=Pr/((sqrt(3))*V);
    VI_r=[Vr;Ir];
    
    
    
    L=2*(10^(-7)*log(((Dab*Dbc*Dac)^(1/3))/DsBundle)); % per length
    C=(2*pi*8.85*(10^(-12)))/(log(((Dab*Dbc*Dac)^(1/3))/rsBundle)); % per length
    R=(ro)/A; % per length       
% ========================================================================

% 3: single ckt & bundle & non-symetric: 

%    Input=[Da_aprime, Db_bprime, Dc_cprime, Dab, Dac, ... 
%    Dbc, Da_bprime, Daprime_c, Dbprime_c, Daprime_b, ...
%    Da_cprime, Db_cprime, Daprime_bprime, Daprime_cprime, Dbprime_cprime, ...
%    r,l,A,ro,Pr,V]

elseif numel(Input)==21    

    Da_aprime=Input(1);
    Db_bprime=Input(2);
    Dc_cprime=Input(3);
    Dab=Input(4);
    Dac=Input(5);
    Dbc=Input(6);
    Da_bprime=Input(7);
    Daprime_c=Input(8);
    Dbprime_c=Input(9);
    Daprime_b=Input(10);
    Da_cprime=Input(11);
    Db_cprime=Input(12);
    Daprime_bprime=Input(13);
    Daprime_cprime=Input(14);
    Dbprime_cprime=Input(15);
    
    r=Input(16);
    l=Input(17);
    A=Input(18);
    ro=Input(19);
    Pr=Input(20);
    V=Input(21);
    
    Ds=r*exp(-1/4);
    

  
    
    DsA=sqrt(Ds*(Da_aprime));
    DsB=sqrt(Ds*(Db_bprime));
    DsC=sqrt(Ds*(Dc_cprime));
    
    rA=sqrt(r*(Da_aprime));
    rB=sqrt(r*(Db_bprime));
    rC=sqrt(r*(Dc_cprime));
    
    DAB=(Dab*Da_bprime*Daprime_b*Daprime_bprime)^(1/4);
    DAC=(Dac*Daprime_c*Da_cprime*Daprime_cprime)^(1/4);
    DBC=(Dbc*Dbprime_c*Db_cprime*Dbprime_cprime)^(1/4);
    

    GMRL= (DsA*DsB*DsC)^(1/3);
    GMRC= (rA*rB*rC)^(1/3);
    GMD=  (DAB*DAC*DBC)^(1/3);
    
    Vr=V/sqrt(3);
    Ir=Pr/((sqrt(3))*V);
    VI_r=[Vr;Ir];
    
    L=2*(10^(-7)*log(GMD/GMRL)) ; % per length
    C=(2*pi*8.85*(10^(-12)))/(log(GMD/GMRC)); % per length
    R=(ro)/A; % per length    
% ========================================================================

% 4: two ckt & bundle: 
%    Input=[Da_aprime, Db_bprime, Dc_cprime, Dab, Dac, ... 
%    Dbc, Da_bprime, Daprime_c, Dbprime_c, Daprime_b, ...
%    Da_cprime, Db_cprime, Daprime_bprime, Daprime_cprime, Dbprime_cprime, ...
%    r,l,A,ro,d,Pr,V]    
 elseif numel(Input)==22   
     
    n=input("Number of bundles: ");
    Da_aprime=Input(1);
    Db_bprime=Input(2);
    Dc_cprime=Input(3);
    Dab=Input(4);
    Dac=Input(5);
    Dbc=Input(6);
    Da_bprime=Input(7);
    Daprime_c=Input(8);
    Dbprime_c=Input(9);
    Daprime_b=Input(10);
    Da_cprime=Input(11);
    Db_cprime=Input(12);
    Daprime_bprime=Input(13);
    Daprime_cprime=Input(14);
    Dbprime_cprime=Input(15);
    
    r=Input(16);
    l=Input(17);
    A=Input(18);
    ro=Input(19);
    d=Input(20);
    Pr=Input(21);
    V=Input(22);
    
    Ds=r*exp(-1/4);
    
   % DsBundle Calculation:
    if n==2
        DsBundle=sqrt(Ds*d);
        rsBundle=sqrt(r*d);
    elseif n==3
        DsBundle=(Ds*(d)^2)^(1/3);
        rsBundle=(r*(d)^2)^(1/3);
    elseif n==4
        DsBundle=1.09*(Ds*(d)^3)^(1/4);
        rsBundle=1.09*(r*(d)^3)^(1/4);
    end
    
    
    DsA=sqrt(DsBundle*(Da_aprime));
    DsB=sqrt(DsBundle*(Db_bprime));
    DsC=sqrt(DsBundle*(Dc_cprime));
    
    rA=sqrt(rsBundle*(Da_aprime));
    rB=sqrt(rsBundle*(Db_bprime));
    rC=sqrt(rsBundle*(Dc_cprime));
    
    DAB=(Dab*Da_bprime*Daprime_b*Daprime_bprime)^(1/4);
    DAC=(Dac*Daprime_c*Da_cprime*Daprime_cprime)^(1/4);
    DBC=(Dbc*Dbprime_c*Db_cprime*Dbprime_cprime)^(1/4);
    

    GMRL= (DsA*DsB*DsC)^(1/3);
    GMRC= (rA*rB*rC)^(1/3);
    GMD=  (DAB*DAC*DBC)^(1/3);
    
    Vr=V/sqrt(3);
    Ir=Pr/((sqrt(3))*V);
    VI_r=[Vr;Ir];
    
    L=2*(10^(-7)*log(GMD/GMRL)) ; % per length
    C=(2*pi*8.85*(10^(-12)))/(log(GMD/GMRC)); % per length
    R=(ro)/A; % per length  
end

% ========================== Short Line Analysis ======================
if l<80  
Zc=(R+i*w*L)*l ;
ABCD_short=[1 Zc ; 0 1];
VI_s=(ABCD_short)*(VI_r);
Vs=VI_s(1);
Is=VI_s(2);
Ps=real(3*Vs*conj(Is));
end

% ========================== Mediume Line Analysis ======================
if 80<l<240  
Zc=(R+i*w*L)*l ;
ABCD_short=[1 Zc ; 0 1];
VI_s=(ABCD_short)*(VI_r);
Vs=VI_s(1);
Is=VI_s(2);
Ps=real(3*Vs*conj(Is));
end

% ========================== Long Line Analysis ======================
if l>240  
Zc=(R+i*w*L)*l ;
ABCD_short=[1 Zc ; 0 1];
VI_s=(ABCD_short)*(VI_r);
Vs=VI_s(1);
Is=VI_s(2);
Ps=real(3*Vs*conj(Is));
end

% ========================= Output Calculation =======================
VR=100*((abs(Vs)-abs(Vr))/abs(Vr));
Eff=Pr/Ps;

end
