! File Reader Module
! By Tyler McGurrin, 2025
! Made for Fortran-CC
module fileread
    implicit none
    contains

    integer function filecontents(filename, output)
        character(25) :: filename
        character(1) :: input_newline
        integer :: input_status, input_size
        character(:), allocatable :: input_buffer
        character(:), allocatable :: output
        logical :: exists

        filecontents = 0
        inquire(file=trim(filename), exist=exists, SIZE=input_size)
        if (.not. exists) then
            print*, "Input File Not Found!"
            filecontents = 1
            return
        end if
        open(unit=1, file=trim(filename), status='old', action='read', form='formatted')
        allocate(character(len=input_size)::input_buffer)
        input_status = 0
        output = ''
        do while(input_status == 0)
            if (input_status /= 0) then 
                exit
            end if
            read(1, '(A,1X)', iostat=input_status) input_buffer
            if(input_status == 0) then !<---- Added this nested if statement
                input_buffer = trim(input_buffer) // NEW_LINE(input_newline)
                output = trim(output) // trim(input_buffer)
            endif
        end do
        close(1)
    end function filecontents

end module fileread