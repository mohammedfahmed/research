function [P_u,P_g]=BeamPattern_ug_eqn(N,R,phi)
% find the average beampattern (equation) of the uniform and Gaussian
% distributions
V=(R/3)^2;
for cntr=1:length(phi);
    alpha_u=4*pi*R*sin(phi(cntr)/2);
    P_u(cntr)=(1/N)+(1-(1/N))*(abs( 2*(besselj(1,alpha_u))/alpha_u ))^2;
    alpha_g=4*pi*sin(phi(cntr)/2);
    P_g(cntr)=(1/N)+(1-(1/N))*(abs(  exp(-V*(alpha_g^2)/2 ) ))^2;
end
