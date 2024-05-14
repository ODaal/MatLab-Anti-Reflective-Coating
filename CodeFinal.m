clear all;
n= 0.01:(0.02):4;
counter=0;
Powervalues = ones(1,200);
for i=n
    %refraction:
    n0 = 1.33;
    n1 = 1.5;
    n2 = i;
    n3 = 3.2;
    ncell = 3.5;
    rn0n1 = (n0-n1)/(n0+n1);
    rn1n2 = (n1-n2)/(n1+n2);
    rn2n3 = (n2-n3)/(n2+n3);
    rn3ncell = (n3-ncell)/(n3+ncell);
    %Transmission:
    tn0n1 = (2*n0)/(n0+n1);
    tn1n2 = (2*n1)/(n1+n2);
    tn2n3 = (2*n2)/(n2+n3);
    tn3ncell = (2*n3)/(n3+ncell);
    %Dynamic Matrix:
    Qn0n1 = (1/tn0n1)*[1 rn0n1; rn0n1 1];
    Qn1n2 = (1/tn1n2)*[1 rn1n2; rn1n2 1];
    Qn2n3 = (1/tn2n3)*[1 rn2n3; rn2n3 1];
    Qn3ncell = (1/tn3ncell)*[1 rn3ncell; rn3ncell 1];
    centerwave = 650;
    Power=0;
    for wavelength= 400:1400
        %landa
        pd1(wavelength) = ((pi/2)*(centerwave/wavelength));
        pd2(wavelength) = ((pi/2)*(centerwave/wavelength));
        pd3(wavelength) = ((pi/2)*(centerwave/wavelength));
        %Matrice de propagation
        p1 = [exp(j*pd1(wavelength)) 0; 0 exp(-j*pd1(wavelength))];
        p2 = [exp(j*pd2(wavelength)) 0; 0 exp(-j*pd2(wavelength))];
        p3 = [exp(j*pd3(wavelength)) 0; 0 exp(-j*pd3(wavelength))];
        t = Qn0n1*p1*Qn1n2*p2*Qn2n3*p3*Qn3ncell;
        %Reflectivite et transmitivte
        R(wavelength) = abs(t(2,1)/t(1,1))^2;
        T(wavelength) = (abs(1/t(1,1))^2)*(ncell/n0);
        I(wavelength) = (6.16*(10^15))/(((wavelength)^5)*(exp(2484/wavelength)-1));
        Power = Power+T(wavelength)*I(wavelength);
    end

    counter = counter + 1;
    Powervalues(1,counter) = Powervalues(1,counter)*Power;
    
end

plot(0.01:(0.02):4, Powervalues);
grid on;
xlim([1.7 3])
xlabel("Refraction Index (n2)");
ylabel("Power Production W/m^2");
title('Triple-layer Power Production vs Refractive Index Increase');