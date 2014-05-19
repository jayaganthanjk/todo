class Activity < ActiveRecord::Base
		def change
	create table :activities do |t|
		t.text :job
		t.timestamps
	end
end
end
