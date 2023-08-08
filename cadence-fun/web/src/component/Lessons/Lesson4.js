import React from 'react'
import "./Lesson.css"
import Next from '../Next'
import Playground from '../Playground'

const Lesson4 = ({chapter,subTitle, test}) => {
  return (
    <div className='lesson'>
      <div className='lesson-container'>
        {/* <div className='lesson-title'>
          <h1>Chapter 1: Lesson Overview</h1>
         </div> */}
          <div className='lesson-details'>
            <h1>{chapter}</h1>
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

export default Lesson4