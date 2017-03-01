#!/usr/bin/perl

    use strict;
    use warnings;

    use Scalar::Util qw(
        blessed
    );
    use Try::Tiny;

    use Kafka::Connection;
    use Kafka::Producer;

    my ( $connection, $producer );
    try {

        $connection = Kafka::Connection->new( host => 'localhost' );

        $producer = Kafka::Producer->new( Connection => $connection );

###dis gonna be good

 my $cassandra_data=`./select.py`;

print "\n";

	my $response = $producer->send(
	  'mumu', 
	  0,
	 'first message! Yey!' 
	);


        $response = $producer->send(
            'mumu',          # topic
            0,                  # partition
            [                   # messages
               `date +"%H:%M"`,
                'another message',
                $cassandra_data,
            ]
        );
	$response = $producer->send(
	 'mumu', 
	 0,
	 'Zah End!'
	);

    } catch {
        my $error = $_;
        if ( blessed( $error ) && $error->isa( 'Kafka::Exception' ) ) {
            warn 'Error: (', $error->code, ') ',  $error->message, "\n";
            exit;
        } else {
            die $error;
        }
    };

    undef $producer;
    $connection->close;
    undef $connection;

