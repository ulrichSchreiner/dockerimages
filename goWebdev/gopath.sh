#/bin/sh

# if you have a go project in gitlab which uses gitlab.com as the toplevel
# namespace, you can source this project in your .gitlab-ci.yml to create a buildable
# gopath layout. so simply write ". gopath.sh" in your ci script and after that you
# should be able to use "go build" or "go install".
#
# please note: "go install" creates the binaries in $GOPATH/bin and this will not be
# in the building workspace of gitlabci. If you want to store artifacts in the ci 
# script you have to copy them anywhere your project directory.

GITHOST=${1:-"gitlab.com"}

export GOPATH=/go

mkdir -p "$GOPATH"/pkg
mkdir -p "$GOPATH"/bin
mkdir -p "$GOPATH"/src/"$GITHOST"/"$CI_PROJECT_NAMESPACE"
cd "$GOPATH"/src/"$GITHOST"/"$CI_PROJECT_NAMESPACE"
ln -s "$CI_PROJECT_DIR" .
cd "$CI_PROJECT_NAME"

echo -e "machine ${GITHOST}\nlogin gitlab-ci-token\npassword ${CI_JOB_TOKEN}" > ~/.netrc
