platform "ubuntu-18.10-amd64" do |plat|
  plat.servicedir "/lib/systemd/system"
  plat.defaultdir "/etc/default"
  plat.servicetype "systemd"
  plat.codename "cosmic"

  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat.get_codename}.deb"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper rsync fakeroot cmake"
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends "

  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends libncurses5 libboost-all-dev libyaml-cpp-dev libleatherman-dev"

  plat.vmpooler_template "ubuntu-1810-x86_64"
end
