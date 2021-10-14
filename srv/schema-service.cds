using {ow as my} from '../db/schema';

service Apps {

    // entity Heroes as projection on my.Heroes {
    //     * , Heroes.role.roleName as role_Name
    // } excluding {
    //     Heroes,
    //     role
    // };

    entity Heroes as projection on my.Heroes;    
    entity Roles as projection on my.Roles;
}
