variable "region" {
  type    = "string"
  default = "europe-west3-a"
}

variable "project" {
  type    = "string"
  default = "dotted-music-184711"
}

variable "machine_type" {
  type    = "string"
  default = "g1-small"
}

variable "ssh_keys" {
  type = "map"

  default = {
    "ikharlamov"  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgpEUXrGMMWMEplIPCEni1erm96JZ/DNIV8vGyL23P8yue23FTzadKy9hRkUNraYLLOhW5O1OPf5hU020ny9PdaUDZR0X2PRKSRAsg1U3CFU+9ft/yVBDElAdPXa2i2psiL0+G4QDoYFgMOFb83dWlX8yn7mPGiSJJtusxHZYjB9pOh1wPNIDVsUUAPYreQjZtqn3axeTlUAbwrVRZ8c9B7uYQKOTJnAaLdDHulOoqwd2ShcWZNRTtiQzn5Gb5x8vfNGrooNxxBhuCFWCWgL9Dk9cZFDAl3wCvnT9Os9eD4wr3kjF6AKmPKNs/EJOukb6eyIYCMNbAR9atKUm7t1sf"
    "test" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4ZvBprpm/t2tFg/2I5EtnoIaC5a5YdubWrLrTKI/yavq9cbH0E0pnJbC6TO+AztGStQmp8qm+q4BuwO3v1NZp5rPftnzh1RRmInNx0oFFVsqwrMqPHGoKI+b1VmMSQXKYWCe/yHY1x28YNjsGU9nCx3MhNkdPik0uqOjj6VGKYt/wS547UaSRp6+zd2Zl0kJ3ajAOy7pJBoIOWmuRd4TDs9ckzlRt0jM6M8o8d8PWRccrrFTfgQ33MPJO10FG6YxfdbPZPHIBBzdBcSk9/eBRfGVwx+cl6uKraz0XKmD0Mf40K7JA0hXDpWXfr41U9WYvYlbPP9thPDSpyVc2KIJT"
  }
}
