#!/bin/bash
#created by YY&YY@2017-03-09.
FTILE_NAME=$1
TRANSMIT_FILE=nihao
RESULT_MD5SUM=remote_md5sum.txt
LOCAL_MD5SUM=local_md5sum.txt
FTP_SERVER_NAME=langFtp
FTP_SERVER_PASSWORD=1

ftp -n <<- EOF
verbose
debug
open 10.0.3.131
user $FTP_SERVER_NAME $FTP_SERVER_PASSWORD
binary
get $TRANSMIT_FILE
close
bye
EOF
echo "退出 FTP 文件传输。"
echo ""


echo "校验文件的正确性："
echo "生成md5sum校验和："
checkResult=`md5sum $TRANSMIT_FILE`
echo "$checkResult">$LOCAL_MD5SUM
echo $checkResult
#截取校验和32位。
checkResult32=${checkResult:0:32}
echo $checkResult32
echo ""

echo "读取文件中 $RESULT_MD5SUM 的md5sum校验和"
readMd5sum=`cat $RESULT_MD5SUM`
echo $readMd5sum
echo ""

if [ "$checkResult32"x = "$readMd5sum"x ]; then 
	echo "升级文件成功"
else
	echo "升级文件失败"
fi
#end of file.
