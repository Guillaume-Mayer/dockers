INSERT INTO `content`.`DictionaryReplacementRule` (`countryCode`,`hotelAttribute`) VALUES ('IT','ADDRESS');

INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'VIA');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'VIALE');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'PIAZZA');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'SESTIERE');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'CORSO');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'VICOLO');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'STRADA');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode`='IT' and `hotelAttribute`='ADDRESS'), '', 'CONTRADA');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode` is null and `hotelAttribute`='ADDRESS'), '', 'DEL');
INSERT INTO `content`.`ReplacementTokens` (`ReplacementRule_id`,`value`,`pattern`) VALUES (
(select id from `content`.`DictionaryReplacementRule` where `countryCode` is null and `hotelAttribute`='NAME'), '', 'DEL');
