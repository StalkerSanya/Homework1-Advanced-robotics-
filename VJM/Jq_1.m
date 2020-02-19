function [ Jq ] = Jq_1(Tbase,Ttool,d0,q1,t,L)

T0 = FK_1(Tbase,Ttool,d0,q1,t,L);
T0(1:3,4) = [0;0;0];
T0 = T0';

Td = Tbase*Tz(d0)*Tz(t(1))*Rzd(q1(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q1(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q1(3))...
    *Ttool*T0;



J1 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;


Td = Tbase*Tz(d0)*Tz(t(1))*Rz(q1(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rzd(q1(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q1(3))...
    *Ttool*T0;


J2 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;


Td = Tbase*Tz(d0)*Tz(t(1))*Rz(q1(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q1(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rzd(q1(3))...
    *Ttool*T0;


J3 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Jq = [J1 J2 J3] ;

end
