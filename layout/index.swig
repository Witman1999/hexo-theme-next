{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %} {{ theme.keywords }} - {{ config.title }}{{ theme.description }} {% endblock %}


{% block content %}
  <div id="posts" class="posts-expand">
    {%- for post in page.posts %}
      {{ partial('_macro/post.swig', {is_index: true}) }}
    {%- endfor %}
  </div>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
