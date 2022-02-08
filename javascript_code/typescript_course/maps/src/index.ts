/// <reference types="@types/google.maps" />
import { User } from './User';
import { Company } from './Company';
import { CustomMap } from './CustomMap';

// create the user and company objects
const user = new User();
const company = new Company();
const custom_map= new CustomMap('map');

custom_map.add_marker(user);
custom_map.add_marker(company);



// now we can hide some functionality, in order to protect our app from 
// a new engineer to use functions they dont fully understand


