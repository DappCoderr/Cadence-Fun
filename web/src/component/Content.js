import React from 'react'
import Card from './Card'
import "./Content.css"

const Content = () => {
  return (
    <div className='content'>
      <div className='content-title'>
        <h1>Learn Cadence by Building a Game!!</h1>
      </div>
      <div className='content-card'>
        <Card course="Lesson 1" subText={"Basic about cadence smart contract language"}/>
        <Card course="Lesson 2" subText={"(Coming Soon)"}/>
        <Card course="Lesson 3" subText={"(Coming Soon)"}/>
        <Card course="Lesson 4" subText={"(Coming Soon)"}/>
      </div>
    </div>
  )
}

export default Content