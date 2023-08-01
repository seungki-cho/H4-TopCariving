import { palette } from './palette';

export interface TypeofTheme {
  palette: TypeOfPalette;
}

export const theme: TypeofTheme = {
  palette,
};

export type TypeOfPalette = typeof palette;
export type KeyOfPalette = keyof typeof palette;
