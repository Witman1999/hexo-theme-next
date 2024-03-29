<!DOCTYPE html>

{# NexT version #}
{%- set version = next_env('version') %}

{# Language & Config #}
{%- set title = __('title') !== 'title' && __('title') || config.title %}
{%- set subtitle = __('subtitle') !== 'subtitle' && __('subtitle') || config.subtitle %}
{%- set author = __('author') !== 'author' && __('author') || config.author %}
{%- set description = __('description') !== 'description' && __('description') || config.description %}

{%- if theme.pjax %}
  {%- set pjax = ' pjax' %}
{%- endif %}

<html lang="{{ config.language }}">
<head>
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  {{- next_inject('head') }}
  <title>{% block title %}{% endblock %}</title>
  <meta name="generator" content="Hexo {{ hexo_env('version') }}">
  {{ partial('_third-party/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
  <div class="container{%- if theme.motion.enable %} use-motion{%- endif %}">
    <div class="headband"></div>

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner">{% include '_partials/header/index.swig' %}</div>
    </header>

    {{ partial('_partials/widgets.swig', {}, {cache: theme.cache.enable}) }}

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          {%- if theme.scheme === 'Pisces' || theme.scheme === 'Gemini' %}
            {% include '_partials/header/sub-menu.swig' %}
          {%- endif %}
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
        {%- if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {%- endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-inner">
        {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
        {{ partial('_partials/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
        {% block footer %}{% endblock %}
      </div>
    </footer>
  </div>

  {{ partial('_scripts/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_third-party/index.swig', {}, {cache: theme.cache.enable}) }}

  {%- if theme.pjax %}
    <div id="pjax">
  {%- endif %}

  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/quicklink.swig' %}
  {% include '_third-party/vkontakte-api.swig' %}

  {{- next_inject('bodyEnd') }}

  {%- if theme.pjax %}
    </div>
  {%- endif %}
  copy<!-- 代码块复制功能 -->
<script type="text/javascript" src="/js/clipboard.min.js"></script>  
<script type="text/javascript" src="/js/clipboard-use.js"></script>

  
</body>
</html>
