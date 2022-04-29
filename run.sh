ifort -c -qmkl $MKLROOT/include/mkl_rci.f90 diff_conv_imp.f90 stdlib_linalg_diag.f90 stdlib_math_linspace.f90 stdlib_math.f90 stdlib_kinds.f90 stdlib_optval.f90 
ifort -qmkl diff_conv_imp.o stdlib_linalg_diag.o stdlib_math.o stdlib_math_linspace.o stdlib_kinds.o stdlib_optval.o

#/Users/attari.v/stdlib/build/src/stdlib_math.f90 /Users/attari.v/stdlib/build/src/CMakeFiles/fortran_stdlib.dir/stdlib_math.f90.o /Users/attari.v/stdlib/build/src/mod_files/stdlib_math.mod 
