CREATE TABLE `Tanarok`(
    `id` INT NOT NULL,
    `nev` VARCHAR(255) NOT NULL,
    `hangszer` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `Hangszerek`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nev` VARCHAR(255) NOT NULL
);
CREATE TABLE `Kolcsonzes`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `hangszerId` INT NOT NULL,
    `diakId` INT NOT NULL,
    `kolcsonzes_kezdete` DATE NOT NULL,
    `visszahozas_datuma` DATE NOT NULL,
    `megjegyzes` VARCHAR(255) NOT NULL
);
CREATE TABLE `Diak`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nev` VARCHAR(255) NOT NULL,
    `szuletesi_datum` VARCHAR(255) NOT NULL,
    `telszam` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
CREATE TABLE `Ora`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tanarId` INT NOT NULL,
    `diakId` INT NOT NULL,
    `tema` VARCHAR(255) NOT NULL
);
CREATE TABLE `Bejelentkezes`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fnev` VARCHAR(255) NOT NULL,
    `jelszo` VARCHAR(255) NOT NULL,
    `jogosultsag` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Ora` ADD CONSTRAINT `ora_tanarid_foreign` FOREIGN KEY(`tanarId`) REFERENCES `Tanarok`(`id`);
ALTER TABLE
    `Kolcsonzes` ADD CONSTRAINT `kolcsonzes_hangszerid_foreign` FOREIGN KEY(`hangszerId`) REFERENCES `Hangszerek`(`id`);
ALTER TABLE
    `Kolcsonzes` ADD CONSTRAINT `kolcsonzes_diakid_foreign` FOREIGN KEY(`diakId`) REFERENCES `Diak`(`id`);
ALTER TABLE
    `Ora` ADD CONSTRAINT `ora_diakid_foreign` FOREIGN KEY(`diakId`) REFERENCES `Diak`(`id`);
ALTER TABLE
    `Hangszerek` ADD CONSTRAINT `hangszerek_nev_foreign` FOREIGN KEY(`nev`) REFERENCES `Tanarok`(`hangszer`);