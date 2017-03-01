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
	  'mumu',  # topic
	  0, 	   # partition
	 'first message! Yey!'  # messages
	);


        $response = $producer->send(
            'mumu',        
            0,                 
            [                  
               `date +"%H:%M"`,
                'another message',
                $cassandra_data, #our data from Casssandra
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

