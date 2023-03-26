local scheme = require("random").random
-- if we try to execute this now, it doesn't do anything. but wrapped in defer_fn it works.
vim.defer_fn(scheme, 0)
