## Domain Registry Interface, CORENIC EPP extensions
##
## Copyright (c) 2013 Patrick Mevzek <netdri@dotandco.com>. All rights reserved.
##           (c) 2013 Michael Holloway <michael@thedarkwinter.com>. All rights reserved.
##
## This file is part of Net::DRI
##
## Net::DRI is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## See the LICENSE file that comes with this distribution for more details.
####################################################################################################

package Net::DRI::Protocol::EPP::Extensions::CORENIC;

use strict;
use warnings;

use base qw/Net::DRI::Protocol::EPP/;

####################################################################################################

sub setup
{
 my ($self,$rp) = @_;
 # These are the TANGO-RS extensions but use corenic namespaces
 $self->ns({ map { $_ => ['http://xmlns.corenic.net/epp/'.$_.'-1.0',$_.'-1.0.xsd'] } qw/idn auction mark-ext/ }); 
 $self->capabilities('domain_update','idn',['add','del']);
 $self->capabilities('domain_update','auction',['set']);
}

sub default_extensions { return qw/LaunchPhase GracePeriod SecDNS TANGO::IDN TANGO::Auction TANGO::LaunchPhase/; }

####################################################################################################
1;
