#!/bin/bash

if [ $# -ne 3 ]
then
	cat >&2 <<-EOF
	Please provide 3 arguments.

	usage: $0 <image-name> <container-name-to-be-given> <work-dir-host-location>
EOF

	exit 1
fi

WORKDIR=$(realpath $3)

docker run -td \
	--name $2 \
	-v /home/pmp/data-btr/Work/yocto-downloads:/home/user/yocto-downloads \
	-v /home/pmp/data-btr/Work/yocto-sstate-cache:/home/user/yocto-sstate-cache \
	-v /home/pmp/.ssh:/home/user/.ssh \
	-v $WORKDIR:/home/user/work \
	--net=host \
	$1

