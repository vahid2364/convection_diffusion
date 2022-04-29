# Project Title: Convection-diffusion equation solver

Convection–diffusion equation solver 1D - compares explicit, implicit, and analytical solutions

## Description

More information about convection-diffusion equation: https://en.wikipedia.org/wiki/Convection–diffusion_equation 

## Getting Started

### Dependencies

* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* ex. Windows 10

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```

## Authors

Contributors names and contact info

ex. Dominique Pizzie  
ex. [@DomPizzie](https://twitter.com/dompizzie)

## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)

-------

# convection_diffusion equation solver
Convection–diffusion equation solver 1D - compares explicit, implicit, and analytical solutions

More about convection-diffusion equation:
https://en.wikipedia.org/wiki/Convection–diffusion_equation 

Compilation: 

./run.sh

or 

ifort -c -qmkl $MKLROOT/include/mkl_rci.f90 diff_conv_imp.f90 stdlib_linalg_diag.f90 stdlib_math_linspace.f90 stdlib_math.f90 stdlib_kinds.f90 stdlib_optval.f90
ifort -qmkl diff_conv_imp.o stdlib_linalg_diag.o stdlib_math.o stdlib_math_linspace.o stdlib_kinds.o stdlib_optval.o

Then, execute: ./a.out

Pre-compiled on Mac OS using Intel oneAPI Fortran 2021b

Fortran standard Library: https://stdlib.fortran-lang.org

Fortran MKL Library: https://www.intel.com/content/www/us/en/develop/documentation/onemkl-developer-reference-fortran/top.html 


![data](https://user-images.githubusercontent.com/11892854/165896367-37355c9f-a0fe-4d13-8ec0-dbe0b0c215ce.png)




