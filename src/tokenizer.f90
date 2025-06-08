! Basic fortran Tokenizer...
! yay..

module tokenizer
    use stdlib_strings
    use vector
    use, intrinsic :: iso_c_binding
    implicit none
    contains

    subroutine tokenize(input_string, string_length, delim, tokens)
        integer, intent(in) :: string_length
        character(:), allocatable, intent(in) :: delim
        character(:), allocatable, intent(out) :: tokens
        character(string_length), intent(in) :: input_string

        type(vec) :: buf
        character :: buffer
        character(1) :: c
        integer :: i
        
        if (string_length == 0) then 
            print*, 'ERR: Tokenizer: String Length 0'
            return
        end if

        do while (i < string_length)
            c = slice(input_string, i, i+1)
            if (token_isalpha(c) == 1) then
                call buf%push_back(c) ! i think this is correct?
                i = i + 1
                do while (token_isalnum(slice(input_string, 1, i+1)) == 1)
                    call buf%push_back(slice(input_string, 1, i+1))
                    i = i + 1
                end do
                i = i - 1
                ! call vector_get(buf, 1) ! FUCK FORTRAN VECTOR...
                if (buffer == 'return') then

                end if
            end if
        end do 

    end subroutine tokenize

    integer function token_isalpha(input_character) result(res)
        character(1), intent(in) :: input_character

        if ( input_character == 'a') then
        elseif (input_character == 'b') then
        elseif (input_character == 'c') then
        elseif (input_character == 'd') then
        elseif (input_character == 'e') then
        elseif (input_character == 'f') then
        elseif (input_character == 'g') then
        elseif (input_character == 'h') then
        elseif (input_character == 'i') then
        elseif (input_character == 'j') then
        elseif (input_character == 'k') then
        elseif (input_character == 'l') then
        elseif (input_character == 'm') then
        elseif (input_character == 'n') then
        elseif (input_character == 'o') then
        elseif (input_character == 'p') then
        elseif (input_character == 'q') then
        elseif (input_character == 'r') then
        elseif (input_character == 's') then
        elseif (input_character == 't') then
        elseif (input_character == 'u') then
        elseif (input_character == 'v') then
        elseif (input_character == 'w') then
        elseif (input_character == 'x') then
        elseif (input_character == 'y') then
        elseif (input_character == 'z') then
        elseif (input_character == 'A') then
        elseif (input_character == 'B') then
        elseif (input_character == 'C') then
        elseif (input_character == 'D') then
        elseif (input_character == 'E') then
        elseif (input_character == 'F') then
        elseif (input_character == 'G') then
        elseif (input_character == 'H') then
        elseif (input_character == 'I') then
        elseif (input_character == 'J') then
        elseif (input_character == 'K') then
        elseif (input_character == 'L') then
        elseif (input_character == 'M') then
        elseif (input_character == 'N') then
        elseif (input_character == 'O') then
        elseif (input_character == 'P') then
        elseif (input_character == 'Q') then
        elseif (input_character == 'R') then
        elseif (input_character == 'S') then
        elseif (input_character == 'T') then
        elseif (input_character == 'U') then
        elseif (input_character == 'V') then
        elseif (input_character == 'W') then
        elseif (input_character == 'X') then
        elseif (input_character == 'Y') then
        elseif (input_character == 'Z') then
            res = 1
            return
        else
            res = 0
            return
        end if
        
        return 
    end function token_isalpha

    integer function token_isalnum(input_character) result(res)
        character(1), intent(in) :: input_character

        if ( input_character == 'a') then
        elseif (input_character == 'b') then
        elseif (input_character == 'c') then
        elseif (input_character =='d') then
        elseif (input_character == 'e') then
        elseif (input_character == 'f') then
        elseif (input_character == 'g') then
        elseif (input_character == 'h') then
        elseif (input_character == 'i') then
        elseif (input_character == 'j') then
        elseif (input_character == 'k') then
        elseif (input_character == 'l') then
        elseif (input_character == 'm') then
        elseif (input_character == 'n') then
        elseif (input_character == 'o') then
        elseif (input_character == 'p') then
        elseif (input_character == 'q') then
        elseif (input_character == 'r') then
        elseif (input_character == 's') then
        elseif (input_character == 't') then
        elseif (input_character == 'u') then
        elseif (input_character == 'v') then
        elseif (input_character == 'w') then
        elseif (input_character == 'x') then
        elseif (input_character == 'y') then
        elseif (input_character == 'z') then
        elseif (input_character == '1') then
        elseif (input_character == '2') then
        elseif (input_character == '3') then
        elseif (input_character == '4') then
        elseif (input_character == '5') then
        elseif (input_character == '6') then
        elseif (input_character == '7') then
        elseif (input_character == '8') then
        elseif (input_character == '9') then
        elseif (input_character == '0') then
        elseif (input_character == 'A') then
        elseif (input_character == 'B') then
        elseif (input_character == 'C') then
        elseif (input_character == 'D') then
        elseif (input_character == 'E') then
        elseif (input_character == 'F') then
        elseif (input_character == 'G') then
        elseif (input_character == 'H') then
        elseif (input_character == 'I') then
        elseif (input_character == 'J') then
        elseif (input_character == 'K') then
        elseif (input_character == 'L') then
        elseif (input_character == 'M') then
        elseif (input_character == 'N') then
        elseif (input_character == 'O') then
        elseif (input_character == 'P') then
        elseif (input_character == 'Q') then
        elseif (input_character == 'R') then
        elseif (input_character == 'S') then
        elseif (input_character == 'T') then
        elseif (input_character == 'U') then
        elseif (input_character == 'V') then
        elseif (input_character == 'W') then
        elseif (input_character == 'X') then
        elseif (input_character == 'Y') then
        elseif (input_character == 'Z') then
            res = 1
            return
        else
            res = 0
            return
        end if
        
        return 
    end function token_isalnum

end module tokenizer