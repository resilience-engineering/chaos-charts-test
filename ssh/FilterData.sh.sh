#!bin/bash
. /var/config.txt
function scriptOutput {
#sudo rm -rf $LOGPATH
touch $LOGPATH
chmod 775 $LOGPATH
for var in $(seq -$FETCHLOGTIME 0)
do
   t=`date --date="$var min" "+%b-%d %H:%M"`
   sudo cat $FETCHLOGPATH | grep -a "`echo $t`" | tee >> $LOGPATH
done
}
scriptOutput
[ -s $LOGPATH ]
if [ $? != 0 ]
then
        echo "Log file is empty"
else
        cat $LOGPATH
        cat $LOGPATH | grep -a "$WORDFILTER" | wc -l
fi
