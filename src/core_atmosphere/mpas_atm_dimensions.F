module mpas_atm_dimensions

#ifdef CONST_INNER_DIMS

#ifndef CONST_NVERTLEVELS
#error "Defining CONST_INNER_DIMS requires CONST_NVERTLEVELS, CONST_MAXEDGES, CONST_MAXEDGES2, and CONST_NUM_SCALARS to be defined as well."
#endif
#ifndef CONST_MAXEDGES
#error "Defining CONST_INNER_DIMS requires CONST_NVERTLEVELS, CONST_MAXEDGES, CONST_MAXEDGES2, and CONST_NUM_SCALARS to be defined as well."
#endif
#ifndef CONST_MAXEDGES2
#error "Defining CONST_INNER_DIMS requires CONST_NVERTLEVELS, CONST_MAXEDGES, CONST_MAXEDGES2, and CONST_NUM_SCALARS to be defined as well."
#endif
#ifndef CONST_NUM_SCALARS
#error "Defining CONST_INNER_DIMS requires CONST_NVERTLEVELS, CONST_MAXEDGES, CONST_MAXEDGES2, and CONST_NUM_SCALARS to be defined as well."
#endif

    integer, parameter :: nVertLevels = CONST_NVERTLEVELS
    integer, parameter :: maxEdges = CONST_MAXEDGES
    integer, parameter :: maxEdges2 = CONST_MAXEDGES2
    integer, parameter :: num_scalars = CONST_NUM_SCALARS
#else
    integer :: nVertLevels
    integer :: maxEdges
    integer :: maxEdges2
    integer :: num_scalars
#endif


    contains


    subroutine mpas_atm_set_dims(nVertLevels_val, maxEdges_val, maxEdges2_val, num_scalars_val)

        use mpas_kind_types, only : StrKIND
        use mpas_io_units, only : stderrUnit
        use mpas_abort, only : mpas_dmpar_global_abort

        implicit none

        integer, intent(in) :: nVertLevels_val
        integer, intent(in) :: maxEdges_val
        integer, intent(in) :: maxEdges2_val
        integer, intent(in) :: num_scalars_val

        character(len=StrKIND) :: errstring1, errstring2

#ifdef CONST_INNER_DIMS

        integer :: nerrors
        character(len=StrKIND) :: errbuf

        nerrors = 0
        write(errbuf,*) ''
     
        if (nVertLevels /= nVertLevels_val) then
            write(errstring1,'(a,i4)') '       At compile, CONST_NVERTLEVELS=', CONST_NVERTLEVELS
            write(errstring2,'(a,i4)') '       At runtime, nVertLevels=', nVertLevels_val

            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            call mpas_dmpar_global_abort('ERROR: Dimension nVertLevels read from input file does not match the value used', deferredAbort=.true.)
            call mpas_dmpar_global_abort('       when compiling MPAS-Atmosphere:',                                          deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring1),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring2),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            write(errbuf,'(a,i4,a1,i4,a)') trim(errbuf)//' nVertlevels: ', CONST_NVERTLEVELS, '/', nVertLevels_val, '    '
            nerrors = nerrors + 1
        end if

        if (maxEdges /= maxEdges_val) then
            write(errstring1,'(a,i4)')'       At compile, CONST_MAXEDGES=', CONST_MAXEDGES
            write(errstring2,'(a,i4)')'       At runtime, maxEdges=', maxEdges_val

            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            call mpas_dmpar_global_abort('ERROR: Dimension maxEdges read from input file does not match the value used',    deferredAbort=.true.)
            call mpas_dmpar_global_abort('       when compiling MPAS-Atmosphere:',                                          deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring1),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring2),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            write(errbuf,'(a,i4,a1,i4,a)') trim(errbuf)//' maxEdges: ', CONST_MAXEDGES, '/', maxEdges_val, '    '
            nerrors = nerrors + 1
        end if

        if (maxEdges2 /= maxEdges2_val) then
            write(errstring1,'(a,i4)')'       At compile, CONST_MAXEDGES2=', CONST_MAXEDGES2
            write(errstring2,'(a,i4)')'       At runtime, maxEdges2=', maxEdges2_val

            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            call mpas_dmpar_global_abort('ERROR: Dimension maxEdges2 read from input file does not match the value used',   deferredAbort=.true.)
            call mpas_dmpar_global_abort('       when compiling MPAS-Atmosphere:',                                          deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring1),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring2),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            write(errbuf,'(a,i4,a1,i4,a)') trim(errbuf)//' maxEdges2: ', CONST_MAXEDGES2, '/', maxEdges2_val, '    '
            nerrors = nerrors + 1
        end if

        if (num_scalars /= num_scalars_val) then
            write(errstring1,'(a,i4)')'       At compile, CONST_NUM_SCALARS=', CONST_NUM_SCALARS
            write(errstring2,'(a,i4)')'       At runtime, num_scalars=', num_scalars_val

            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            call mpas_dmpar_global_abort('ERROR: Number of scalars read from input file does not match the value used',     deferredAbort=.true.)
            call mpas_dmpar_global_abort('       when compiling MPAS-Atmosphere:',                                          deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring1),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort(trim(errstring2),                                                                  deferredAbort=.true.)
            call mpas_dmpar_global_abort('********************************************************************************',deferredAbort=.true.)
            write(errbuf,'(a,i4,a1,i4,a)') trim(errbuf)//' num_scalars: ', CONST_NUM_SCALARS, '/', num_scalars_val, '    '
            nerrors = nerrors + 1
        end if

        if (nerrors > 0) then
            call mpas_dmpar_global_abort(trim(errbuf))
        end if
#else
        nVertLevels = nVertLevels_val
        maxEdges = maxEdges_val
        maxEdges2 = maxEdges2_val
        num_scalars = num_scalars_val
#endif

    end subroutine mpas_atm_set_dims

end module mpas_atm_dimensions
