OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:facebook,
{
  uid: 1,
  credentials: {
    token: 123456
  },
  info: {
    name: 'User',
    email: 'user@example.com'
  },
  extra: {
    raw_info: {
      name: 'User',
      email: 'user@example.com',
      link: 'http://facebook.local/user',
      first_name: 'User',
      last_name: 'Examploff',
      username: 'user.examploff'
    }
  }
})
