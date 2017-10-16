--trigger #1
--Display the status of Employees'salaries before salaries are updated.
create or replace trigger EMP_Salary_Change
  BEFORE UPDATE
    on EMPLOYEE
for each row
BEGIN
  CASE
    WHEN :NEW.Salary > :OLD.Salary THEN
      DBMS_OUTPUT.PUT_LINE('Salary will be increased.');
    WHEN :NEW.Salary < :OLD.Salary THEN
      DBMS_OUTPUT.PUT_LINE('Salary will be decreased.');
    WHEN :NEW.Salary = :OLD.Salary THEN
      DBMS_OUTPUT.PUT_LINE('Salary will stay the same as before.');
    END CASE;
END;


--trigger #2
--Display both previous and current details of animal after ANIMAL_DETAIL are updated.
create or replace trigger Animal_Detail_change
AFTER update
  on ANIMAL_DETAIL
for each row
begin
DBMS_OUTPUT.PUT_LINE('Previous Height: ' || :old.Height);
DBMS_OUTPUT.PUT_LINE('Current Height: ' || :new.Height);
DBMS_OUTPUT.PUT_LINE('Previous Weight: ' || :old.Weight);
DBMS_OUTPUT.PUT_LINE('Current Weight: ' || :new.Weight);
DBMS_OUTPUT.PUT_LINE('Previous Age: ' || :old.Age);
DBMS_OUTPUT.PUT_LINE('Current Age: ' || :new.Age);
end;


--stored procedure #1
--output the list of the details of all Male Pandas in the zoos
create or replace PROCEDURE Male_Panda_Detail AS
cursor MP is
  SELECT ANIMAL.Aid, Height, Weight, Age
  FROM ANIMAL_KIND, ANIMAL, ANIMAL_DETAIL
  WHERE ANIMAL_KIND.AKid=ANIMAL.AKid AND ANIMAL_DETAIL.Aid = ANIMAL.Aid
  AND Gender = 'Male' AND AName = 'Panda';

begin
for this in MP
loop
DBMS_OUTPUT.PUT_LINE(this.ANIMAL.Aid||','||this.Height||','||this.Weight||','||this.Age);
end loop;
end;


--stored procedure #2
--output the list of Animal names at Zoo Region called "North America" in "Dallas" Zoo
create or replace PROCEDURE NA_Animal_Name AS
cursor NA is
  SELECT AName
  FROM ZOO, ANIMAL_GUIDE, ANIMAL_KIND, CONTAINS
  WHERE ZOO.AGid = ANIMAL_GUIDE.AGid AND ANIMAL_GUIDE.AGid = CONTAINS.AGid
  AND CONTAINS.AKid = ANIMAL_KIND.AKid AND Location = 'Dallas'
  AND Zoo_region = 'North America';

begin
for this in NA
loop
DBMS_OUTPUT.PUT_LINE(this.AName);
end loop;
end;
