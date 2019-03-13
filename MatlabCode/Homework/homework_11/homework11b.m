
uInput = input('Enter a number to check if it is prime or not: ');

isPrime(uInput);

function isPrime(x)
   if ( x == 1 )
       disp("1 is not prime");
   else
       k = 2;
       val = 0;
       while k < x/2
           val = mod(x, k);
           if (val == 0)
               disp("Composite");
               break;
           else
                k = k+1;
           end
       end

       if (val ~= 0)
           disp("Prime");
       end
   end
end