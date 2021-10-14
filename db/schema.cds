using {cuid, managed} from '@sap/cds/common';

namespace ow;

entity Heroes : cuid, managed {
    //    key ID   : UUID;
    name : String(30);
    role : Association to Roles;
}

entity Roles: cuid {
    // key ID       : UUID;
        roleName : String;
        hero     : Association to Heroes
                       on hero.role = $self;
}
