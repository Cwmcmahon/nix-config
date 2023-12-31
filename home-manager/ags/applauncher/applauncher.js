import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import App from 'resource:///com/github/Aylur/ags/app.js';
import Applications from 'resource:///com/github/Aylur/ags/service/applications.js';

const AppItem = app => Widget.Button({
	on_clicked: () => {
		App.closeWindow('applauncher');
		app.launch();
	},
	attribute: { app },
	child: Widget.Box({
		children: [
			Widget.Icon({
				icon: app.icon_name || '',
				size: 42,
			}),
			Widget.Label({
				class_name: 'title',
				label: app.name,
				xalign: 0,
				vpack: 'center',
				truncate: 'end',
			}),
		],
	})
});

const Applauncher = ({ width = 960, height = 540, spacing = 12 }) => {
	// list of application buttons
	let applications = Applications.query('').map(AppItem);

	// container holding the buttons
	const list = Widget.Box({
		vertical: true,
		children: applications,
		spacing,
	}); 

	// repopulate the box, so the most frequent apps are on top of the list
	function repopulate() {
		applications = Applications.query('').map(AppItem);
		list.children = applications;
	}

	// search entry
	const entry = Widget.Entry({
		hexpand: true,
		css: `margin-bottom: ${spacing}px;`,

		// to launch the first item on Enter
		on_accept: () => {
			if (applications[0]) {
				App.toggleWindow('applauncher');
				applications[0].attribute.app.launch();
			}
		},

		// filter the list
		on_change: ({ text }) => applications.forEach(item => {
			item.visible = item.attribute.app.match(text);
		}),
	});

	return Widget.Box({
		vertical: true,
		css: `margin: ${spacing * 2}px`,
		children: [
			entry,

			// wrap list in a scrollable
			Widget.Scrollable({
				hscroll: 'never',
				css: `
					min-width: ${width}px;
					min-height: ${height}px;
				`,
				child: list,
			}),
		],
		setup: self => self.hook(App, (_, windowName, visible) => {
			if (windowName !== 'applauncher')
				return;

			// when applauncher shows up
			if (visible) {
				repopulate();
				entry.text = '';
				entry.grab_focus();
			}
		}),
	});
};

export const applauncher = Widget.Window({
	name: 'applauncher',
	popup: true,
	visible: false,
	focusable: true,
	child: Applauncher({
		width: 960,
		height: 500,
		spacing: 12,
	}),
});
