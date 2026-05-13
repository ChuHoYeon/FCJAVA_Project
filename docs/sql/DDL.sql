create table fc_java.football_api_response_log
(
    log_id        bigint auto_increment
        primary key,
    snapshot_date date                               not null,
    api_name      varchar(100)                       not null,
    request_url   text                               not null,
    league_code   varchar(20)                        not null,
    season_year   varchar(10)                        not null,
    response_json json                               not null,
    created_at    datetime default CURRENT_TIMESTAMP not null,
    updated_at    datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    constraint uk_football_api_response_log
        unique (snapshot_date, api_name, league_code, season_year)
)
    collate = utf8mb4_unicode_ci;

create index idx_football_api_response_log_search
    on fc_java.football_api_response_log (snapshot_date, api_name, league_code, season_year);

create table fc_java.football_league_standing
(
    standing_id        bigint auto_increment
        primary key,
    snapshot_date      date                               not null,
    season_id          int                                null,
    season_year        varchar(10)                        not null,
    season_start_date  date                               null,
    season_end_date    date                               null,
    current_matchday   int                                null,
    area_id            int                                null,
    area_name          varchar(100)                       null,
    area_code          varchar(20)                        null,
    area_flag          text                               null,
    competition_id     int                                null,
    competition_name   varchar(100)                       not null,
    league_code        varchar(20)                        not null,
    competition_type   varchar(50)                        null,
    competition_emblem text                               null,
    stage              varchar(50)                        null,
    standing_type      varchar(50)                        null,
    standing_group     varchar(50)                        null,
    team_id            int                                not null,
    team_name          varchar(100)                       not null,
    team_short_name    varchar(100)                       null,
    team_tla           varchar(10)                        null,
    team_crest         text                               null,
    position           int                                not null,
    played_games       int      default 0                 not null,
    won                int      default 0                 not null,
    draw               int      default 0                 not null,
    lost               int      default 0                 not null,
    points             int      default 0                 not null,
    goals_for          int      default 0                 not null,
    goals_against      int      default 0                 not null,
    goal_difference    int      default 0                 not null,
    form               varchar(100)                       null,
    created_at         datetime default CURRENT_TIMESTAMP not null,
    updated_at         datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    constraint uk_football_league_standing
        unique (snapshot_date, league_code, season_year, team_id)
)
    collate = utf8mb4_unicode_ci;

create index idx_football_league_standing_search
    on fc_java.football_league_standing (snapshot_date, league_code, season_year, position);

create table fc_java.game
(
    game_num        int auto_increment
        primary key,
    game_name       varchar(100) not null,
    game_type       int          not null,
    game_place      varchar(45)  not null,
    game_img        varchar(255) null,
    game_memo       text         null,
    game_subst_date datetime     not null,
    game_subfn_date datetime     not null,
    game_st_date    datetime     not null,
    game_fn_date    datetime     not null
)
    collate = utf8mb3_bin;

create table fc_java.mem_info
(
    id      varchar(20)                        not null
        primary key,
    pw      varchar(20)                        not null,
    name    varchar(20)                        not null,
    address varchar(120)                       not null,
    b_day   varchar(10)                        not null,
    p_num   varchar(20)                        not null,
    gender  varchar(5)                         not null,
    email   varchar(50)                        not null,
    c_day   datetime default CURRENT_TIMESTAMP not null
)
    charset = utf8mb3;

create table fc_java.freeborder
(
    number int auto_increment
        primary key,
    id     varchar(45) charset utf8mb3        not null,
    title  varchar(45)                        not null,
    memo   text                               not null,
    time   datetime default CURRENT_TIMESTAMP not null,
    constraint fk_freeborder_member
        foreign key (id) references fc_java.mem_info (id)
            on update cascade
)
    collate = utf8mb3_bin;

create table fc_java.freeborderlikes
(
    id     varchar(20) charset utf8mb3 not null,
    number int                         not null,
    primary key (id, number),
    constraint fk_freeborderlikes_freeborder
        foreign key (number) references fc_java.freeborder (number)
            on update cascade on delete cascade,
    constraint fk_freeborderlikes_member
        foreign key (id) references fc_java.mem_info (id)
            on update cascade
)
    collate = utf8mb3_bin;

create table fc_java.prd_board
(
    num    int auto_increment
        primary key,
    title  varchar(45)                        not null,
    bon    text                               not null,
    c_time datetime default CURRENT_TIMESTAMP null,
    u_time datetime default CURRENT_TIMESTAMP null,
    user   varchar(45)                        null,
    constraint fk_prd_board_member
        foreign key (user) references fc_java.mem_info (id)
            on update cascade on delete set null
)
    charset = utf8mb3;

create table fc_java.prdinfo
(
    prd_no       int auto_increment
        primary key,
    prd_name     varchar(255) null,
    prd_price    varchar(45)  null,
    prd_memo     text         null,
    prd_brand    varchar(45)  null,
    prd_category varchar(45)  null,
    prd_image    varchar(45)  null
)
    collate = utf8mb3_bin;

create table fc_java.stadium
(
    g_no       int auto_increment
        primary key,
    gmem_id    varchar(20) charset utf8mb3 not null,
    g_name     varchar(50)                 not null,
    g_time     varchar(45)                 not null,
    g_size     varchar(45)                 not null,
    g_add      varchar(50)                 not null,
    g_memo     text                        not null,
    g_img      varchar(250)                null,
    g_com_num  varchar(45)                 null,
    g_com_add  varchar(250)                null,
    g_com_pnum varchar(20)                 null,
    constraint fk_stadium_member
        foreign key (gmem_id) references fc_java.mem_info (id)
            on update cascade
)
    collate = utf8mb3_bin;

create table fc_java.str_qa
(
    title   varchar(50) not null,
    u_name  varchar(50) not null,
    content text        not null,
    today   datetime    not null
)
    collate = utf8mb3_bin;

create table fc_java.team_info
(
    t_num     int auto_increment
        primary key,
    id        varchar(20)                        not null,
    t_name    varchar(20)                        not null,
    t_logo    varchar(255)                       null,
    hom_city  varchar(30)                        not null,
    week_time varchar(10)                        not null,
    t_info    text                               null,
    t_c_day   datetime default CURRENT_TIMESTAMP not null,
    max_p_num int                                not null,
    t_skill   varchar(10)                        not null,
    t_sns     varchar(255)                       null,
    t_age     varchar(10)                        not null,
    constraint fk_team_info_member
        foreign key (id) references fc_java.mem_info (id)
            on update cascade
)
    charset = utf8mb3;

create table fc_java.game_apply
(
    game_num        int                                not null,
    team_num        int                                not null,
    game_apply_date datetime default CURRENT_TIMESTAMP not null,
    game_applycol   int auto_increment
        primary key,
    constraint uk_game_apply_game_team
        unique (game_num, team_num),
    constraint fk_game_apply_game
        foreign key (game_num) references fc_java.game (game_num)
            on update cascade,
    constraint fk_game_apply_team
        foreign key (team_num) references fc_java.team_info (t_num)
            on update cascade
)
    collate = utf8mb3_bin;

create table fc_java.game_result
(
    game_resultcol int auto_increment
        primary key,
    game_num       int      not null,
    game_type      int      not null,
    team1_num      int      not null,
    team1_score    int      not null,
    team2_num      int      not null,
    team2_score    int      not null,
    game_date      datetime not null,
    constraint fk_game_result_game
        foreign key (game_num) references fc_java.game (game_num)
            on update cascade,
    constraint fk_game_result_team1
        foreign key (team1_num) references fc_java.team_info (t_num)
            on update cascade,
    constraint fk_game_result_team2
        foreign key (team2_num) references fc_java.team_info (t_num)
            on update cascade
)
    collate = utf8mb3_bin;

create table fc_java.pl_info
(
    pl_num     int auto_increment
        primary key,
    t_num      int                                not null,
    id         varchar(20)                        not null,
    pl_pic     varchar(250)                       null,
    back_num   varchar(5)                         not null,
    position   varchar(5) collate utf8mb3_bin     not null,
    pl_memo    varchar(250) collate utf8mb3_bin   null,
    height     varchar(10)                        null,
    weight     varchar(10)                        null,
    pl_ap_date datetime default CURRENT_TIMESTAMP not null,
    constraint uq_pl_info_team_member
        unique (t_num, id),
    constraint fk_pl_info_member
        foreign key (id) references fc_java.mem_info (id)
            on update cascade,
    constraint fk_pl_info_team
        foreign key (t_num) references fc_java.team_info (t_num)
            on update cascade
)
    charset = utf8mb3;

create table fc_java.sta_booking
(
    booking_no    int auto_increment
        primary key,
    b_ground_no   int                                not null,
    b_team_no     int                                not null,
    b_bk_tiem     datetime default CURRENT_TIMESTAMP not null,
    b_vs_team     int                                not null,
    b_won         varchar(45)                        not null,
    b_date        varchar(45)                        not null,
    b_tiem        varchar(45)                        not null,
    b_vs_team_num int                                null,
    constraint fk_sta_booking_stadium
        foreign key (b_ground_no) references fc_java.stadium (g_no)
            on update cascade,
    constraint fk_sta_booking_team
        foreign key (b_team_no) references fc_java.team_info (t_num)
            on update cascade,
    constraint fk_sta_booking_vs_team
        foreign key (b_vs_team_num) references fc_java.team_info (t_num)
            on update cascade on delete set null
)
    collate = utf8mb3_bin;

create table fc_java.t_formation
(
    formation_num  int auto_increment
        primary key,
    t_num          int                                not null,
    formation      varchar(10)                        not null,
    formation_name varchar(7)                         not null,
    position_num   int                                not null,
    player_id      varchar(20)                        not null,
    create_date    datetime default CURRENT_TIMESTAMP not null,
    constraint fk_t_formation_player
        foreign key (t_num, player_id) references fc_java.pl_info (t_num, id)
            on update cascade
)
    charset = utf8mb3;

create table fc_java.team_board
(
    t_num            int                                not null,
    board_num        int                                not null,
    board_id         varchar(20) charset utf8mb3        not null,
    board_title      varchar(45)                        not null,
    board_content    text                               not null,
    board_file       varchar(45)                        null,
    board_readcount  int      default 0                 not null,
    board_createdate datetime default CURRENT_TIMESTAMP not null,
    board_lastupdate datetime default CURRENT_TIMESTAMP not null,
    primary key (t_num, board_num),
    constraint fk_team_board_member
        foreign key (board_id) references fc_java.mem_info (id)
            on update cascade,
    constraint fk_team_board_team
        foreign key (t_num) references fc_java.team_info (t_num)
            on delete cascade
)
    collate = utf8mb3_bin;

create index idx_team_board_createdate
    on fc_java.team_board (t_num, board_createdate);

