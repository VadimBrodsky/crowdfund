SAMPLE_DATA = {
  names: ['Music Video', 'Ultimate Hacking Keyboard', 'iPod Charging Dock'],
  descriptions: [
    'Super awesome music video',
    'Mechanical switches for the hackers',
    'A high quiality iPod charging dock made from aircraft aluminum and
    titanium, be ready for anything!'
  ],
  target_pledge_amounts: [30_000.00, 200_000.00, 100_000.00],
  websites: [
    'http://www.music.video',
    'https://www.crowdsupply.com/ugl/ultimate-hacking-keyboard',
    'http://www.adock.com'
  ],
  ends: [20, 100, 2]
}

def project_attributes(overrides = {})
  {
    name: SAMPLE_DATA[:names].sample,
    description: SAMPLE_DATA[:descriptions].sample,
    target_pledge_amount: SAMPLE_DATA[:target_pledge_amounts].sample,
    website: SAMPLE_DATA[:websites].sample,
    pledging_ends_on: SAMPLE_DATA[:ends].sample.days.from_now
  }.merge(overrides)
end
