import React, { useState } from 'react'
import "./Next.css"

const Next = () => {
    const [count, setCount] = useState(1)
  return (
    <div className='next'>
        <button href='#'>previous</button>
        <div className='count-number'>{count}/10</div>
        <button href='#'>next</button>
    </div>
  )
}

export default Next