########################################
Controllers:
 -Farmars

 -Markets

 -Vendors


 -Products


 -Sales


########################################
Models:
 -farmar
  	has_many :markets

 -market
   	has_many :vendors

 -vendor
	  belongs_to :market
	  has_many :products
	  has_many :sales

 -product
  	belongs_to :vendor
 		has_many :sales
 
 -sale
  	belongs_to :vendor
  	belongs_to :product

########################################
Views:
 farmars <folder>
  -index 								(choose between acting as a vendor or a market)

 markets <folder>
 	-index 								(shows all markets)
 		-new 								(creates a new market)
 	-show 								(one specific market's profile)
	 	-update 						(can edit that market's details)
	 	-new_vendor					(adds new vendor to that market)
	 	-update_vendor
	 	-delete_vendor?			(confirmation?)

  vendors <folder>
   -index								(shows all vendors)
   -show 								(one specific vendor's profile)
	   -new_product
	   -update_product
	   -delete_product? 	(confirmation?)
	   -create_sale 			(for one product)
	   -sales 						(view all sales for this vendor)
	   -monthly_sales 		(view sales for current month)
