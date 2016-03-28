check_result() {
    if [ $1 -ne 0 ]; then
        echo "Error: $2"
        exit $1
    fi
}
git_install() {
	if [ -x "/usr/bin/apt-get" ]; then
		apt-get update && apt-get install -y git
	fi

	if [ -x "/usr/bin/yum" ]; then
		yum update && yum install -y git
	fi
}
if [ ! -f "/usr/bin/git" ]; then
	git_install
fi
check_result $? "install fail"
git config --global user.email "azssjli@163.com"
git config --global user.name "yonh"

echo 'alias gst="git status"' >> ~/.bashrc
echo 'alias ga="git add"' >> ~/.bashrc


echo "done..."
