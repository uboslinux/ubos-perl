use strict;
use warnings;

use Module::Build;

my $libsystemd_CFLAGS = `pkg-config --cflags libsystemd`
	or warn 'Could not determine systemd compiler flags';
my $libsystemd_LDFLAGS = `pkg-config --libs libsystemd`
	or warn 'Could not determine systemd compiler flags';

my $build = Module::Build->new(
	module_name		=> 'Log::Journald',
	license			=> 'perl',
	dist_author		=> 'Lubomir Rintel <lkundrak@v3.sk>',
	create_readme		=> 1,
	meta_merge		=> {
		resources	=> {
			bugtracker	=> 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Log-Journald',
			repository	=> 'https://github.com/lkundrak/perl-Log-Journald',
		}
	},
	extra_compiler_flags	=> $libsystemd_CFLAGS,
	extra_linker_flags	=> $libsystemd_LDFLAGS,
	configure_requires		=> {
		'Module::Build'		=> 0,
	},
	build_requires		=> {
		'ExtUtils::CBuilder'	=> 0,
	}
);

$build->create_build_script;
