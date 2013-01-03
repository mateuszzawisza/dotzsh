alias vzstaging="ssh -i ~/.ssh/vzaar.pem vzaar@staging.vzaar.com"

function copy_key(){
 cat ~/.ssh/$1.pub | ssh mateusz@$2 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
}
