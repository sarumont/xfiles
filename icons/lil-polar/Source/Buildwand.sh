#!/bin/sh

if test ! -d cursors_wand;
then mkdir cursors_wand
else
rm -rf cursors_wand
mkdir cursors_wand
fi



########### Build cursors_wand

xcursorgen AppStarting.conf	cursors_wand/AppStarting
xcursorgen Arrow.conf		cursors_wand/Arrow
xcursorgen ArrowRight.conf	cursors_wand/ArrowRight
xcursorgen AngleNW.conf		cursors_wand/AngleNW
xcursorgen AngleNE.conf		cursors_wand/AngleNE
xcursorgen AngleSW.conf		cursors_wand/AngleSW
xcursorgen AngleSE.conf		cursors_wand/AngleSE
xcursorgen Copy.conf		cursors_wand/Copy
xcursorgen Cross.conf		cursors_wand/Cross
xcursorgen Crosshair.conf	cursors_wand/Crosshair
xcursorgen Wand.conf		cursors_wand/Wand
xcursorgen Handwriting.conf	cursors_wand/Handwriting
xcursorgen Help.conf		cursors_wand/Help
xcursorgen IBeam.conf		cursors_wand/IBeam
xcursorgen Link.conf		cursors_wand/Link
xcursorgen Move.conf		cursors_wand/Move
xcursorgen Circle.conf		cursors_wand/Circle
xcursorgen NO.conf			cursors_wand/NO
xcursorgen X.conf			cursors_wand/X
xcursorgen SizeAll.conf		cursors_wand/SizeAll
xcursorgen SizeNESW.conf	cursors_wand/SizeNESW
xcursorgen SizeNS.conf		cursors_wand/SizeNS
xcursorgen SizeNWSE.conf	cursors_wand/SizeNWSE
xcursorgen SizeWE.conf		cursors_wand/SizeWE
xcursorgen UpArrow.conf		cursors_wand/UpArrow
xcursorgen DownArrow.conf	cursors_wand/DownArrow
xcursorgen LeftArrow.conf	cursors_wand/LeftArrow
xcursorgen RightArrow.conf	cursors_wand/RightArrow
xcursorgen BaseN.conf		cursors_wand/BaseN
xcursorgen BaseS.conf		cursors_wand/BaseS
xcursorgen HDoubleArrow.conf		cursors_wand/HDoubleArrow
xcursorgen VDoubleArrow.conf		cursors_wand/VDoubleArrow
xcursorgen Wait.conf		cursors_wand/Wait

cd cursors_wand



########### Create copies and symlinks

#---------- AppStarting
cp AppStarting			left_ptr_watch
cp -s left_ptr_watch	08e8e1c95fe2fc01f976f1e063a24ccd
cp -s left_ptr_watch	3ecb610c1bf2410f44200f48c40d3599
rm -f AppStarting

#---------- Arrow
cp Arrow				arrow
cp Arrow				draft_large
cp Arrow				draft_small
cp Arrow				left_ptr
cp Arrow				right_ptr
cp Arrow				top_left_arrow
rm -f Arrow

#---------- ArrowRight
cp ArrowRight			right_ptr
rm -f ArrowRight

#---------- Move
cp Move					move
cp Move					plus
cp -s move				4498f0e0c1937ffe01fd06f973665830
cp -s move				9081237383d90e509aa00f00170e968f
rm -f Move

#---------- Copy
cp Copy					copy
cp -s copy				1081e37283d90000800003c07f3ef6bf
cp -s copy				6407b0e94181790501fd1e167b474872
rm -f Copy

#---------- Cross
cp Cross				cross
cp Cross				cross_reverse
cp Cross				tcross
rm -f Cross

#---------- Crosshair
cp Crosshair			crosshair
rm -f Crosshair

#---------- Wand
cp Wand					hand
cp Wand					hand1
cp Wand					hand2
cp -s hand1				9d800788f1b08800ae810202380a0822
cp -s hand2				e29285e634086352946a0e7090d73106
rm -f Wand

#---------- Handwriting
cp Handwriting			pencil
rm -f Handwriting

#---------- Help
cp Help					question_arrow
cp -s question_arrow	d9ce0ab605698f320427677b458ad60b
cp -s question_arrow	5c6cd98b3f3ebcb1f9c7f1c204630408
rm -f Help

#---------- IBeam
cp IBeam				xterm
rm -f IBeam

#---------- Link
cp Link					link
cp -s link				3085a0e285430894940527032f8b26df
cp -s link				640fb0e74195791501fd1ed57b41487f
rm -f Link

#---------- Cirlce
cp Circle 				circle
rm -f Circle

#---------- NO
cp NO 					crossed_circle
cp -s crossed_circle	03b6e0fcb3499374a867c041f52298f0
rm -f NO

#---------- X
cp X 					X_cursor
rm -f X

#---------- SizeAll
cp SizeAll				fleur
rm -f SizeAll

#---------- SizeNESW
cp SizeNESW				bottom_left_corner
cp SizeNESW				fd_double_arrow
cp SizeNESW				top_right_corner
cp -s fd_double_arrow	fcf1c3c7cd4491d801f1e1c78f100000
rm -f SizeNESW

#---------- SizeNS
cp SizeNS				bottom_side
cp SizeNS				double_arrow
cp SizeNS				top_side
rm -f SizeNS

#---------- SizeNWSE
cp SizeNWSE				bd_double_arrow
cp SizeNWSE				bottom_right_corner
cp SizeNWSE				top_left_corner
cp -s bd_double_arrow	c7088f0f3e6c8088236ef8e1e3e70000
rm -f SizeNWSE

#---------- SizeWE
cp SizeWE				left_side
cp SizeWE				right_side
rm -f SizeWE

#---------- AngleNW
cp AngleNW				ul_angle
rm -f AngleNW

#---------- AngleNE
cp AngleNE				ur_angle
rm -f AngleNE

#---------- AngleSW
cp AngleSW				ll_angle
rm -f AngleSW

#---------- AngleSE
cp AngleSE				lr_angle
rm -f AngleSE


#---------- UpArrow
cp UpArrow				center_ptr
cp UpArrow				sb_up_arrow
rm -f UpArrow

#---------- DownArrow
cp DownArrow			sb_down_arrow
rm -f DownArrow

#---------- LeftArrow
cp LeftArrow			sb_left_arrow
rm -f LeftArrow

#---------- RightArrow
cp RightArrow			sb_right_arrow
rm -f RightArrow

#---------- BaseN
cp BaseN				base_arrow_up
cp BaseN				based_arrow_up
rm -f BaseN

#---------- BaseS
cp BaseS				base_arrow_down
cp BaseS				based_arrow_down
rm -f BaseS

#---------- HDoubleArrow
cp HDoubleArrow			h_double_arrow
cp HDoubleArrow			sb_h_double_arrow
cp -s sb_h_double_arrow	14fef782d02440884392942c11205230
cp -s h_double_arrow	028006030e0e7ebffc7f7070c0600140
rm -f HdoubleArrow

#---------- VDoubleArrow
cp VDoubleArrow			v_double_arrow
cp VDoubleArrow			sb_v_double_arrow
cp -s sb_v_double_arrow	2870a09082c103050810ffdffffe0204
cp -s v_double_arrow	00008160000006810000408080010102
rm -f VdoubleArrow

#---------- Wait
cp Wait					watch
rm -f Wait

########### Done!
echo "Done!"
