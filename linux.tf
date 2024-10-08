// Configure the Google Cloud provider
provider "google" {
 project     = "pd-us-gcp-dvo-8q"
 region      = "${var.region_name}"
 zone      = "${var.zone_name}"
}
resource "google_compute_disk" "disk" {
    count   = "${var.disks_count}"
    name    = "${var.instance_name}-0${count.index + 1}"
    type    = "pd-standard"
    size    = "${var.disk_size["${count.index}"]}"
    zone   = "${var.zone_name}"
    depends_on = [google_compute_instance.vm_instance]
}
resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  tags		   = "${var.network_tags}"

  boot_disk {
    initialize_params {
      image = "${var.boot_disk_image}"
	    size 	= "${var.boot_disk_image_size}"
	    type	= "pd-standard"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
	network       = "${var.instance_network}"
	subnetwork	  = "${var.instance_subnetwork}"
   }

# We connect to our instance via Terraform and remotely executes our script using SSH
  provisioner "remote-exec" {
    script = "D:\\CloudOps\\LINUX_BUILD_V1\\post_logic1.bash"
    
	connection {
      type        = "ssh"
      host        = "${google_compute_instance.vm_instance.network_interface.0.network_ip}"
      user        = "root"
      password	  = "Th1s1sN0tmyr3@lp@sswdLOL"
    }
  }
  
}
resource "google_compute_attached_disk" "attached-disks" {
  count = "${var.disks_count}"
  disk = "${var.instance_name}-0${count.index + 1}"
  instance = "${var.instance_name}"
  depends_on = [google_compute_disk.disk]
}
