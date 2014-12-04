DNS Backup
==========

This script will backup DNS zone files from DNSimple for safekeeping.


Setup
-----

Run:

    ./bin/setup

After that, all you need to do is add the api token and username to `.env`. Note
that on DNSimple, username is your registered email.


Usage
-----

To copy zone files:

    ./dns_backup.rb

Then, commit changes and `git push`.
