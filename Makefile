VAGRANT_PRIVATE_KEY=/home/plumpnation/.vagrant.d/insecure_private_key
TAGS=all
ARGS=

.PHONY : all install-deps help provision-dev

all:
	echo "Hello, nothing to do by default"
	echo "Try 'make help'"

# target: help - Display callable targets.
help:
	egrep "^# target:" [Mm]akefile

# target: install-deps - Ensure all dependencies for provisioning are installed
install-deps:
	vagrant plugin install vagrant-vbguest

# target: provision-dev-app - Provision vagrant box
provision-dev:
	ansible-playbook -i development development.yml \
	--private-key=${VAGRANT_PRIVATE_KEY} \
	--tags=${TAGS} \
	${ARGS}
