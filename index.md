---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

<div class="tagcloud">
{% for tag in site.tags %}
    <li style="font-size: {{ tag | last | size | times: 100 | divided_by: site.tags.size| plus: 70 }}%">
        <a href="{{site.baseurl}}/tags/{{ tag | first |downcase | slugize }}/">
            {{ tag | first }}
        </a>

    </li>
{% endfor %}
</div>
