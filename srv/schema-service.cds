using {ow as my} from '../db/schema';

service Apps {

  entity Heroes as projection on my.Heroes {
    ID,
    name,
    role.roleName
  };

  //entity Roles as projection on my.Roles;

  /* La línea 11 da el siguiente error: Element “role” has not been found in the elements of the query; please use REDIRECTED TO with an explicit ON conditionCDS (compiler)(query-undefined-element)
schema-service.cds(11, 33): entity:“Apps.Roles”/element:“hero”"

El cual fue solucionado con la exposicion de Roles como se muestra a continuación*/

  entity Roles as
    select from my.Heroes,
    my.Roles
    mixin {
      toRoles : Association to Roles
                  on Heroes.ID = Roles.ID;
    }
    into {
      Heroes.ID as heroesID,
      Roles.ID  as rolesID,
      toRoles
    }

}