import { useEffect, useState } from "react";

export default function App() {
  const [text, setText] = useState("Loading...");

  useEffect(() => {
    fetch("/api/hello")
      .then(res => res.json())
      .then(data => setText(data.text));
  }, []);

  return (
    <div style={{ padding: 40 }}>
      <h1>{text}</h1>
    </div>
  );
}
