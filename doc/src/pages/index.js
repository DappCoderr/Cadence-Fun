import clsx from "clsx";
import Link from "@docusaurus/Link";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
// import HomepageFeatures from "@site/src/components/HomepageFeatures";

import Heading from "@theme/Heading";
import styles from "./index.module.css";

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <>
      <div class="hero hero--secondary">
        <div class="container">
          <div class="row" style={{ maxWidth: "800px", margin: "auto" }}>
            <div>
              <img style={{ width: "300px" }} src="img/main-page-logo.svg" />
            </div>
            <div class="col col--7">
              <h1
                style={{ fontSize: "3.7rem", color: "#A5DD9B", width: "800px" }}
              >
                Cadence Fun
              </h1>
              <p
                style={{
                  fontSize: "1.1rem",
                  fontWeight: "bold",
                  marginBottom: "30px",
                  width: "500px",
                }}
              >
                Discover Cadence with Fun Games! At Cadence Fun, we've made
                learning about cadence and Flow Blockchain easy and enjoyable.
                Build your understanding of smart contracts by building your own
                game on the Flow chain.
              </p>
              <a
                class="button button--primary"
                href="http://localhost:3000/docs/Module%201/Lesson%201"
                style={{ marginBottom: "5px" }}
              >
                Start learning
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="container" style={{ marginTop: "30px" }}>
        <div class="row">
          <div class="col col--3" style={{ marginBottom: "30px" }}>
            <div class="card">
              <div class="card__body">
                <h4>Project 1</h4>
                <small>Knight Game (Coming Soon...)</small>
              </div>
              <div class="card__footer">
                <a class="button button--primary button--block" href="#">
                  Start →
                </a>
              </div>
            </div>
          </div>
          <div class="col col--3" style={{ marginBottom: "30px" }}>
            <div class="card">
              <div class="card__body">
                <h4>Project 2</h4>
                <small>Crypto Dappy (Coming Soon...)</small>
              </div>
              <div class="card__footer">
                <a class="button button--primary button--block" href="#">
                  Start →
                </a>
              </div>
            </div>
          </div>
          <div class="col col--3" style={{ marginBottom: "30px" }}>
            <div class="card">
              <div class="card__body">
                <h4>Project 3</h4>
                <small>Coming Soon...</small>
              </div>
              <div class="card__footer">
                <a class="button button--primary button--block" href="#">
                  Start →
                </a>
              </div>
            </div>
          </div>
          <div class="col col--3" style={{ marginBottom: "30px" }}>
            <div class="card">
              <div class="card__body">
                <h4>Project 4</h4>
                <small>Coming Soon...</small>
              </div>
              <div class="card__footer">
                <a class="button button--primary button--block" href="#">
                  Start →
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer">
        <div class="container container--fluid">
          <div style={{ fontSize: "1.2em", color: "var(--ifm-heading-color)" }}>
            Who is behind CadenceFun?
          </div>
          <div>
            Cadence Fun is a Developer Grant project build by{" "}
            <a href="https://twitter.com/dappcoder_">DC</a>, a Cadence Smart
            Contract Developer from India.
          </div>
          <div class="footer__links" style={{ marginTop: "30px" }}>
            <a
              class="footer__link-item"
              href="https://discord.com/invite/J6fFnh2xx6"
            >
              Discord
            </a>
            <span class="footer__link-separator">&middot;</span>
            <a
              class="footer__link-item"
              href="https://twitter.com/flow_blockchain"
            >
              Twitter
            </a>
            <span class="footer__link-separator">&middot;</span>
            <a class="footer__link-item" href="https://flow.com/blog">
              Blog
            </a>
          </div>
        </div>
      </footer>
    </>
  );
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description="Description will go into a meta tag in <head />"
    >
      <HomepageHeader />
      <main>{/* <HomepageFeatures /> */}</main>
    </Layout>
  );
}
