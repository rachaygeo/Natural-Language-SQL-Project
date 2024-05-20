create table Players (
    player_id integer primary key,
    curr_area integer not null,
    hours_played integer,
    foreign key (curr_area) references Areas (area_id)
);

create table Areas (
    area_id integer primary key,
    name varchar(100) not null,
    num_benches integer
);

create table Enemies (
    enemy_id integer primary key,
    area_id integer not null,
    name varchar(100),
    health integer,
    foreign key (area_id) references Areas (area_id)
);

create table Bosses (
    boss_id integer primary key,
    area_id integer not null,
    name varchar(100),
    health integer,
    foreign key (area_id) references Areas (area_id)
);

create table Players_Bosses (
    player_id integer not null,
    boss_id integer not null,
    foreign key (player_id) references Players (player_id),
    foreign key (boss_id) references Bosses (boss_id)
);

create table Items (
    item_id integer primary key,
    player_id integer not null,
    name varchar(100),
    amount integer,
    foreign key (player_id) references Players (player_id)
);
