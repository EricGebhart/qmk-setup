# For Arch linux, ie. yay for installing qmk from the AUR,
# to clone the qmk_firmware,
# setup the udev rules and
# modem manager for linux,
# and run qmk setup.   Uses qmk setup for the cloning.
#
# Change projects to the folder where you keep your repos
# change qithub-id to point at your github where
# your fork of qmk_firmware lives.

##########################################
## Your info

# projects=$(HOME}/<your projects folder>
# github-id=<your github id>

projects=$(HOME)/play
github-id="ericgebhart"

##########################################

aurpkgs=qmk
qmk-repo=$(github-id)/qmk_firmware
qmk-pp=$(projects)/qmk_firmware

.PHONY: udev
udev:
	sudo cp *.rules /etc/udev/rules.d/
	sudo udevadm control --reload-rules
	sudo udevadm trigger

.PHONY: modem-manager
modem-manager:
	sudo sed -i 's/--filter-policy=strict/--filter-policy=default/' \
			/lib/systemd/system/ModemManager.service
	sudo systemctl daemon-reload
	sudo systemctl restart ModemManager

.PHONY: $(aurpkgs)
$(aurpkgs):
	yay -S --noconfirm --needed $@

$(qmk-pp):
	qmk setup -y $(qmk-repo) $(qmk-pp)

.PHONY: qmk-setup
qmk-setup: udev modem-manager $(qmk-pp)

.PHONY: qmk
force-qmk:
	qmk setup -y $(qmk-repo) $(qmk-pp)

install: qmk-setup
