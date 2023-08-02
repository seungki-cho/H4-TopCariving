import { BrowserRouter, Route, Routes } from 'react-router-dom';
import MyCar from './pages/MyCar';
import styled from '@emotion/styled';

function App() {
  return (
    <Container>
      <BrowserRouter>
        <Routes>
          <Route path="/mycar/*" element={<MyCar />} />
        </Routes>
      </BrowserRouter>
    </Container>
  );
}

const Container = styled.div`
  width: 100vw;
  height: 100vh;
`;

export default App;
