#!/usr/bin/expect -f

set USER "student"
set HOST "192.168.64.21"
set PASS "student"
set CAT "s21_cat"
set GREP "s21_grep"
spawn scp src/cat/$CAT src/grep/$GREP $USER@$HOST:/home/$USER/
expect {
    "*yes/no" { send -- "yes\r" }
    "*password" { send -- "$PASS\r" }
}
spawn ssh $USER@$HOST "echo $PASS | sudo -S mv $CAT $GREP /usr/local/bin/"
expect "*password*"
send -- "$PASS\r"
expect eof
