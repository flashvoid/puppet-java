class java  (
	$url	 		= $java::params::url,
	$arch	 		= $java::params::arch,
	$version 		= $java::params::version,
	$destination_dir 	= $java::params::destination_dir,
) inherits java::params {

	include puppi

	puppi::netinstall { "java" :
	  url => "$url",
	  destination_dir => $destination_dir,
	  extracted_dir => "jdk.$version",
    postextract_command => "ln -fs /usr/java/jdk.$version /usr/java/latest && cp /usr/java/latest/java.sh /etc/profile.d/",
	}
}
