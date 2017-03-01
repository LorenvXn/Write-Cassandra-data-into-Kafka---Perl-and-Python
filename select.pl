#!/usr/bin/perl

use strict;

use DBI;
    my $dsn="dbi:Cassandra:keyspace=rapcas;host=kaffy-Virt;port=9042";
    my $dbh = DBI->connect($dsn);
    
    my $sth=$dbh->prepare('select * from rapcas.users;', {PerPage => 1000});
    $sth->execute();

    $dbh->disconnect;

