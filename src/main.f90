program main
    ! Sample program for f90getopt function

    use f90getopt
    use tokenizer
    use fileread
    implicit none

    ! use token%type to modify type
    type :: Token
        integer :: type
        character :: value
    end type Token
    
    ! local variables
    character(len=1) :: short ! getopt-character
    character(:), allocatable :: output
    character(:), allocatable :: input, tokenized_input, input_deliminators

    integer :: pos

    enum, bind(c)
        enumerator :: TOKEN_RETURN = 0
        enumerator :: TOKEN_INT_LIT = 1
        enumerator :: TOKEN_SEMI = 2
    end enum
    

    type(option_s) :: opts(4)
    opts(1) = option_s("output-file", .false., "o")
    opts(2) = option_s("version",  .true.,  "v")
    opts(3) = option_s("help",  .false., "h")
    opts(4) = option_s("input-file",  .false., "i")

    if (command_argument_count() .eq. 0) then
      print*, "ERROR: Program has options: -i --input-file | -o --output-file | -v --version | -h --help"
    end if

    do
        short = getopt("o:i:hv", opts) ! Separate getopt-character for ifort compatibility 
        select case(short)
            case(char(0)) ! When all options are processed
                exit
            case("o")
                print*, "Output File: ", trim(optarg) 
            case("i")
                print*, "Input File: ",  trim(optarg)
                if (filecontents(optarg, input) /= 0) then
                    exit
                end if
                print*, "Input Data: ", input
                call tokenize(input, len(input), input_deliminators, tokenized_input)
                print*, "Tokenized Input Data: ", tokenized_input
                
            case("h")
                print*, "USAGE: -i --input-file | -o --output-file | -v --version | -h --help"
            case("v")
                print*, "Fortran C Compiler Version RD-00003"
        end select
    end do
    ! END processing options


end program main