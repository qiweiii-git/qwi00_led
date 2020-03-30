#*****************************************************************************
# makeall.sh
#
# Change History:
#  VER.   Author         DATE              Change Description
#  1.0    Qiwei Wu       May. 4, 2019      Initial Release
#*****************************************************************************
#!/bin/bash

PrjName='qwi00_led'
ChipType='xc7z020clg400-2'

MakeFwFileDir='make'
BuidFwFileDir='build'
OutpFwFileDir='bin'

if [ ! -d $OutpFwFileDir ]; then
   mkdir $OutpFwFileDir
   echo "Info: $OutpFwFileDir created"
fi

./$MakeFwFileDir/makefw.sh $PrjName $ChipType $BuidFwFileDir $OutpFwFileDir 0
