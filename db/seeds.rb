CartedProduct.create!([
  {user_id: 1, job_id: 22, status: "purchased", order_id: 9, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 14, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 14, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 14, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 7, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "purchased", order_id: 3, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 14, status: "carted", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 14, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 3, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 4, status: "purchased", order_id: 3, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 25, status: "purchased", order_id: 6, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 28, status: "purchased", order_id: 6, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "removed", order_id: 3, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 3, status: "purchased", order_id: 4, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 4, status: "purchased", order_id: 4, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "purchased", order_id: 5, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 3, status: "purchased", order_id: 5, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 5, status: "purchased", order_id: 5, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 2, status: "purchased", order_id: 5, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 8, status: "purchased", order_id: 5, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "purchased", order_id: 6, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 2, status: "purchased", order_id: 6, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 3, status: "purchased", order_id: 6, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 5, status: "purchased", order_id: 6, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "purchased", order_id: 1, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 2, status: "purchased", order_id: 1, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 3, status: "purchased", order_id: 1, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "purchased", order_id: 2, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 4, status: "purchased", order_id: 2, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 5, status: "purchased", order_id: 2, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 15, status: "purchased", order_id: 2, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 15, status: "carted", order_id: nil, priority: 6, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "purchased", order_id: 7, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 15, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 3, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 1, status: "removed", order_id: nil, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 22, status: "purchased", order_id: 8, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 28, status: "purchased", order_id: 8, priority: 12, job_duration: nil, in_progress: nil},
  {user_id: 1, job_id: 3, status: "purchased", order_id: 8, priority: 12, job_duration: nil, in_progress: nil}
])
Category.create!([
  {category: "last_serv", importance: 7},
  {category: "in_progress", importance: 10},
  {category: "phys_loc", importance: 5},
  {category: "can_do_today", importance: 3},
  {category: "weather_conditions", importance: 1}
])
Job.create!([
  {name: "William Kreutzman", address_1: "14 N. Cass Ave.", phone_number: "6305761212", email: "billy@gmail.com", city: "Darien", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-07 00:00:00", latitude: 41.7964038, longitude: -87.9756373, in_progress: false, duration: 0.5},
  {name: "Bob Weir", address_1: "6015 Cass Ave.", phone_number: "6305561212", email: "bob@gmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-07 00:00:00", latitude: 41.7788275, longitude: -87.9746218, in_progress: false, duration: 0.5},
  {name: "Matt Jones", address_1: "8109 Cass Ave.", phone_number: "6305701212", email: "mjones@gmail.com", city: "Darien", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-07 00:00:00", latitude: 41.7408161, longitude: -87.971981, in_progress: false, duration: 0.25},
  {name: "Alan Beergut", address_1: "25 E. Hinsdale Ave.", phone_number: "6305731212", email: "abeergut@gmail.com", city: "Hinsdale", state: "IL", zip: "60521", user_id: 1, last_service_date: "2016-10-07 00:00:00", latitude: 41.802735, longitude: -87.928432, in_progress: false, duration: 1.25},
  {name: "Timmy Tucker", address_1: "33 N. Cass Ave.", phone_number: "6305811212", email: "ttucker@gmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-09 00:00:00", latitude: 41.7972389, longitude: -87.9751339, in_progress: false, duration: 0.5},
  {name: "Archibald Avocado", address_1: "5901 S. County Line Rd.", phone_number: "6305651212", email: "baldy_avacado@gmail.com", city: "Hinsdale", state: "IL", zip: "60521", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.78209, longitude: -87.914902, in_progress: nil, duration: 0.5},
  {name: "Tony Anthony", address_1: "29 E. First St.", phone_number: "6305751212", email: "tony_pepperoni@gmail.com", city: "Hinsdale", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-11 00:00:00", latitude: 41.801996, longitude: -87.927916, in_progress: false, duration: 0.75},
  {name: "Steven Johnson", address_1: "333 E. Ogden Ave.", phone_number: "6305771212", email: "sjohnson@gmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-13 00:00:00", latitude: 41.8097652, longitude: -87.9667709, in_progress: false, duration: 0.5},
  {name: "John Stevenson", address_1: "15 W. Quincy St.", phone_number: "6305781212", email: "jstevenson@gmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-14 00:00:00", latitude: 41.7950638, longitude: -87.9762138, in_progress: false, duration: 0.5},
  {name: "Sue Jones", address_1: "3900 Highland Ave.", phone_number: "6305601212", email: "sjones@gmail.com", city: "Downers Grove", state: "IL", zip: "60515", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.816719, longitude: -88.010595, in_progress: false, duration: 0.5},
  {name: "Stephanie Apple", address_1: "1702 Plainfield Rd.", phone_number: "6305611212", email: "applesteph@gmail.com", city: "Darien", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7450469, longitude: -87.9853194, in_progress: false, duration: 0.5},
  {name: "Stuart Banana", address_1: "1041 S. Frontage Rd.", phone_number: "6305621212", email: "banana_stu@gmail.com", city: "Darien", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7256171, longitude: -87.987153, in_progress: false, duration: 0.5},
  {name: "Alex Pear", address_1: "401 Plainfield Rd.", phone_number: "6305631212", email: "peary_interesting@gmail.com", city: "Darien", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7563765, longitude: -87.9556665, in_progress: false, duration: 0.5},
  {name: "Steve Strawberry", address_1: "19 E. Chicago Ave.", phone_number: "6305641212", email: "strawberry_steve_123@gmail.com", city: "Hinsdale", state: "IL", zip: "60521", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.804018, longitude: -87.928727, in_progress: false, duration: 0.5},
  {name: "Topsy Turvy", address_1: "7 N. Prospect Ave.", phone_number: "6305661212", email: "tturvy@gmail.com", city: "Clarendon Hills", state: "IL", zip: "60514", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.798179, longitude: -87.954478, in_progress: false, duration: 0.5},
  {name: "Topsy Krett", address_1: "1 N. Prospect Ave.", phone_number: "6305671212", email: "TopsyKrett@gmail.com", city: "Clarendon Hills", state: "IL", zip: "60514", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7977139, longitude: -87.9543025, in_progress: false, duration: 0.5},
  {name: "Kyle Kardashian", address_1: "2153 75th St.", phone_number: "6305821212", email: "kk_dash@gmail.coom", city: "Darien", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7489316, longitude: -87.9979885, in_progress: false, duration: 0.5},
  {name: "Joan Smith", address_1: "500 N. Cass Ave.", phone_number: "6305571212", email: "joan@gmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.8071438, longitude: -87.9764039, in_progress: false, duration: 0.5},
  {name: "Scott Towelson", address_1: "500 W. Hinsdale Ave.", phone_number: "6305691212", email: "scott_towels@gmail.com", city: "Hinsdale", state: "IL", zip: "60521", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.8001471, longitude: -87.9383536, in_progress: false, duration: 0.5},
  {name: "Albert Albertester", address_1: "246 N. Cass Ave.", phone_number: "6305711212", email: "albert@gmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.8015524, longitude: -87.9758817, in_progress: false, duration: 0.5},
  {name: "Julie Julenberg", address_1: "2201 75th St.", phone_number: "6305741212", email: "jj_ulenberg@gmail.com", city: "Darien", state: "IL", zip: "60561", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7511966, longitude: -88.0030279, in_progress: false, duration: 0.5},
  {name: "Hilda Hilltop", address_1: "18 E. 1st St.", phone_number: "6305791212", email: "hil_hilltop@gmail.com", city: "Hinsdale", state: "IL", zip: "60521", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.8014159, longitude: -87.9283398, in_progress: false, duration: 0.5},
  {name: "Jimmy Jimsteroo", address_1: "80 S. LaGrange Rd.", phone_number: "6305801212", email: "jjimsteroo@gmail.com", city: "LaGrange", state: "IL", zip: "60525", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.8126758, longitude: -87.869864, in_progress: false, duration: 0.5},
  {name: "Champ Peon", address_1: "452 Park Ave.", phone_number: "6305681212", email: "champ_peon@gmail.com", city: "Clarendon Hills Rd.", state: "IL", zip: "60514", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7849718, longitude: -87.9555218, in_progress: false, duration: 0.5},
  {name: "Phil Lesh", address_1: "31 W. Quincy St.", phone_number: "6305551212", email: "philzone@gmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7949356, longitude: -87.9770737, in_progress: false, duration: 0.5},
  {name: "Allison Apricot", address_1: "20 E. Maple St.", phone_number: "6305571212", email: "allpricot@gmail.com", city: "Hinsdale", state: "IL", zip: "60521", user_id: 1, last_service_date: nil, latitude: 41.8043857, longitude: -87.9283676, in_progress: nil, duration: 0.5},
  {name: "Jim-Bob Smith", address_1: "5101 Walnut Ave.", phone_number: "6305591212", email: "jbjones@gmail.com", city: "Downers Grove", state: "IL", zip: "60515", user_id: 1, last_service_date: "2016-10-15 00:00:00", latitude: 41.7931936, longitude: -88.0514298, in_progress: false, duration: 0.5},
  {name: "Jerry Garcia", address_1: "6010 Cass Ave.", phone_number: "6305721212", email: "jerry_g@deadmail.com", city: "Westmont", state: "IL", zip: "60559", user_id: 1, last_service_date: "2016-10-07 00:00:00", latitude: 41.778273, longitude: -87.9754344, in_progress: true, duration: 1.5}
])
Order.create!([
  {user_id: 1},
  {user_id: 1},
  {user_id: 1},
  {user_id: 1},
  {user_id: 1},
  {user_id: 1},
  {user_id: 1},
  {user_id: 1},
  {user_id: 1}
])
User.create!([
  {name: "joe", email: "joe@gmail.com", password_digest: "$2a$10$/z.B/SPk88sqFDUNH6B.NeBaCcTb3cNv0n0gVBOOCCdraJhKbkUZa"}
])
