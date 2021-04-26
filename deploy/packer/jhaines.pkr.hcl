source "amazon-ebs" "jhaines" {
    profile = var.aws_profile
    region = var.aws_region
    source_ami = var.source_ami

    ami_name = "packer-jhaines-${var.aws_region}-{{ timestamp }}"
    ami_virtualization_type = "hvm"
    instance_type = "t3.small"
    ssh_username = "ubuntu"

    subnet_filter {
        filters = {
            "tag:Class": "build"
        }

        most_free = true
        random = false
    }

    tags = {
        Service = "jhaines"
    }
}

build {
    sources = [
        "source.amazon-ebs.jhaines"
    ]

    provisioner "ansible" {
        playbook_file = "${var.ansible_dir}/packer.yml"
        extra_arguments = [
            "--extra-vars", "ansible_remote_tmp=/tmp"
        ]
    }
}
