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


 
 
