!! Author: Dr. Vahid Attari - attari.v@tamu.edu
!! Group: Computational Materials Science group - Materials Sc. & Eng. - Texas A&M University
!! 
!! For compilation: execute ./run.sh and then ./a.out
!!
!! Based on Intel Fortran MKL library for solving system of linear equations ----> Linked dynamically
!! Based on Fortran Standard Library ----> stdlib ----> Linked staticly 
!!
program diff_conv

	use stdlib_linalg, only: diag
	use stdlib_math, only: linspace
	use stdlib_kinds, only: int16, sp	
	
	!Implicit REAL(A-H,O-Z)
    implicit none

    character(len=*), parameter :: OUT_FILE = 'data.csv'   ! Output file.
    character(len=*), parameter :: PLT_FILE = 'plot.py'    ! Gnuplot or python file.
    integer :: fu
	
    integer, parameter :: Nx = 40        
    integer, parameter :: kind=4
	real(kind), allocatable :: AA(:,:)
    real(kind), allocatable :: a_mid(:)
    real(kind), allocatable :: a_top(:)
    real(kind), allocatable :: a_bot(:)
    real(kind), allocatable :: C_exp(:),C_imp(:),CNp1(:),Cn(:),Q(:),BB(:)
    real(kind), allocatable :: cc(:),AnSol(:)
    integer(int16) :: start,end

    !! ***** djacobi variables ******
    integer :: m,n
    real(kind), parameter :: eps=0.0000000001D0
    integer :: res
    real(kind), allocatable, dimension(:,:) :: fjac

    !! ***** dgetri variables ******
    integer :: lda,lwork,info
    integer, allocatable:: ipiv(:)
    real(kind) :: work(40)

    !! ***** dgetrs variables ******
    integer :: nrhs,ldb
           
    integer :: i
	real(kind), parameter :: L=1000; ! in ft
	real(kind), parameter :: dT=1d0; 	  !in day
	real(kind), parameter :: dX=L/real(Nx);
	real(kind) :: v=1.5d0; ! velocity of conc. in ft/day
	real(kind) :: D=93.01; ! diffusion coef. in ft**2/day
	real(kind) :: Cinitial=0;
	real(kind) :: Cb=1; ! boundary concentration
	real(kind) :: alpha,beta,a,b
	real(kind) :: t
	
    INCLUDE 'mkl_rci.fi'

	alpha=D*dT/dX**2;
	a=alpha;

	beta=v*dT/dX;
	b=beta;

	! EXPLICIT
	allocate(a_mid(Nx))
	allocate(a_top(Nx-1))
	allocate(a_bot(Nx-1))

	a_mid = [1-2*b-3*a,spread((1-b-2*a),1,Nx-2),1-b-a]
	a_top = [spread(a,1,Nx-1)]
	a_bot = [spread(a+b,1,Nx-1)]

	allocate(AA(Nx,Nx))
	AA = diag(a_top,1) + diag(a_mid) + diag(a_bot,-1) ! creates a Nx by Nx identity matrix
	!write(*,'(1x,20F6.3)') AA

	allocate(C_exp(Nx),Q(Nx),Cn(Nx),Cnp1(Nx))
	cn  = Cinitial;
	Q   = 0.0d0
	Q(1)= -2*Cb*(b+a);

	do i=1,200
		Cnp1=matmul(AA,cn)+Q;
		cn=Cnp1;
		C_exp=abs(Cnp1);
	enddo

	!!! IMPLICIT
	!AA=diag([1+2*b+3*a,(1+b+2*a)*ones(1,18),1+b+a])+diag(((-b-a)*ones(1,19)),-1)+diag((-a*ones(1,19)),1);
	a_mid = [1+2*b+3*a,spread((1+b+2*a),1,Nx-2),1+b+a]
	a_top = [spread(-a,1,Nx-1)]
	a_bot = [spread(-b-a,1,Nx-1)]

	AA = diag(a_top,1) + diag(a_mid) + diag(a_bot,-1) ! creates a Nx by Nx identity matrix

	cn  = 0;
	Q   = 0.0d0
	Q(1)= 2*Cb*(a+b);

	m = Nx; n=Nx; lda = Nx; ldb=Nx;
	
	allocate(fjac(Nx,Nx),ipiv(Nx),C_imp(Nx),BB(Nx))

	
	do i=1,200
		
		fjac = AA		
		BB=cn+Q
            								
		!! ************* The LU factorization of a general m-by-n matrix.
        ipiv = max(1,n)
        call sgetrf( m, n, fjac, lda, ipiv, info )

        !! ************* The inverse inv(A) of a general matrix A.
        !lwork=Nx*1000
        !call sgetri( n, fjac, lda, ipiv, work, lwork, info )
        !if(info.ne.0) write(*,*) 'LU factorization was not successful'
        !if(info.ne.0) stop
        
        !! ************* The inverse inv(A) of a general matrix A.
        nrhs = 1
        call sgetrs( 'N', n, nrhs, fjac, lda, ipiv, BB, ldb, info )
        if(info.ne.0) write(*,*) 'solution was not successful'
        if(info.ne.0) stop
                
        !write(*,'(1x,20F7.4)') BB
        !pause
        
		Cnp1 = BB
		cn=Cnp1;
		C_imp=Cnp1;
		
	enddo

	!ANALYTICAL SOLUTION 
	allocate(cc(Nx+1),AnSol(Nx+1))
	start=0;end=L
	cc=linspace(start,end,Nx+1);
	write(*,*) 
	t=200;
	AnSol=1./2.*(erfc((cc-v*t)/(2.*sqrt(D*t)))+exp(v*cc/D)*erfc((cc+v*t)/(2.*sqrt(D*t))));

	!! Write result
	Write(*,*) 'explicit:'
	Write(*,*) C_exp
	Write(*,*) 'implicit'
	Write(*,*) C_imp
	Write(*,*) 'analytical:'
	Write(*,*) AnSol

    open (action='write', file=OUT_FILE, newunit=fu, status='replace')

    do i = 1, Nx
        write (fu, '(2x,5F9.4)') cc(i), C_exp(i), C_imp(i), AnSol(i)
    end do

    close (fu)

    call execute_command_line('python -m plot ' // OUT_FILE)


end program diff_conv
