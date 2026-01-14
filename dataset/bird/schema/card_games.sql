CREATE TABLE "cards"
(
    id                      INTEGER           not null
        primary key,
    artist                  TEXT,
    asciiName               TEXT,
    availability            TEXT,
    borderColor             TEXT,
    cardKingdomFoilId       TEXT,
    cardKingdomId           TEXT,
    colorIdentity           TEXT,
    colorIndicator          TEXT,
    colors                  TEXT,
    convertedManaCost       REAL,
    duelDeck                TEXT,
    edhrecRank              INTEGER,
    faceConvertedManaCost   REAL,
    faceName                TEXT,
    flavorName              TEXT,
    flavorText              TEXT,
    frameEffects            TEXT,
    frameVersion            TEXT,
    hand                    TEXT,
    hasAlternativeDeckLimit INTEGER not null default 0 ,
    hasContentWarning       INTEGER not null default 0 ,
    hasFoil                 INTEGER not null default 0 ,
    hasNonFoil              INTEGER not null default 0 ,
    isAlternative           INTEGER not null default 0 ,
    isFullArt               INTEGER not null default 0 ,
    isOnlineOnly            INTEGER not null default 0 ,
    isOversized             INTEGER not null default 0 ,
    isPromo                 INTEGER not null default 0 ,
    isReprint               INTEGER not null default 0 ,
    isReserved              INTEGER not null default 0 ,
    isStarter               INTEGER not null default 0 ,
    isStorySpotlight        INTEGER not null default 0 ,
    isTextless              INTEGER not null default 0 ,
    isTimeshifted           INTEGER not null default 0 ,
    keywords                TEXT,
    layout                  TEXT,
    leadershipSkills        TEXT,
    life                    TEXT,
    loyalty                 TEXT,
    manaCost                TEXT,
    mcmId                   TEXT,
    mcmMetaId               TEXT,
    mtgArenaId              TEXT,
    mtgjsonV4Id             TEXT,
    mtgoFoilId              TEXT,
    mtgoId                  TEXT,
    multiverseId            TEXT,
    name                    TEXT,
    number                  TEXT,
    originalReleaseDate     TEXT,
    originalText            TEXT,
    originalType            TEXT,
    otherFaceIds            TEXT,
    power                   TEXT,
    printings               TEXT,
    promoTypes              TEXT,
    purchaseUrls            TEXT,
    rarity                  TEXT,
    scryfallId              TEXT,
    scryfallIllustrationId  TEXT,
    scryfallOracleId        TEXT,
    setCode                 TEXT,
    side                    TEXT,
    subtypes                TEXT,
    supertypes              TEXT,
    tcgplayerProductId      TEXT,
    text                    TEXT,
    toughness               TEXT,
    type                    TEXT,
    types                   TEXT,
    uuid                    TEXT              not null
        unique,
    variations              TEXT,
    watermark               TEXT
);

CREATE TABLE "foreign_data"
(
    id           INTEGER not null
        primary key,
    flavorText   TEXT,
    language     TEXT,
    multiverseid INTEGER,
    name         TEXT,
    text         TEXT,
    type         TEXT,
    uuid         TEXT
        references cards (uuid)
);

CREATE TABLE "legalities"
(
    id     INTEGER not null
        primary key,
    format TEXT,
    status TEXT,
    uuid   TEXT
        references cards (uuid)
            on update cascade on delete cascade
);

CREATE TABLE "sets"
(
    id               INTEGER           not null
        primary key,
    baseSetSize      INTEGER,
    block            TEXT,
    booster          TEXT,
    code             TEXT              not null
        unique,
    isFoilOnly       INTEGER not null default 0 ,
    isForeignOnly    INTEGER not null default 0 ,
    isNonFoilOnly    INTEGER not null default 0 ,
    isOnlineOnly     INTEGER not null default 0 ,
    isPartialPreview INTEGER not null default 0 ,
    keyruneCode      TEXT,
    mcmId            INTEGER,
    mcmIdExtras      INTEGER,
    mcmName          TEXT,
    mtgoCode         TEXT,
    name             TEXT,
    parentCode       TEXT,
    releaseDate      DATE,
    tcgplayerGroupId INTEGER,
    totalSetSize     INTEGER,
    type             TEXT
);

CREATE TABLE "set_translations"
(
    id          INTEGER not null
        primary key,
    language    TEXT,
    setCode     TEXT
        references sets (code)
            on update cascade on delete cascade,
    translation TEXT
);

CREATE TABLE "rulings"
(
    id   INTEGER not null
        primary key,
    date DATE,
    text TEXT,
    uuid TEXT
        references cards (uuid)
            on update cascade on delete cascade
)