using {cuid, managed} from '@sap/cds/common';

namespace ow;

entity Heroes : cuid, managed {
    name : String(30);
    role : Association to Roles;
}

entity Roles: cuid {
        roleName : String;
        hero     : Association to many Heroes
                       on hero.role = $self;
}