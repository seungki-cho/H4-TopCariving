import styled from '@emotion/styled';
import { Flex } from '../common/Flex';
import { Text } from '../common/Text';
import { theme } from '../../styles/theme';
import { css } from '@emotion/react';

export interface TrimCardInterface {
  name: string;
  svg: { path: string; name: string }[];
  price: number;
}

const TrimCard = ({
  trim,
  isSelected,
}: {
  trim: TrimCardInterface;
  isSelected: boolean;
}) => {
  const { name, svg, price } = trim;

  return (
    <CardFlex isSelected>
      <Text typo="Heading3_Bold" palette={isSelected ? 'Primary' : 'Black'}>
        {name}
      </Text>
      <Line isSelected />
      <Flex justify="space-between">
        {svg.map((img) => (
          <Flex direction="column" justify="start" align="center">
            <Flex width={50} height={50} css={tempBorder}></Flex>
            <Text
              typo="Caption_Medium"
              palette={isSelected ? 'Primary' : 'DarkGray'}
              css={textCenter}
            >
              {img.name}
            </Text>
          </Flex>
        ))}
      </Flex>
      <Line isSelected />
      <Text typo="Heading3_Bold" palette={isSelected ? 'Primary' : 'Black'}>
        {`${price.toLocaleString('ko-KR')}원`}
      </Text>
    </CardFlex>
  );
};

export default TrimCard;

const CardFlex = styled(Flex)<{ isSelected: boolean }>`
  flex-direction: column;
  width: 242px;
  height: 251px;
  background-color: ${(isSelected) =>
    isSelected ? 'rgba(0, 44, 95, 0.10)' : theme.palette.LightSand};
  border: ${(isSelected) =>
    isSelected
      ? `2px solid ${theme.palette.Primary}
        `
      : 'none'};
  border-radius: 8px;
  padding: 20px;
  gap: 16px;
`;

const Line = styled.div<{ isSelected: boolean }>`
  width: 100%;
  height: 2px;
  background-color: ${(isSelected) =>
    isSelected ? theme.palette.Primary : theme.palette.LightGray};
`;

const tempBorder = css`
  border: 1px solid black;
`;

const textCenter = css`
  text-align: center;
`;
