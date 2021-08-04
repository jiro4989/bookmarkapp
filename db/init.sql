CREATE TABLE user (
  primary key (id),

  id         VARCHAR(255) NOT NULL,
  email      VARCHAR(255) NOT NULL,
  password   TEXT         NOT NULL,
  name       VARCHAR(255) NOT NULL,
  created_at DATETIME     NOT NULL DEFAULT NOW(),
  updated_at DATETIME     NOT NULL DEFAULT NOW(),
  deleted_at DATETIME
);

CREATE TABLE bookmark (
  primary key (id),

  id         VARCHAR(255) NOT NULL,
  user_id    VARCHAR(255) NOT NULL,
  name       VARCHAR(255) NOT NULL,
  url        TEXT         NOT NULL,
  note       TEXT,
  created_at DATETIME     NOT NULL DEFAULT NOW(),
  updated_at DATETIME     NOT NULL DEFAULT NOW(),
  deleted_at DATETIME,

  FOREIGN KEY fk_user_id(user_id) REFERENCES user(id)
);

CREATE TABLE tag (
  primary key (id),

  id         VARCHAR(255) NOT NULL,
  user_id    VARCHAR(255) NOT NULL,
  name       VARCHAR(255) NOT NULL,
  created_at DATETIME     NOT NULL DEFAULT NOW(),
  updated_at DATETIME     NOT NULL DEFAULT NOW(),

  FOREIGN KEY fk_user_id(user_id) REFERENCES user(id)
);

CREATE TABLE bookmark_tag_link (
  primary key (bookmark_id, tag_id),

  bookmark_id VARCHAR(255) NOT NULL,
  tag_id      VARCHAR(255) NOT NULL,
  created_at  DATETIME     NOT NULL DEFAULT NOW(),
  updated_at  DATETIME     NOT NULL DEFAULT NOW(),

  FOREIGN KEY fk_bookmark_id(bookmark_id) REFERENCES bookmark(id),
  FOREIGN KEY fk_tag_id(tag_id) REFERENCES tag(id)
);

CREATE TABLE plan (
  primary key (id),

  id         INTEGER(4)   NOT NULL,
  name       VARCHAR(255) NOT NULL,
  created_at DATETIME     NOT NULL DEFAULT NOW(),
  updated_at DATETIME     NOT NULL DEFAULT NOW()
);

CREATE TABLE contract (
  primary key (id),

  user_id        VARCHAR(255) NOT NULL,
  plan_id        VARCHAR(255) NOT NULL,
  created_at     DATETIME     NOT NULL DEFAULT NOW(),
  updated_at     DATETIME     NOT NULL DEFAULT NOW(),
  activated_at   DATETIME     NOT NULL,
  deactivated_at DATETIME     NOT NULL,

  FOREIGN KEY fk_user_id(user_id) REFERENCES user(id),
  FOREIGN KEY fk_plan_id(plan_id) REFERENCES plan(id)
);
