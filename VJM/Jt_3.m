function [ Jt ] = Jt_3(Tbase,Ttool,d0,q,t,L)

T0 = FK_3(Tbase,Ttool,d0,q,t,L);
T0(1:3,4) = [0;0;0];
T0 = T0';

Td=Tbase*Tz(d0)*Tzd(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J1 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Txd(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J2 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Tyd(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J3 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tzd(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J4 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rxd(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J5 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ryd(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J6 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rzd(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J7 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Txd(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J8 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Tyd(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J9 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tzd(t(10))*Rx(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J10 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rxd(t(11))*Ry(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J11 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ryd(t(12))*Rz(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J12 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;

Td=Tbase*Tz(d0)*Tz(t(1))*Rz(q(1))*Tx(L(1))*Tx(t(2))*Ty(t(3))*Tz(t(4))...
    *Rx(t(5))*Ry(t(6))*Rz(t(7))*Rz(q(2))*Tx(L(2))...
    *Tx(t(8))*Ty(t(9))*Tz(t(10))*Rx(t(11))*Ry(t(12))*Rzd(t(13))*Rz(q(3))*Ry(-pi/2)*Rx(-pi)...
    *Ttool*T0;

J13 = [Td(1,4), Td(2,4), Td(3,4), Td(3,2), Td(1,3), Td(2,1)]' ;


Jt = [J1 J2 J3 J4 J5 J6 J7 J8 J9 J10 J11 J12 J13] ;
end
