!
! Copyright (c) 1989-2017 by D. R. Hamann, Mat-Sim Research LLC and Rutgers
! University
!
! 
! This program is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
! 
! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.
! 
! You should have received a copy of the GNU General Public License
! along with this program.  If not, see <http://www.gnu.org/licenses/>.
!
! creates appropriate input file for GNUPLOT

 subroutine gnu_script(lmax,lloc,nproj,nxtra,lpx)

!lmax  maximum angular momentum
!lloc  angular momentum for local potential (lloc=4 for polynomial, etc.)
!nxtra  number of valence states with pseudized shallow-core angular momenta
!lpx  angular momenta of above states

 implicit none

!Input variables
 integer :: lmax,lloc,nxtra
 integer :: lpx(6),nproj(6)

!Output -- printing only

!Local variables
 integer ii,jj,l1

 character (len=2), parameter :: cbs=',\'

 character(len=80) :: gln(54)
 character(len=4) :: lead(6)
 character(len=80) :: pse,set,lset(12)
 character(len=50) :: plot_title(6)
 character(len=40) :: x_label(3)

 lead(:)='    '
 lead(1)='plot'

 plot_title(1)='set title "t1 Ion Pseudopotentials"'
 plot_title(2)='set title "t1 Charge Densities"'
 plot_title(3)='set title "t1 Wave Functions"'
 plot_title(4)='set title "t1 Projector Wave Functions"'
 plot_title(5)='set title "t1 ARCTAN(Log Derivatives)"'
 plot_title(6)='set title "t1 Energy Error per Electron (Ha)"'

 x_label(1)='set xlabel "Radius (a_B)"'
 x_label(2)='set xlabel "Energy (Ha)"'
 x_label(3)='set xlabel "Cutoff Energy (Ha)"'
 
 pse='pause -1 "Hit enter to continue"'

 lset(1)='set style line 1 lw 3 lt 1 lc rgb "#D00000"'
 lset(2)='set style line 2 lw 3 lt 1 lc rgb "#00B000"'
 lset(3)='set style line 3 lw 3 lt 1 lc rgb "#2020FF"'
 lset(4)='set style line 4 lw 3 lt 1 lc rgb "#FF8000"'
 lset(5)='set style line 5 lw 3 lt 1 lc rgb "#E000E0"'
 lset(6)='set style line 6 lw 3 lt 1 lc rgb "#303030"'
 lset(7)='set style line 7 lw 3 lt 2 lc rgb "#D00000"'
 lset(8)='set style line 8 lw 3 lt 2 lc rgb "#00B000"'
 lset(9)='set style line 9 lw 3 lt 2 lc rgb "#2020FF"'
 lset(10)='set style line 10 lw 3 lt 2 lc rgb "#FF8000"'
 lset(11)='set style line 11 lw 3 lt 2 lc rgb "#E000E0"'
 lset(12)='set style line 12 lw 3 lt 2 lc rgb "#303030"'

 gln( 1)='    "<grep ''!p'' t1" using 2:4 title "S" with lines ls 1'
 gln( 2)='    "<grep ''!p'' t1" using 2:5 title "P" with lines ls 2'
 gln( 3)='    "<grep ''!p'' t1" using 2:6 title "D" with lines ls 3'
 gln( 4)='    "<grep ''!p'' t1" using 2:7 title "F" with lines ls 4'
 gln( 5)='    "<grep ''!L'' t1" using 2:3 title "Loc" with lines ls 11'

 gln( 6)='    "<grep ''!r'' t1" using 2:3 title "rhoV" with lines ls 1'
 gln( 7)='    "<grep ''!r'' t1" using 2:4 title "rhoC" with lines ls 2'
 gln( 8)='    "<grep ''!r'' t1" using 2:5 title "rhoM" with lines ls 3'

 gln( 9)='    "<grep ''&     0'' t1" using 3:4 title "S full" with lines ls 1'
 gln(10)='    "<grep ''&     0'' t1" using 3:5 title "S pseudo" with lines ls 8'
 gln(11)='    "<grep ''&     1'' t1" using 3:4 title "P full" with lines ls 3'
 gln(12)='    "<grep ''&     1'' t1" using 3:5 title "P pseudo" with lines ls 10'
 gln(13)='    "<grep ''&     2'' t1" using 3:4 title "D full" with lines ls 5'
 gln(14)='    "<grep ''&     2'' t1" using 3:5 title "D pseudo" with lines ls 12'
 gln(15)='    "<grep ''&     3'' t1" using 3:4 title "F full" with lines ls 1'
 gln(16)='    "<grep ''&     3'' t1" using 3:5 title "F pseudo" with lines ls 8'
 gln(17)='    "<grep ''&     4'' t1" using 3:4 title "Sx full" with lines ls 1'
 gln(18)='    "<grep ''&     4'' t1" using 3:5 title "Sx pseudo" with lines ls 8'
 gln(19)='    "<grep ''&     5'' t1" using 3:4 title "Px full" with lines ls 3'
 gln(20)='    "<grep ''&     5'' t1" using 3:5 title "Px pseudo" with lines ls 10'
 gln(21)='    "<grep ''&     6'' t1" using 3:4 title "Dx full" with lines ls 5'
 gln(22)='    "<grep ''&     6'' t1" using 3:5 title "Dx pseudo" with lines ls 12'

 gln(23)='    "<grep ''!      0'' t1" using 3:4 title "S    full" with lines ls 1'
 gln(24)='    "<grep ''!      0'' t1" using 3:5 title "S0 pseudo" with lines ls 8'
 gln(25)='    "<grep ''!      0'' t1" using 3:5 title "S1 pseudo" with lines ls 8'
 gln(26)='    "<grep ''!      0'' t1" using 3:5 title "S2 pseudo" with lines ls 8'

 gln(27)='    "<grep ''!      1'' t1" using 3:4 title "P    full" with lines ls 3'
 gln(28)='    "<grep ''!      1'' t1" using 3:5 title "P0 pseudo" with lines ls 10'
 gln(29)='    "<grep ''!      1'' t1" using 3:5 title "P1 pseudo" with lines ls 10'
 gln(30)='    "<grep ''!      1'' t1" using 3:5 title "P2 pseudo" with lines ls 10'

 gln(31)='    "<grep ''!      2'' t1" using 3:4 title "D    full" with lines ls 5'
 gln(32)='    "<grep ''!      2'' t1" using 3:5 title "D0 pseudo" with lines ls 12'
 gln(33)='    "<grep ''!      2'' t1" using 3:5 title "D1 pseudo" with lines ls 12'
 gln(34)='    "<grep ''!      2'' t1" using 3:5 title "D2 pseudo" with lines ls 12'

 gln(35)='    "<grep ''!      3'' t1" using 3:4 title "F    full" with lines ls 1'
 gln(36)='    "<grep ''!      3'' t1" using 3:5 title "F0 pseudo" with lines ls 8'
 gln(37)='    "<grep ''!      3'' t1" using 3:5 title "F1 pseudo" with lines ls 8'
 gln(38)='    "<grep ''!      3'' t1" using 3:5 title "F2 pseudo" with lines ls 8'

 gln(39)='    "<grep ''@     0'' t1" using 3:4 title "S1 pseudo" with lines ls 1'
 gln(40)='    "<grep ''@     0'' t1" using 3:5 title "S2 pseudo" with lines ls 2'
 gln(41)='    "<grep ''@     1'' t1" using 3:4 title "P1 pseudo" with lines ls 3'
 gln(42)='    "<grep ''@     1'' t1" using 3:5 title "P2 pseudo" with lines ls 4'
 gln(43)='    "<grep ''@     2'' t1" using 3:4 title "D1 pseudo" with lines ls 5'
 gln(44)='    "<grep ''@     2'' t1" using 3:5 title "D2 pseudo" with lines ls 6'
 gln(45)='    "<grep ''@     3'' t1" using 3:4 title "F1 pseudo" with lines ls 1'
 gln(46)='    "<grep ''@     3'' t1" using 3:5 title "F2 pseudo" with lines ls 2'

 gln(47)='    "<grep ''!C     0'' t1" using 3:4 title "S" with lines ls 1'
 gln(48)='    "<grep ''!C     1'' t1" using 3:4 title "P" with lines ls 2'
 gln(49)='    "<grep ''!C     2'' t1" using 3:4 title "D" with lines ls 4'
 gln(50)='    "<grep ''!C     3'' t1" using 3:4 title "F" with lines ls 5'

 write(6,'(a)') 'GNUSCRIPT'

 set='set term wxt font "arial,14" size 800,600'
 write(6,'(a/)') trim(set)
 set='set termoption dash'
 write(6,'(a/)') trim(set)
 do ii=1,12
   write(6,'(a/)') trim(lset(ii))
 end do

 write(6,'(a/)') trim(plot_title(1))
 write(6,'(a/)') trim(x_label(1))

 do l1=1,lmax+1
  write(6,'(2a)',advance='no') lead(l1),trim(gln(l1))
  if(l1<lmax+1.or. lloc==4) then
   write(6,'(a)') cbs
  else
   write(6,'(/)')
  end if
 end do
 
 if(lloc==4) then
  l1=5
  write(6,'(2a)',advance='no') lead(l1),trim(gln(l1)) 
  ! GIAN added this part to append ',\' 
  write(6,'(a)') cbs
 end if

 ! GIAN added this part to plot vo = vh + vxc
 ! ------------------------------------------
 write(6,'(2a)') '    ',trim('    "<grep ''!Vhxc'' t1" using 2:3 title "Vhxc" with lines ls 12')
 ! ------------------------------------------ 

 write(6,'(/a/)') trim(pse)

 write(6,'(a/)') trim(plot_title(2))
 write(6,'(a/)') trim(x_label(1))

 do ii=1,3
  write(6,'(2a)',advance='no') lead(ii),trim(gln(ii+5))
  if(ii<3) then
   write(6,'(a)') cbs
  else
   write(6,'(/)')
  end if
 end do

 write(6,'(/a/)') trim(pse)

 do l1=1,lmax+1

  write(6,'(a/)') trim(plot_title(3))
  write(6,'(a/)') trim(x_label(1))

  write(6,'(3a)') lead(1),trim(gln(2*l1+7)),cbs
  write(6,'(2a)') lead(2),trim(gln(2*l1+8))

  write(6,'(/a/)') trim(pse)

  if(nxtra>0) then
   do ii=1,nxtra
    if(lpx(ii)+1==l1) then

     write(6,'(3a)') lead(1),trim(gln(2*l1+15)),cbs
     write(6,'(2a)') lead(2),trim(gln(2*l1+16))

     write(6,'(/a/)') trim(pse)
    end if
   end do
  end if

  if(nproj(l1)==2) then

    write(6,'(a/)') trim(plot_title(4))
    write(6,'(a/)') trim(x_label(1))

    write(6,'(3a)') lead(1),trim(gln(2*l1+37)),cbs
    write(6,'(2a)') lead(2),trim(gln(2*l1+38))

    write(6,'(/a/)') trim(pse)
  end if

  write(6,'(a/)') trim(plot_title(5))
  write(6,'(a/)') trim(x_label(2))

  jj=nproj(l1)-1  !trick to label # of projectors in phsft calculation
  write(6,'(3a)') lead(1),trim(gln(4*l1+19)),cbs
  write(6,'(2a)') lead(2),trim(gln(4*l1+21+jj))

  write(6,'(/a/)') trim(pse)

 end do

! log derivatives for angular momenta for which no pseudopotentials 
! were created

 do l1=lmax+2,4

  write(6,'(a/)') trim(plot_title(5))
  write(6,'(a/)') trim(x_label(2))

  jj=nproj(l1)-1  !trick to label # of projectors in phsft calculation
  write(6,'(3a)') lead(1),trim(gln(4*l1+19)),cbs
  write(6,'(2a)') lead(2),trim(gln(4*l1+21+jj))

  write(6,'(/a/)') trim(pse)

 end do

! Convergence profile

 set='set  logscale y'
 write(6,'(a/)') trim(set)
 set='set  grid'
 write(6,'(a/)') trim(set)
 set='set  yrange [5.e-6:2.e-2]'
 write(6,'(a/)') trim(set)
 write(6,'(a/)') trim(plot_title(6))
 write(6,'(a/)') trim(x_label(3))

 do l1=1,lmax+1
  write(6,'(2a)',advance='no') lead(l1),trim(gln(46+l1))
  if(l1<lmax+1) then
   write(6,'(a)') cbs
  else
   write(6,'(/)')
  end if
 end do

 write(6,'(/a/)') trim(pse)

 write(6,'(a)') 'END_GNU'

 return
 end subroutine gnu_script
