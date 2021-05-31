function [f, g] = fitting(x)
    global DMOS;
    global Scores;
    I=ones(size(DMOS));
    
    A = (x(1).*logistic(x(2).*I, Scores-x(3).*I) + x(4).*Scores + x(5).*I - DMOS);
    f = (A'*A)^1/2;
    if nargout > 1
        g(1) = A'*(logistic(x(2).*I, Scores-x(3).*I));
            numerator = x(1).*(Scores-x(3)).*exp(x(2).*(Scores-x(3)));
            denominator = (1+exp(x(2).*(Scores-x(3)))).^2;
        g(2) = A'*(numerator./denominator);
            numerator = x(1).*(-x(2)).*exp(x(2).*(Scores-x(3)));
            denominator = (1+exp(x(2).*(Scores-x(3)))).^2;
        g(3) = A'*(numerator./denominator);
        g(4) = A'*(Scores);
        g(5) = A'*(I);
    end
end
