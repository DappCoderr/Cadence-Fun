import React, { useState, useEffect } from 'react'
import "./Lesson.css"
import Next from '../Next'
import Playground from '../Playground'
import ReactMarkdown from 'react-markdown'
// import { useParams } from 'react-router-dom'

const Lesson1 = ({chapter,subTitle, test}) => {
  const[postContent, setPostContent] = useState("");

  useEffect(() => {
    import("../../course/knight/Lesson-1/chapter1.md")
      .then(res => {
        fetch(res.default)
        .then(response => response.text())
        .then(response => setPostContent(response))
        .catch(err => console.log(err))
      })
  }, [])
  
  // const lessonId = useParams();
  return (
    <div className='lesson'>
      <div className='lesson-container'>
          <div className='lesson-details'>
            <ReactMarkdown>
              {postContent}
            </ReactMarkdown>
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