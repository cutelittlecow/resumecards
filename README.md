# 💼 ResumeCards 💼

ResumeCards is a Markdown based resume generator. It looks great on mobile/desktop and can be saved as PDF.

## 💼 Live Demo 💼

### [View Demo and Documentation](http://sammynilla.github.io/resumecards)

![](https://cl.ly/image/3O342N0b0y1h/sample_default.png)

You can save it as PDF too:

![](https://cl.ly/image/091w0b0M2S3G/resume_print_preview.png)

## 💼 Installation 💼

**Note:** This port of ResumeCards uses Hugo. Please read [Hugo's documentation](http://gohugo.io/) if you get stuck.


Fork this repo, clone it, open up a terminal, navigate to the folder, and then run:

```
hugo server
```

If you want to take advantage of the pre-built build systems in place for this project, then you'll want to install Ruby as well as RubyGems.
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

* `config.yml`: You must change `baseurl`.
  * Make sure to restart the server after you update `config.yml`.
* `data/resume.yml`: You must change `photo` and `name`, but . Also, you must set `demo` to `false` to hide everything but your resume.
  * Color and list-style can also be changed inside of this file.
* `data/social.yml`: Change this to update your social media metadata.
* `CNAME`: Change this to host ResumeCards on a custom domain.
* `README.md`: Write your own README!
* `layouts/partials/include/scripts.html`: Extra stuff before the `</body>` tag. Change or remove the default Google Analytics code.
* `layouts/partials/include/social.html`: Add or remove contact links completely from the template

## 💼 License 💼
[MIT License](https://mit-license.org/).

## 💼 Special Thanks 💼
* [Elle Kasai](https://github.com/ellekasai) - Original author of the Jekyll version.
* [Samantha Bartlett](https://github.com/sammynilla) - Hugo port and maintaining.
