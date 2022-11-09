module planner

import freeflowuniverse.crystallib.texttools

pub enum StoryStatus {
	suggested
	approved
	started
	verify
	closed
}

pub struct Story {
pub mut:
	name        string
	description string
	// path string
	// state        FileStatus
	owner        []string
	contributors []string
	// assignment []StoryAssign // someone works on the story or task, or bug, ...
}

// pub struct StoryAssign {
// pub mut:
// 	person     string
// 	group      string
// 	// membertype StoryAssignType
// 	expiration time.Time
// }

pub enum StoryLineState {
	start
	comment
	checklist
	task
}

fn (mut story Story) params_process(p texttools.Params) ? {
	println(p)
	panic('qq')
}

// load the lines into a story object
fn (mut story Story) load(lines []string) ? {
	mut headerlevel := 0
	mut state := StoryLineState.start
	mut checklists := Checklists{}
	mut comments := Comments{}
	lines << '# END'
	for line in lines {
		println(' -- $line')
		argsfound, params := line_parser_params(line)?
		if argsfound {
			story.params_process(params)?
			continue
		}
		if line.starts_with('#') {
			line2 := line[1..].trim(' ').to_lower()
			if line2.starts_with('comment') {
				state = StoryLineState.comment
				comments.new(line2) // get new comments
				continue
			}
			if line2.starts_with('checklist') {
				state = StoryLineState.checklist
				checklist := checklists.new(line2) // get new checklist
				continue
			}
		}
		// find the checklist
		if state == StoryLineState.checklist {
			if line.starts_with('#') {
				checklists.list_current_finish()
				state == StoryLineState.start
			} else {
				checklist.list_current_add(line)
				continue
			}
		}

		// find the comment
		if state == StoryLineState.comment {
			if line.starts_with('#') {
				comments.comment_current_finish()
				state == StoryLineState.start
			} else {
				comments.comment_current_add(line)
				continue
			}
		}
	}
}
