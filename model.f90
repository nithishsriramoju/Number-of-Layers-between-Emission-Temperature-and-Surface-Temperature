!     Model to profile Temperture with respect to layers of atmosphere.
!     Record of Revisions
!     Date                 Programmer              Description of change
!     =====                ==========              =====================
!   12/02/2021       Nithish Kumar Sriramoju            Original Code
program steadystate
implicit none
   integer :: i,n
   real :: T_s,T_e
   real, dimension (:),allocatable :: T
   print*,'Enter the Surface Temperature'
   read(*,*) T_s
   print*,'Enter the Emission Temperature'
   read(*,*) T_e
   n = floor((T_s/T_e)**4)
   print*,'Number of layers are',n-1
   allocate(T(n))
   T(1) = T_s
   T(n) = T_e
   do i = 2,n-1
   	T(i) = (((T(i-1))**4)-(T_e)**4)**0.25
   end do
   open (2, file='data.txt', status='unknown')
   do, i=1,n
   	write(2,*) T(i),i
   enddo
   close (2)
   call execute_command_line('gnuplot -p gnuplot.plt')
end program 
