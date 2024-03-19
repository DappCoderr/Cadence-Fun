// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import { themes as prismThemes } from "prism-react-renderer";

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: "Cadence Fun",
  tagline: "Dinosaurs are cool",
  favicon: "img/favicon.ico",

  // Set the production url of your site here
  url: "https://your-docusaurus-site.example.com",
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: "/",

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: "cadencefun", // Usually your GitHub org/user name.
  projectName: "Cadence-Fun", // Usually your repo name.

  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  presets: [
    [
      "classic",
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: "./sidebars.js",
          editUrl:
            "https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/",
        },
        theme: {
          customCss: "./src/css/custom.css",
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      // image: "img/docusaurus-social-card.jpg",
      navbar: {
        items: [
          {
            position: "left",
            label: "Home",
            to: "/",
          },
          {
            position: "left",
            label: "Playground",
            to: "https://play.flow.com/",
          },
          {
            position: "left",
            label: "Faucet",
            to: "https://testnet-faucet.onflow.org/",
          },
          {
            position: "left",
            label: "Block Explorer",
            to: "https://www.flowdiver.io/",
          },
          {
            position: "left",
            label: "Emerald Academy Course",
            to: "https://academy.ecdao.org/en/catalog/courses/learn-cadence-beginner-1.0",
          },
          {
            position: "left",
            label: "Cadence 1.0-Docs",
            to: "https://cadence-lang.org/docs/1.0/",
          },
        ],
      },
      footer: {
        // style: "dark",
        copyright: `Copyright © ${new Date().getFullYear()} Built with Docusaurus`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    }),
};

export default config;
