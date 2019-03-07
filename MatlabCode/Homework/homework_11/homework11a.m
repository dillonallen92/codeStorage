clear, clc, close all

loopCond = true;

while loopCond
    
    a = input("Enter a number: ");
    b = input("Enter a number: ");
    
    if ( (mod(a,2) == 0)  && (mod(b,2) == 0) )
        fprintf("%d and %d are even numbers, and are multiples of two.\n", a, b);
    elseif (mod(a,2) == 0)
       fprintf("%d is an even number, and is a multiple of two.\n", a);
    elseif (mod(b,2) == 0)
        fprintf("%d is an even number. and is a multiple of two.\n", b);
    else
        disp("Neither of the numbers are even.\n");
    end
    
    if ( mod(a,2) == 0 && mod(a,3) == 0)
        fprintf("%d is a multiple of 2 and 3.\n",a);
    elseif ( mod(a,3) == 0)
        fprintf("%d is a multiple of 3.\n",a)
    end
    
    if( mod(b,2) == 0 && mod(b,3) == 0)
        fprintf("%d is a multiple of 2 and 3.\n", b);
    elseif (mod(b,3) == 0)
        fprintf("%d is a multiple of 3.\n", b);
    end
    
    inputCond = input("Would you like to continue? (y/n): ", 's');
    if inputCond == 'y'
        disp("Continued");
    else
        loopCond = false;
    end
end