INSERT INTO `mohr18u_Flutter`.`EMPLOYEUR` (`id_employeur`, `nom_emp`, `mail_emp`, `rue_emp`, `batiment_emp`, `ville_emp`, `cp_emp`)
VALUES (idEmp, nomEmp.text, mailEmp.text, rueEmp.text, batimentEmp.text, villeEmp.text, cpEmp.text, Emp.text);

INSERT INTO `mohr18u_Flutter`.`PROFESSEUR` (`id_prof`, `nom`, `prenom`, `tel_pro`, `mail`, `type_prof`, `nom_license`, `id_employeur`)
VALUES (idProf, nom.text, prenom.text, telPro.text, mail.text, typeProf.text, nomLicense.text, idEmp);

INSERT INTO `mohr18u_Flutter`.`ANNEES_ENS` (`id_prof`, `nom_annee`)
VALUES (idProf, annees.text);

INSERT INTO `mohr18u_Flutter`.`MATIERES_ENS` (`id_prof`, `nom_matiere`)
VALUES (idProf, matieres.text);

INSERT INTO `mohr18u_Flutter`.`PROF_INFO_SUPP` (`id_prof`, `lieu_naiss`, `date_naiss`, `rue`, `batiment`, `ville`, `cp`, `tel_perso`, `tel_fixe`)
VALUES (idProf, lieuNaiss.text, dateNaiss.text, rue.text, batiment.text, ville.text, cp.text, telPerso.text, telFixe.text);