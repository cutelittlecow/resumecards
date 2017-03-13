# 💼 ResumeCards 💼

ResumeCards is a Markdown based resume generator. It looks great on mobile/desktop and can be saved as PDF.

## 💼 Live Demo 💼

### [View Demo and Documentation](http://cutelittlecow.github.io/resumecards)

![](https://cl.ly/image/3O342N0b0y1h/sample_default.png)

You can save it as PDF too:

![](https://cl.ly/image/091w0b0M2S3G/resume_print_preview.png)

## 💼 Installation 💼

**Note:** This port of ResumeCards uses Hugo. Please read [Hugo's documentation](http://gohugo.io/) if you get stuck.


Fork this repo, clone it, open up a terminal, navigate to the folder, and then run:

```
hugo server
```

If you want to take advantage of the pre-built build systems in place for this project, then you'll want to install Ruby.
Once that's finished, go ahead and open up another terminal, navigate to the folder, and install the Ruby bundle using:

```
bundle install
```

This only needs to be done once, and afterwards you can omit that command and simply call the build/watch script by using:

```
ruby build.rb
```

### Warning

* Once the server is started, you must go to [http://localhost:1313/resumecards/](http://localhost:1313/resumecards/), since `baseURL` is set as `"/resumecards/"` initially. To use  http://localhost:1313/, change `baseURL` in `config.yml` to `""` .

## 💼 Usage 💼

### Editing Your Resume

Edit `content/post/card-[1-9].md` like this:

```markdown
---
type: "Work Experience"
icon: "building"
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
* `data/social.yml`: Change this to update your social media metadata.
* `CNAME`: Change this to host ResumeCards on a custom domain.
* `README.md`: Write your own README!
* `layouts/partials/include/scripts.html`: Extra stuff before the `</body>` tag. Change or remove the default Google Analytics code.
* `layouts/partials/include/social.html`: Add or remove contact links completely from the template

### Customize the Theme

To customize the color theme, edit the `color` section of `data/resume.yml`.

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
* [Samantha Bartlett](https://github.com/cutelittlecow) - Hugo port and maintaining.
