create table hotlist (
    id          int not null ,      -- The index counter
    count       int default 0 ,     -- and the click counter
    added       timestamp default now() ,       -- when it was added
    followed    timestamp ,     -- last time it was followed
    checked     timestamp ,     -- last time it was verified
    description varchar not null,           -- What the link is to
    URL         varchar not null,           -- And how to get there
    primary key (id)
    ) ;
