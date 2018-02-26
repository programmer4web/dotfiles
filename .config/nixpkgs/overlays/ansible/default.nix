self: super: {
  ansible_2_4_3 = super.ansible.overridePythonAttrs(old: rec {
    pname = "ansible";
    version = "2.4.3.0";
    name = "${pname}-${version}";

    src = super.fetchurl {
      url = "http://releases.ansible.com/ansible/${name}.tar.gz";
      sha256 = "0gcak67svcq07yq2k1r93c8kjs9jirfsxrzqsmwkkl18d6jv760f";
    };
  });
}
