program cashregister
    implicit none

    REAL :: total, price, tax_rate, tax, subtotal, paid, change, owe

    tax_rate = 0.06
    total = 0
    tax = 0
    subtotal = 0
    price = 0
    paid = 0
    change = -1
    owe = 0

    !Add the prices together
    print *, "Enter price of product"
    read *, price

    do while (price > 0)
        total = total + price

        print *, "Enter price of product or 0 to end adding products"
        read *, price
    enddo

    !Calculate tax
    tax = total * tax_rate

    !Calculate the subtotal
    subtotal = total + tax
    print *, "The subtotal is ", subtotal

    !Get what the customer paid
    print *, "Enter amount paid:"
    read *, paid

    !Calculate change
    change = paid - subtotal
    do while (change < 0)
            owe = -change
            print *, "You still owe ", owe
            print *, "Enter amount paid:"
            paid = 0
            change = 0
            read *, paid
            change = paid - owe
        if (change > 0) then
            exit
        endif
    enddo

    print *, "Your change is ", change
END PROGRAM