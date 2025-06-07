! Basic fortran Tokenizer...
! yay..

module tokenizer
    implicit none
    contains

    subroutine prttkn0(str,del)
        implicit none
        character (len=9000), intent(in) :: str
        character (len=20), intent(in) :: del
        character (len=100) :: tkn
        integer :: pos
        print *,"Delimiters:"
        print *,del
        print *,"str:"
        print *,str
        pos=1
        !
        print *,"token:"
        call engtkn0(str,del,pos,tkn)
        do while (tkn/="")
        ! do while (pos<LEN_TRIM(str))!works
            print *,tkn
            call engtkn0(str,del,pos,tkn)
        end do
        print *,tkn
        print *,""
        return 
        !
    end subroutine
    !'-------------------------------------------------
    !subroutine
    !end subroutine
    !'-------------------------------------------------
    subroutine engtkn0(str,del,pos,tkn)
        implicit none
        !
        character(len=20) :: eof,whtsp,nul
        COMMON eof,whtsp,nul
        !
        character (len=9000), intent(in) :: str
        character (len=20), intent(in) :: del
        integer, intent(inout) :: pos
        character (len=100),intent(out) :: tkn
        integer :: oldpos,newpos
        !
        tkn=""
        if (str=="") return 
        oldpos=pos
        if (del==whtsp) then!if (del=="._~#!',:;-") then
        call Delim0(str,del,oldpos,newpos)
        pos=newpos
        if (LEN_TRIM(str)<=pos) return
        oldpos=pos
        call Tkn0(str,del,oldpos,newpos)
        tkn=str(oldpos:newpos-1)
        pos=newpos
        return 
        else if (del==eof) then!else if (del=="_") then
        oldpos=pos
        call Tkndelim0(str,del,oldpos,newpos)
        tkn=str(oldpos:newpos)
        pos=newpos+1
        if (index(tkn,trim(del))==0) then
            tkn=trim(tkn)//trim(del)
        end if
        return
        else if (del==nul) then!else if (del=="") then
        tkn=str(pos:pos)
        pos=pos+1
        return 
        end if
        !**************************************************
        Contains
        !'-------------------------------------------------
        subroutine Delim0(str,del,oldpos,newpos)
            implicit none
            character (len=9000), intent(in) :: str
            character (len=20), intent(in) :: del
            integer, intent(in) :: oldpos
            integer, intent(out) :: newpos
            if (LEN_TRIM(str)<pos) return 
            do newpos=oldpos,LEN_TRIM(str)
                if (index(del,str(newpos:newpos))<1) exit
            end do 
        end subroutine
            !'-------------------------------------------------
        subroutine Tkn0(str,del,oldpos,newpos)
            implicit none
            character (len=1000), intent(in) :: str
            character (len=20), intent(in) :: del
            integer, intent(in) :: oldpos
            integer, intent(out) :: newpos
            do newpos=oldpos,LEN_TRIM(str)
                if (index(del,str(newpos:newpos))>0) exit
            end do 
        end subroutine
            !'-------------------------------------------------
        subroutine Tkndelim0(str,del,oldpos,newpos)
            implicit none
            character (len=9000), intent(in) :: str
            character (len=20), intent(in) :: del
            integer, intent(in) :: oldpos
            integer, intent(out) :: newpos
            do newpos=oldpos,LEN_TRIM(str)
                if (index(str(oldpos:newpos),trim(del))>0) exit
            end do 
        end subroutine
        !'-------------------------------------------------
        !**************************************************
    end subroutine

end module tokenizer