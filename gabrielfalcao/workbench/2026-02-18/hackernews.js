(() =>
  [console.log, copy].reduce(
    (text, fn) => {
      const urlsAndTitles = Array.from(
        new Set(document.querySelectorAll(`table td span.titleline a[href]`)),
      ).map((el) => {
        let url = null;
        try {
          url = URL(`${el.href}`);
        } catch (_) {
          url = URL(`https://news.ycombinator.com${el.href}`);
        }
        const title = el.innerText;
        return { title, url };
      });
      const urls = urlsAndTitles.map(({ url }) => url.toString());
      const urlCommentTitleList = urlsAndTitles
        .map(({ title, url }) => `"${url}"    // ${title}`)
        .join("\n");
    },
    [fn(text), text].pop(),
  ))();
