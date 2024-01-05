import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { exec, execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const Clock = () => Widget.Label({
	class_name: 'clock',
	setup: self => self
		.poll(1000, self => execAsync(['date', '+%b %e %I:%M %p'])
			.then(date => self.label = date)),
});

export default Clock;
