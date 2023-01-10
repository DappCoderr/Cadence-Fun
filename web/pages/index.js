import Head from 'next/head'

export default function Home() {
  return (
    <div className="container">
      <Head>
        <title>Cadence Fun</title>
        {/* <link rel="icon" href="/favicon.ico" /> */}
      </Head>

      <main>
        <h1 className="title">
          Welcome to <a>Cadence Fun</a>
        </h1>

        <p className="description">
          {/* Get started by editing <code>pages/index.js</code> */}
          Learn to write cadence smart contracts by making your own crypto game.<br></br>
        </p>
        {/* <p className="sub-description">
          Study structure of a contract, types, variables and constants, statements, control structures,<br></br> 
           scoping and declarations, built-in functions, interfaces, event logging, natspec metadata.
        </p> */}

        <div className="grid">
          <a href="https://developers.flow.com/cadence/language" className="card">
            <h3>Documentation &rarr;</h3>
            <p>Find in-depth information about Cadence.</p>
          </a>

          <a href="" className="card">
            <h3>Learn &rarr;</h3>
            <p>An interactive course to build a crypto game on flow.</p>
          </a>

          <a
            href="https://github.com/DappCoderr/Cadence-By-Example/tree/main/Sample%20Applications"
            className="card"
          >
            <h3>Examples &rarr;</h3>
            <p>Discover and deploy boilerplate example on Flow Playground.</p>
          </a>

          <a
            href="https://developers.flow.com/tools/fcl-js/tutorials/flow-app-quickstart"
            className="card"
          >
            <h3>Buidl &rarr;</h3>
            <p>
              Basic NFT, DAO & DeFi Dapps on Flow in minutes.
            </p>
          </a>
        </div>
      </main>

      <footer>
        <a
          href="https://vercel.com?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
        >
          Build by {' '} @<a href='https://twitter.com/dappcoder_'> dappcoder </a> {' '} ❤️
        </a>
      </footer>

      <style jsx>{`
        .container {
          min-height: 100vh;
          padding: 0 0.5rem;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }

        main {
          padding: 5rem 0;
          flex: 1;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }

        footer {
          width: 100%;
          height: 100px;
          border-top: 1px solid #eaeaea;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        footer img {
          margin-left: 0.5rem;
        }

        footer a {
          display: flex;
          justify-content: center;
          align-items: center;
        }

        a {
          color: inherit;
          text-decoration: none;
        }

        .title a {
          color: #0070f3;
          text-decoration: none;
        }

        .title a:hover,
        .title a:focus,
        .title a:active {
          text-decoration: underline;
        }

        .title {
          margin: 0;
          line-height: 1.15;
          font-size: 4rem;
        }

        .title,
        .description {
          text-align: center;
        }

        .description {
          line-height: 1.5;
          font-size: 1.5rem;
        }

        .sub-description {
          font-size: 1rem;
        }

        code {
          background: #fafafa;
          border-radius: 5px;
          padding: 0.75rem;
          font-size: 1.1rem;
          font-family: Menlo, Monaco, Lucida Console, Liberation Mono,
            DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace;
        }

        .grid {
          display: flex;
          align-items: center;
          justify-content: center;
          flex-wrap: wrap;

          max-width: 800px;
          margin-top: 3rem;
        }

        .card {
          margin: 1rem;
          flex-basis: 45%;
          padding: 1.5rem;
          text-align: left;
          color: inherit;
          text-decoration: none;
          border: 1px solid #eaeaea;
          border-radius: 10px;
          transition: color 0.15s ease, border-color 0.15s ease;
        }

        .card:hover,
        .card:focus,
        .card:active {
          color: #0070f3;
          border-color: #0070f3;
        }

        .card h3 {
          margin: 0 0 1rem 0;
          font-size: 1.5rem;
        }

        .card p {
          margin: 0;
          font-size: 1.25rem;
          line-height: 1.5;
        }

        .logo {
          height: 1em;
        }

        @media (max-width: 600px) {
          .grid {
            width: 100%;
            flex-direction: column;
          }
        }
      `}</style>

      <style jsx global>{`
        html,
        body {
          padding: 0;
          margin: 0;
          font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto,
            Oxygen, Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue,
            sans-serif;
        }

        * {
          box-sizing: border-box;
        }
      `}</style>
    </div>
  )
}
