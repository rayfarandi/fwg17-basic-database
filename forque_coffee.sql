create table if not exists "product"(
	"product_id" serial primary key,
	"name_product" varchar (50) not null,
	"price" int not null,
	"category" varchar(15) not null,
	"description_product" varchar (70) not null,
	"stok_quantity" int not null,
	"created_at" timestamp default now() not null,
	"update_at" timestamp
);
 create table if not exists "promo"(
 	"promo_id" serial primary key,
 	"name_promo" varchar (20) not null,
 	"min_purches" int not null,
 	"max_discount" int not null,
 	"discount_percentage" numeric(5,2) not null
 );
 
 create table if not exists "user"(
 	"user_id" serial primary key,
 	"username" varchar(50) not null,
 	"email" varchar(100) not null,
 	"password" varchar(30) not null,
 	"full_name" varchar(55) not null,
 	"birthday" date not null,
 	"phone_number" numeric(15) not null
 	
);

 create table if not exists "order"(
 	"order_id" serial primary key,
 	"user_id" int references "user"("user_id"),
 	"order_date" timestamp default now() not null,
 	"total_amount" numeric (10,2) not null,
 	"status" varchar (25) not null
 );
 

insert into "product" ("name_product","price","category","description_product","stok_quantity")
values ('Artic Monkey',24000,'coffee','coffee,milk,brownSugar,creamLate',50),
		('Bolt Thrower',28000,'coffee','strongCoffee,milk,smoothFoam',50);

insert into "promo" ("name_promo","min_purches","max_discount","discount_percentage")
values ('NovemberWEEK',50000,10000,50.00);

insert into "user" ("username","email","password","full_name","birthday","phone_number")
values ('ran1','ran1@gmail.com','fazztrack','ranran','1994-02-14','877777756');

insert into "user" ("username","email","password","full_name","birthday","phone_number")
values ('ran','ran@gmail.com','fazztrack','ranran','1994-02-14','0877777756');

alter table public."user" alter column "phone_number" type varchar(15) using phone_number::varchar;

delete from public."user" where "user_id" = 1; 

insert into "order" ("user_id","total_amount","status")
values ('2','70000','selesa');


alter table "user"
add "created_at" timestamp default now() not null,
add "update_at" timestamp;

update "user" set "birthday" = '1994-09-15', "update_at"= 'now()' where "user_id"=2;

alter table "order"
add "created_at" timestamp default now() not null,
add "update_at" timestamp;

alter table "promo"
add "created_at" timestamp default now() not null,
add "update_at" timestamp;


--baris mulai perbaikan

alter table "product" rename to "products" ;
alter table "products" alter column "price" type numeric(10,2);
alter table "products" alter column "description_product" type text;
alter table "products" drop column "category";
alter table "products" add column "is_available" boolean;
alter table "products" rename column "product_id" to "id";

alter table "promo" rename column "promo_id" to "id"; 
alter table "promo" rename column "id;" to "id";
alter table "promo" rename column "name_promo" to "vocher_id";
alter table "promo" add column "description" text;

create table if not exists "categories"(
	"id" serial primary key,
	"name" varchar (50) not null,
	"description" text,
	"promo_id" int references "promo" ("id"),
	"created_at" timestamp default now(),
	"update_at" timestamp
);




 
 
