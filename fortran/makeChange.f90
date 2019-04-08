program make_change
IMPLICIT NONE
character(len=8) :: DateINFO
character(len=4) :: Year, Month*2, Day*2
character(len=10) :: TimeINFO
character(len=2) :: Hour, Minute
integer :: input, money
CALL DATE_AND_TIME(DateINFO, TimeINFO)
Year = DateINFO(1:4)
Month = DateINFO(5:6)
Day = DateINFO(7:8)
Hour = TimeINFO(1:2)
Minute = TimeINFO(3:4)
write(*,fmt="(a,a)", advance='no') Month,"-"
write(*,fmt="(a,a)", advance='no') Day,"-"
write(*,fmt="(a,a)", advance='no') Year,","
write(*,fmt="(a,a)", advance='no') Hour,":"
write(*,fmt="(a)") Minute
input =  GetInput()
money = MakeChange(input)
write(*,*)

CONTAINS	
   INTEGER FUNCTION GetInput()   
     IMPLICIT NONE
     integer :: Input_Value, error
     DO
       write(*, "('enter a number to make change for: ')", advance='no') 
       read (*,'(i10)', iostat=error) Input_Value
       if (Input_Value > 0 .AND. Input_Value < 100 .AND. error==0) EXIT
       write(*,*) 'ERROR. Try again.'       
     END DO
     GetInput = Input_Value
   END FUNCTION GetInput

   INTEGER FUNCTION MakeChange(change)
     IMPLICIT NONE
     integer :: quarters,dimes,nickels,pennies,change
     if(change/25 .NE. 0) THEN
       quarters = change/25
       change = MOD(change,25)
       write(*,fmt="(1x,i0,a)",advance='no') quarters, " Quarter"
     end if
     if (change/10 .NE. 0) THEN
       dimes = change/10
       change = MOD(change,10)
       write(*,fmt="(1x,i0,a)",advance='no') dimes, " Dime"
     end if
     if (change/5 .NE. 0) THEN
       nickels = change/5
       change = MOD(change,5)
       write(*,fmt="(1x,i0,a)",advance='no') nickels, " Nickel" 
     end if 
     if (change/1 .NE. 0) THEN
       pennies = change/1
       change = MOD(change,1)
       write(*,fmt="(1x,i0,a)",advance='no') pennies, " Penny"
     end if
   END FUNCTION MakeChange   

end program make_change