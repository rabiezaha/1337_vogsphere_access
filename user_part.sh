#!/bin/bash

### We set up the user used to access to the vogsphere

mkdir -p ~/.ssh &&
cat >> ~/.ssh/config << EOF
Host vgs vgs.1337.ma vgse vgse.1337.ma vogsphere vogsphere.1337.ma vogsphere-exam vogsphere-exam.1337.ma
	User vogsphere
EOF

echo "user part finished, welcome in the freedom !"
