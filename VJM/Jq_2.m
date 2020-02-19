function [ Jq ] = Jq_2(Tbase,Ttool,d0,q2,t,L)

T0 = FK_2(Tbase,Ttool,d0,q2,t,L);
T0(1:3,4) = [0;0;0];
T0 = T0';

Td = Tbase*Tz(d0)*Tz(t(1))*Rzd(q2(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q2(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q2(3))*Rx(pi/2)...
    *Ttool*T0;



J1 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;


Td = Tbase*Tz(d0)*Tz(t(1))*Rz(q2(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rzd(q2(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q2(3))*Rx(pi/2)...
    *Ttool*T0;


J2 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;


Td = Tbase*Tz(d0)*Tz(t(1))*Rz(q2(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q2(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rzd(q2(3))*Rx(pi/2)...
    *Ttool*T0;


J3 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Jq = [J1 J2 J3] ;
end
