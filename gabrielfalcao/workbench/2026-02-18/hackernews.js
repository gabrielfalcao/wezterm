const hnScrapeMain = () => {
  const printerContext = {
    widestTitleLength: 0,
    widestUrlLength: 0,
  };
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
    if (title.length > printerContext.widestTitleLength) {
      widestTitleLength = title.length;
    }
    if (url.length > printerContext.widestUrlLength) {
      widestUrlLength = url.length;
    }
    return { title, url };
  });
  const urls = urlsAndTitles.map(({ url }) => url.toString());
  const urlCommentTitleList = urlsAndTitles
    .map(({ title, url }) => `"${url}"    // ${title}`)
    .join("\n");
  /* console.log({ urlsAndTitles, urls, urlCommentTitleList });
   * console.log(urlCommentTitleList); */
  const urlContext = { urlsAndTitles, urls, urlCommentTitleList };
  return { ...printerContext, ...urlContext };
};

(() => {
  const context = hnScrapeMain();
})();
