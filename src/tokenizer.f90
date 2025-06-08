! Basic fortran Tokenizer...
! yay..

module tokenizer
    use stdlib_strings
    implicit none
    contains

    subroutine tokenize(input_string, string_length, delim, tokens)
        integer, intent(in) :: string_length
        character(:), allocatable, intent(in) :: delim
        character(:), allocatable, intent(out) :: tokens
        character(string_length), intent(in) :: input_string

        character(1000) :: buffer
        character(1) :: c
        integer :: i
        
        if (string_length == 0) then 
            print*, 'Tokenizer: String Length 0'
            return
        end if

        do while (i < string_length)
            c = slice(input_string, i, i+1)
            i = i + 1
        end do 

    end subroutine tokenize

end module tokenizer