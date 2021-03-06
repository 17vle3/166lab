/*btree is the default*/


CREATE INDEX nycPartNum ON part_nyc (part_number);
CREATE INDEX nycSup ON part_nyc (supplier);
CREATE INDEX nycColor ON part_nyc (color);
CREATE INDEX nycOnHand ON part_nyc (on_hand);

CREATE INDEX sfoPartNum ON part_sfo (part_number);
CREATE INDEX sfoSup ON part_sfo (supplier);
CREATE INDEX sfoColor ON part_sfo (color);
CREATE INDEX sfoOnHand ON part_sfo (on_hand);

CREATE INDEX supID ON supplier (supplier_id);
CREATE INDEX supName ON supplier (supplier_name);
