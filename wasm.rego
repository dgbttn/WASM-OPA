package wasm

import data.policy
import input.password

test["minlength"] {
	minlen := policy.minlength
	count(password) < minlen
}

test["maxlength"] {
	maxlen := policy.maxlength
	count(password) > maxlen
}

test["letter"] {
	pattern := "[a-zA-Z]"
	require := policy.letter
	count(regex.find_all_string_submatch_n(pattern, password, require)) < require
}

test["lowercase"] {
	pattern := "[a-z]"
	require := policy.lowercase
	count(regex.find_all_string_submatch_n(pattern, password, require)) < require
}

test["uppercase"] {
	pattern := "[A-Z]"
	require := policy.uppercase
	count(regex.find_all_string_submatch_n(pattern, password, require)) < require
}

test["number"] {
	pattern := "[0-9]"
	require := policy.number
	count(regex.find_all_string_submatch_n(pattern, password, require)) < require
}

test["special"] {
	pattern := "\\W"
	require := policy.special
	count(regex.find_all_string_submatch_n(pattern, password, require)) < require
}

test["regex"] {
	pattern := policy.regex
	regex.is_valid(pattern)
	not regex.match(pattern, password)
}
