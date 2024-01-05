import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Workspaces from './components/workspaces.js';
import Clock from './components/clock.js';
//import SysTray from './components/systray.js';
//import Volume from './components/volume.js';
import Brightness from './components/brightness.js';
//import Battery form './components/battery.js';

const Start = () => Widget.Box({
	spacing: 8,
	children: [
		Workspaces(),
	],
});

const Center = () => Widget.Box({
	spacing: 8,
	children: [
		Clock(),
	],
});

const End = () => Widget.Box({
	spacing: 8,
	children: [
		//SysTray(),
		//Volume(),
		Brightness,
		//Battery(),
	],
});

export const Bar = (monitor = 0) => Widget.Window({
	name: `bar-${monitor}`,
	class_name: 'bar',
	monitor,
	anchor: ['top', 'left', 'right'],
	exclusivity: 'exclusive',
	child: Widget.CenterBox({
		start_widget: Start(),
		center_widget: Center(),
		end_widget: End(),
	}),
});
