import { getDefaultConfig } from '@rainbow-me/rainbowkit';
import {
  avalancheFuji
} from 'wagmi/chains';

export const config = getDefaultConfig({
  appName: 'RainbowKit App',
  projectId: 'f2f7b83f2210426c39dfb704dade5802',
  chains: [
    avalancheFuji,
    ...(process.env.NEXT_PUBLIC_ENABLE_TESTNETS === 'true' ? [avalancheFuji] : []),
  ],
  ssr: true,
});