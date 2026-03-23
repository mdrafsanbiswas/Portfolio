abstract class PortfolioLocalDataSource {
  Future<Map<String, dynamic>> loadPortfolioData();
}

class MockPortfolioLocalDataSource implements PortfolioLocalDataSource {
  @override
  Future<Map<String, dynamic>> loadPortfolioData() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _mockData;
  }
}

const Map<String, dynamic> _mockData = {
  'profile': {
    'name': 'John Cooper',
    'role': 'Creative Technologist',
    'shortBio':
        'I am John, a Creative Technologist focused on thoughtful digital experiences for web and mobile products.',
    'longBio':
        'I blend design systems, front-end engineering, and product thinking to ship polished interfaces with measurable impact.',
    'location': 'San Francisco, CA',
    'email': 'john.cooper@portfolio.dev',
    'availability': 'Available for freelance work',
    'ctaLabel': 'Let\'s Talk',
  },
  'stats': [
    {'label': 'Years', 'value': '06+'},
    {'label': 'Projects', 'value': '42'},
    {'label': 'Clients', 'value': '18'},
  ],
  'experiences': [
    {
      'role': 'Senior Product Designer',
      'company': 'Pixelcraft Studio',
      'period': '2023 - Present',
      'description':
          'Leading end-to-end product design for SaaS dashboards and design systems.',
      'highlights': [
        'Built a reusable UI kit used across 4 product teams.',
        'Reduced handoff inconsistencies by introducing token-based specs.',
      ],
    },
    {
      'role': 'UI/UX Designer',
      'company': 'Northwind Labs',
      'period': '2020 - 2023',
      'description':
          'Designed responsive product flows for B2B tools and marketing sites.',
      'highlights': [
        'Improved activation by 21% through onboarding redesign.',
        'Collaborated closely with Flutter and React engineering teams.',
      ],
    },
  ],
  'projects': [
    {
      'title': 'Analytics Dashboard',
      'category': 'Web App',
      'description':
          'A data-rich admin dashboard with modular widgets and advanced filtering.',
      'tags': ['Flutter Web', 'Design System', 'Data Viz'],
      'accentHex': '#5A62EA',
    },
    {
      'title': 'Music Discovery Mobile',
      'category': 'Mobile App',
      'description':
          'A vibrant music browsing app focused on mood-based recommendations.',
      'tags': ['Flutter', 'Micro interactions', 'A/B tested'],
      'accentHex': '#F84F62',
    },
    {
      'title': 'Auto Marketplace',
      'category': 'E-commerce',
      'description':
          'A conversion-focused marketplace with storytelling visuals and smooth checkout.',
      'tags': ['Responsive', 'Checkout UX', 'Performance'],
      'accentHex': '#1E293B',
    },
  ],
  'articles': [
    {
      'title': 'Designing Scalable Dashboards',
      'summary':
          'How to build modular interfaces without losing visual rhythm.',
      'publishedDate': 'Mar 12, 2026',
      'readTime': '6 min read',
    },
    {
      'title': 'Motion as Product Feedback',
      'summary': 'Using subtle motion to improve confidence and usability.',
      'publishedDate': 'Feb 27, 2026',
      'readTime': '4 min read',
    },
  ],
  'skillGroups': [
    {
      'groupTitle': 'Design',
      'skills': [
        'Product Design',
        'Wireframing',
        'Design Systems',
        'Prototyping',
      ],
    },
    {
      'groupTitle': 'Development',
      'skills': ['Flutter', 'Dart', 'Responsive Web', 'Component Architecture'],
    },
  ],
  'socialLinks': [
    {'label': 'Dribbble', 'url': 'https://dribbble.com', 'icon': 'dribbble'},
    {'label': 'GitHub', 'url': 'https://github.com', 'icon': 'github'},
    {'label': 'LinkedIn', 'url': 'https://linkedin.com', 'icon': 'linkedin'},
    {'label': 'X', 'url': 'https://x.com', 'icon': 'x'},
  ],
};
