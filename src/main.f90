program main
    ! Sample program for f90getopt function

    use f90getopt
    implicit none
    
    ! local variables
    character(len=1) :: short ! getopt-character
    character(:), allocatable :: input
    character(:), allocatable :: output
    character(:), allocatable :: input_buffer
    character(1) :: input_newline
    logical :: exists
    integer :: input_status, input_size

    ! START for longopts only (optional)
    ! ----------------------------------
    ! option_s derived type:
    !   1st value = long option name (character array, max. 80)
    !   2nd value = if option has an argument (logical)
    !   3rd value = short option name (single character), same as in getopt()
    ! option_s is not needed if you just use short options
    type(option_s) :: opts(4)
    opts(1) = option_s("output-file", .false., "o")
    opts(2) = option_s("version",  .true.,  "v")
    opts(3) = option_s("help",  .false., "h")
    opts(4) = option_s("input-file",  .false., "i")
    ! END longopts


    ! If no options were committed
    ! ----------------------------
    if (command_argument_count() .eq. 0) then
      print*, "ERROR: Program has options: -i --input-file | -o --output-file | -v --version | -h --help"
    end if


    ! START Processing options
    ! ------------------------
    ! Process short options one by one and long options if specified in option_s
    !
    ! getopt(optstr, longopt):
    !  - optstr  = character array of short option characters without a space
    !              colon ":" after a character says that this option requires an argument
    !  - longopt = long option declaration, if specified in option_s (optional)
    do
        short = getopt("o:i:hv", opts) ! Separate getopt-character for ifort compatibility 
        select case(short)
            case(char(0)) ! When all options are processed
                exit
            case("o")
                print*, "Output File: ", trim(optarg) 
            case("i")
                print*, "Input File: ",  trim(optarg)
                inquire(file=trim(optarg), exist=exists, SIZE=input_size)
                if (.not. exists) then
                    print*, "Input File Not Found!"
                    exit
                end if
                open(unit=1, file=trim(optarg), status='old', action='read', form='formatted')
                print*, "Input Data: "
                allocate(character(len=input_size)::input_buffer)
                input_status = 0
                input = ''
                do while(input_status == 0)
                    if (input_status /= 0) then 
                        exit
                    end if
                    read(1, '(A,1X)', iostat=input_status) input_buffer
                    if(input_status == 0) then !<---- Added this nested if statement
                        print*, input_buffer
                        input_buffer = trim(input_buffer) // NEW_LINE(input_newline)
                        input = trim(input) // trim(input_buffer)
                    endif
                end do
                print*, trim(input)
                close(1)
            case("h")
                print*, "USAGE: -i --input-file | -o --output-file | -v --version | -h --help"
            case("v")
                print*, "Fortran C Compiler Version RD-00001"
        end select
    end do
    ! END processing options


end program main