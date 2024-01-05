import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Brightness from '../../services/brightness.js';

const slider = Widget.Slider({
	on_change: self => Brightness.screen_value = self.value,
	value: Brightness.bind('screen-value'),
});

const label = Widget.Label({
	label: Brightness.bind('screen-value').transform(v => `${v}`),
	setup: self => self.hook(Brightness, (self, screenValue) => {
		//self.label = screenValue ?? 0;
		self.label = `${Brightness.screenValue}`;
	}, 'screen-changed'),
});

export default slider;

