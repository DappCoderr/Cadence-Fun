import React from 'react'
import "./Lesson.css"
import Next from '../Next'
import Playground from '../Playground'
import ReactMarkdown from 'react-markdown'
// import { useParams } from 'react-router-dom'

const Lesson1 = ({chapter,subTitle, test}) => {
  // const lessonId = useParams();
  return (
    <div className='lesson'>
      <div className='lesson-container'>
        {/* <div className='lesson-title'>
          <h1>Chapter 1: Lesson Overview</h1>
         </div> */}
          <div className='lesson-details'>
            <h1>{chapter}</h1>
            <p>Welcome to Lesson 1! In this lesson, we're going to create something really cool – a "Knight" that will help us build a whole bunch of other knights to form an army.</p>
            <p>Our Knight is going to have a special power: it can make new knights. 
            <p>And guess what?</p> Each new knight will look totally different and special because they will each have their own unique appearance. As we keep learning, we'll also make our knights do more things, like fighting other knights and getting stronger.</p>
            <p>But hold on a moment! Before we start doing all those fancy things, we need to learn how to make new knights from scratch. That's our basic starting point.</p>
            <h3>{subTitle}</h3>
            <p>
              To help us on our adventure, we'll be using something called the Flow Playground. It's like a playground on the internet where we can write and test contracts. These contracts are like magical rules that our knights will follow. The best part is that we can play with these rules and see how they work. We can also share our ideas with friends and try out different things together. It's going to be a lot of fun!
            </p>
            <div className='playground-image'>
              <img src='https://developers.flow.com/assets/images/playground-intro-514e99da776669e9dbe1f4375dad280a.png'/>
            </div>
            {/* <p>This playground is divided into 3 parts</p>
            <ul>
              <li>Contracts</li>
              <li>Transaction & Script</li>
              <li>Accounts</li>
            </ul>
            <h3>Contract</h3>
            <p>contract is a place where is write your contract</p>
            <h3>Transaction and Script</h3>
            <p>Where you write transaction and script</p>
            <h3>Account</h3>
            <p>by which you sign the transaction</p> */}
          </div>
          <div className='lesson-test'>
            <h2>{test}</h2>
            <p>Open playgound in new tab and checkout it out and get familiar with it.
            </p>
            <p>When you're ready to continue, hit "Next Chapter" below, and let's dive into learning Cadence!</p>
            <Playground/>
            <div className='next-tab'>
              <Next/>
            </div>
          </div>
      </div>
    </div>
  )
}

export default Lesson1