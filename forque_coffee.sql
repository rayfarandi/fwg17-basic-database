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

ALTER TABLE public."user" ALTER COLUMN "phone_number" TYPE varchar(15) USING phone_number::varchar;

delete from public."user" where "user_id" = 1; 

insert into "order" ("user_id","total_amount","status")
values ('2','70000','selesa');







 
 
