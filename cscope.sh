#!/bin/bash
echo '$0: '$0
echo "pwd: "`pwd`
cscope_path=`pwd`
cscope_out=${cscope_path}"/cscope.out"
if [ ! -x "$cscope_out"]; then 
    rm ${cscope_out}
fi
echo ${cscope_path}
find ${cscope_path} -name '*.php' > ${cscope_path}/cscope.files
cscope -Rbq
rm cscope.files
# echo "scriptPath1: "$(cd `dirname $0`; pwd)
# echo "scriptPath2: "$(pwd)
# echo "scriptPath3: "$(dirname $(readlink -f $0))
# echo "scriptPath4: "$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
