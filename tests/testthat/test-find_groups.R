test_that("find_groups() success case", {
  withr::local_options(list(meetupr.use_oauth = FALSE))
  set_api_key("R-Ladies FTW!")

  meetup_groups <- with_mock(
    `httr::GET` = function(url, query, ...) {
      load(test_path("testdata/httr_get_find_groups.rda"))
      return(req)
    },
    meetup_groups <- find_groups(api_key = "R-Ladies FTW!")
  )

  expect_equal(nrow(meetup_groups), 1, label="check find_groups() returns one result")
  expect_equal(meetup_groups$name, "R-Ladies London", label="check find_groups() content (name)")
})

test_that("find_groups() with parameters", {
  withr::local_options(list(meetupr.use_oauth = FALSE))
  set_api_key("R-Ladies FTW!")

  meetup_groups <- with_mock(
    `httr::GET` = function(url, query, ...) {
      load(test_path("testdata/httr_get_find_groups.rda"))
      return(req)
    },
    meetup_groups <- find_groups(api_key = "R-Ladies FTW!",
                                 text = "hihi", radius = "foo")
  )

  expect_equal(nrow(meetup_groups), 1, label="check find_groups() returns one result")
  expect_equal(meetup_groups$name, "R-Ladies London", label="check find_groups() content (name)")
})
