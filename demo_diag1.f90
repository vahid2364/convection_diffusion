program demo_diag1
    use stdlib_linalg, only: diag
    implicit none
    real, allocatable :: A(:,:)
    integer :: i
    A = diag([(1,i=1,6)]) ! creates a 10 by 10 identity matrix
    write(*,'(1x,6F5.1)') A
end program demo_diag1
