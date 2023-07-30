#!/bin/sh -eu

name="${1:-perpendicular}"
user="${2:-dev}"

vm_conf="$HOME"/.config/perpendicular/"$name".conf

if [ -f "$vm_conf" ]; then
  # shellcheck source=/dev/null
  . "$vm_conf"
fi

cpus="${cpus:-4}"
memory="${memory:-8G}"
image="${image:-jammy}"
disk="${disk:-16G}"

ansible-playbook \
  -i localhost, \
  -e vm_user="$user" \
  -e vm_name="$name" \
  -e vm_cpus="$cpus" \
  -e vm_memory="$memory" \
  -e vm_image="$image" \
  -e vm_disk="$disk" \
  -e ansible_python_interpreter="$(command -v python3 2> /dev/null)" \
  playbooks/host.yaml
