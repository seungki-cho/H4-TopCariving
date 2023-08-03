import styled from '@emotion/styled';
import { Flex } from '../common/Flex';
import { Text } from '../common/Text';
import { theme } from '../../styles/theme';

export interface TrimCardInterface {
  id: number;
  name: string;
  price: number;
}

const TrimCard = ({
  trim,
  isSelected,
}: {
  trim: TrimCardInterface;
  isSelected: boolean;
}) => {
  const { id, name, price } = trim;

  return (
    <CustomFlex
      direction="column"
      width={242}
      height={251}
      borderRadius="8px"
      padding="20px"
      gap={16}
      backgroundColor="LightSand"
      isSelected={isSelected === true}
    >
      <Text typo="Heading3_Bold" palette={isSelected ? 'Primary' : 'Black'}>
        {name}
      </Text>
      <Line isSelected />
      <Flex justify="space-between">
        {trimOption[id].map((item, key) => (
          <Flex
            direction="column"
            justify="start"
            align="center"
            key={`trimCard_${key}`}
          >
            <Flex width={0} height={0}></Flex>
            {item.name.map((name: string, key: number) => (
              <Text
                typo="Caption_Medium"
                palette={isSelected ? 'Primary' : 'DarkGray'}
                key={`imgOption_${key}`}
              >
                {name}
              </Text>
            ))}
          </Flex>
        ))}
      </Flex>
      <Line isSelected />
      <Text typo="Heading3_Bold" palette={isSelected ? 'Primary' : 'Black'}>
        {`${price.toLocaleString('ko-KR')}원`}
      </Text>
    </CustomFlex>
  );
};

export default TrimCard;
type TrimOption = {
  [key: string]: {
    svg: string;
    name: string[];
  }[];
};

const trimOption = {
  1: [
    { svg: '', name: ['20인치', '알로이 휠'] },
    { svg: '', name: ['서라운드 뷰', '모니터'] },
    { svg: '', name: ['클러스터 ( 12.3', '인치 컬러 LCD )'] },
  ],
  2: [
    { svg: '', name: ['12인치', '내비게이션'] },
    { svg: '', name: ['네비게이션 기반', '스마트 크루즈 컨트롤'] },
    { svg: '', name: ['베젤리스', '인사이드 미러'] },
  ],
  3: [
    { svg: '', name: ['2열 수동식', '도어 커튼'] },
    { svg: '', name: ['스마트', '자세제어'] },
    { svg: '', name: ['전후식 통합', '터치 공조 컨트롤'] },
  ],
  4: [
    { svg: '', name: ['KRELL', '프리미어 사운드'] },
    { svg: '', name: ['원격 스마트', '주차보조'] },
    { svg: '', name: ['캘리그래피', '전용 디자인'] },
  ],
} as TrimOption;

const CustomFlex = styled(Flex)<{ isSelected: boolean }>`
  background-color: ${({ isSelected }) =>
    isSelected ? 'rgba(0, 44, 95, 0.10)' : theme.palette.LightSand};
  border: ${({ isSelected }) =>
    isSelected ? `2px solid ${theme.palette.Primary}` : ''};
  box-sizing: border-box;
`;

const Line = styled.div<{ isSelected: boolean }>`
  width: 100%;
  height: 3px;
  background-color: ${(isSelected) =>
    isSelected ? theme.palette.Primary : theme.palette.LightGray};
`;
