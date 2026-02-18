const hnScrapeMain = () => {
  const urlsAndTitles = Array.from(
    new Set(document.querySelectorAll(`table td span.titleline a[href]`)),
  ).map((el) => {
    let url = null;
    try {
      url = new URL(`${el.href}`);
    } catch (_) {
      url = new URL(`https://news.ycombinator.com${el.href}`);
    }
    const title = el.innerText;
    return { title, url };
  });
  const urls = urlsAndTitles.map(({ url }) => url.toString());
  const urlCommentTitleList = urlsAndTitles
    .map(({ title, url }) => `"${url}"    // ${title}`)
    .join("\n");
  return { urlsAndTitles, urls, urlCommentTitleList };
};

(() => {
  const contexts = {
    ...hnScrapeMain(),
    widestTitleLength: 0,
    widestUrlLength: 0,
  };
  Object.entries(contexts).forEach((item, index) => {
    const { title, url } = item;
    if (title.length > context.widestTitleLength) {
      widestTitleLength = title.length;
    }
    if (url.length > context.widestUrlLength) {
      widestUrlLength = url.length;
    }
  });

  return contexts;
})();
