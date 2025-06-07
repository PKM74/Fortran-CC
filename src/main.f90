program main
    use f90getopt
    implicit none
    character(len=*), parameter :: VERSION  = '1.0'
    integer                     :: attempts = 1
    type(option_s)              :: opts(2)

    opts(1) = option_s('attempts', .true.,  'a')
    opts(2) = option_s('version',  .false., 'v')

    do
        select case (getopt('a:v', opts))
            case (char(0))
                exit
            case ('g')
                read (optarg, '(i3)') attempts
            case ('v')
                print '(a, f3.1)', 'version ', VERSION
                stop
        end select
    end do

    print '(a, i3)', 'number of attempts: ', attempts
end program main