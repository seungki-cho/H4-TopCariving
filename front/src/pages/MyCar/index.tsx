import { Flex } from '../../components/common/Flex';
import Footer from '../../components/myCar/Footer';
import NavBar from '../../components/myCar/NavBar';
import Header from '../../components/myCar/header';
import Trim from './Trim';

const MyCar = () => {
  return (
    <Flex direction="column">
      <Header />
      <NavBar />
      <Trim />
      <Footer />
    </Flex>
  );
};

export default MyCar;
