**Data requirements for the system**:
The database system is designed for ZOO where many kinds of animals are kept so that people
could go to visit them. 

Table **CUSTOMER**: 
  > represents customers who visit to the zoo
Table **TICKET**: 
  > represents valid zoo tickets from associated zoo
Table **EMPLOYEE**: 
  > represents employees who work at associated zoo
Table **ANIMAL_GUIDE**: 
  > represents the animal guide offered by associated zoo, which introduced the information of zoo and 
  links to information of animal kind
Table **ZOO**: 
  > represents zoo where customers go to and employees work at
Table **ANIMAL_KIND**: 
  > represents the list of animal kinds with corresponding information from associated animal guide
Table **ANIMAL**: 
  > represents the animal information
Table **ANIMAL_DETAIL**: 
  > represents the additional detail information of animal
Table **GOES_TO**: 
  > represents the relationship table CUSTOMER and table ZOO, which means that a customer can visit the 
  many zoos and a zoo can be visited by many customers.
Table **MANAGES**: 
  > represents the relationship table EMPLOYEE and table TICKET, which means that an employee can manage 
  many tickets and a ticket can be managed by many employees.
Table **LOOKS_AFTER**: 
  > represents the relationship table EMPLOYEE and table ANIMAL, which means that an employee can looks 
  after many animals and an animal can be looked after by many employees
Table **CONTAINS**: 
  > represents the relationship table ANIMAL_GUIDE and table ANIMAL_KIND, which means that an animal guide 
  can contains many animal kinds and each animal kinds can belong to many animal guide
  
===================
Stored Procedure #1:
  Definition: it outputs the list of the details of all Male Pandas in the zoos, which includes the height, weight, and age.

Stored Procedure #2:
  Definition: it outputs the list of Animal names at Zoo Region called "North America" in "Dallas" Zoo.

Trigger #1:
  Definition: it displays the status of Employees’ monthly salaries before salaries are updated.

Trigger #2:
  Definition: it displays both previous and current details of animal after ANIMAL_DETAIL are updated.

