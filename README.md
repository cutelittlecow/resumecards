# 💼 ResumeCards 💼

ResumeCards is a Markdown based resume generator. It looks great on mobile/desktop and can be saved as PDF.

## 💼 Live Demo 💼

### [View Demo and Documentation](http://cutelittlecow.github.io/resumecards)

![](https://cl.ly/image/3O342N0b0y1h/sample_default.png)

You can save it as PDF too:

![](https://cl.ly/image/091w0b0M2S3G/resume_print_preview.png)

## 💼 Installation 💼

**Note:** This port of ResumeCards uses Hugo. Please read [Hugo's documentation](http://gohugo.io/) if you get stuck.

Fork this repo, clone it, and then run:

```
hugo server
```

Use build.bat currently on windows (no multiplatform tools currently, sorry) to compile and compress resumecards.scss if you make changes.
### Warning

* Once the server is started, you must go to [http://localhost:1313/resumecards/](http://localhost:1313/resumecards/), since `baseURL` is set as `"/resumecards/"` initially. To use  http://localhost:1313/, change `baseURL` in `config.yml` to `""` .

## 💼 Usage 💼

### Editing Your Resume

Edit `_posts/card-[1-9].md` like this:

```markdown
---
type: "Work Experience"
heading: "Bizreach"
subheading: "Junior Product Designer"
duration: "October 2013 – September 2014 (1 year)"
location: "Tokyo, Japan"
---

Write in markdown here...
```

If you don't need some of the metadata, just remove them:

```markdown
---
type: "Work Experience"
heading: "Bizreach"
---
```

### Other Files to Modify

You **should** change these files before deploying:

* `config.yml`: You must change `baseurl` and `url`.
  * Make sure to restart the server after you update `config.yml`.
* `data/resume.yml`: You must change `photo`, `name` and `url`. Also, you must set `demo` to `false` to hide everything but your resume.
* `CNAME`: Change this to host ResumeCards on a custom domain.
* `README.md`: Write your own README!
* `layouts/partials/include/scripts.html`: Extra stuff before the `</body>` tag. Change or remove the default Google Analytics code.
* `layouts/partials/include/social.html`: Modify or remove your contact links.

### Customize the Theme

~~To customize the color theme, edit the `color` section of `data/resume.yml`.~~  
**Note:** One of the pitfalls of using Hugo vs Jekyll is the fact that Hugo doesnt support Yaml front matter in Sass. This unfortunately currently makes the `color` section of `data/resume.yml` not work as intended. To change colors currently, you'll need to edit the following, changing default to whatever color you choose:
```
$theme-color: map-get(map-get($all-colors, "default"), "base");
$theme-sub: map-get(map-get($all-colors, "default"), "sub");
$theme-text: map-get(map-get($all-colors, "default"), "text");
$theme-muted: map-get(map-get($all-colors, "default"), "muted");
$theme-bg: map-get(map-get($all-colors, "default"), "bg");
$theme-heading: map-get(map-get($all-colors, "default"), "heading");
```

#### Red
![](http://cl.ly/image/0Q442g393E0O/sample_red.png)

#### Pink
![](http://cl.ly/image/2r0d3C201Q2y/sample_pink.png)

#### Brown
![](http://cl.ly/image/1A3p0v2n2I2O/sample_brown.png)

#### Blue
![](http://cl.ly/image/102r3e1y010w/sample_blue.png)

#### Purple
![](http://cl.ly/image/130Y2y1X1228/sample_purple.png)

#### Teal
![](http://cl.ly/image/3L042k3L3i2m/sample_teal.png)

#### Green
![](http://cl.ly/image/031u3a070V3f/sample_green.png)

## 💼 Author & License 💼

Elle Kasai

- [Website](http://ellekasai.com/about)
- [Twitter](http://twitter.com/ellekasai)

[MIT License](http://ellekasai.mit-license.org).

## 💼 Special Thanks 💼
* [Shu Uesugi](https://github.com/chibicode) - for the guidance on this project.
* [Samantha Davis](https://github.com/cutelittlecow) - Hugo port and maintaining.

## 📋 Changes to Come? 📋
* Some way to use yaml front matter in our sass...maybe injection?
* Multiplatform build tools for sass watch/build, and site publication.

