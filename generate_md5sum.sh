#!/bin/bash
#created by YY&YY@2017-03-09.
FTILE_NAME=$1
RESULT_MD5SUM=remote_md5sum.txt

echo "生成md5sum校验和："
checkResult=`md5sum $FTILE_NAME`
#echo $checkResult

#截取校验和32位。
checkResult32=${checkResult:0:32}
echo $checkResult32
echo "$checkResult32">$RESULT_MD5SUM

echo ""

echo "读取文件中 $RESULT_MD5SUM 的md5sum校验和"
cat $RESULT_MD5SUM
#end of file.
