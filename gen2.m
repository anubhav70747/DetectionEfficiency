function b=genQCHSH2NM(Joint_P,Marg_PA,Marg_PB,eta)etaB=eta;etaA=eta;Q =  ones(16, 25);for as1 = 0:1  for as2 = 0:1		as = 2 * as1 + as2;		for bs1 = 0:1			for bs2 = 0:1				bs = 2 * bs1 + bs2;				Q(4 * as + bs + 1, 25) = (1 - etaA)*(1-etaB);				for ao1 = 0:1					for ao2 = 0:1						ao = 2 * ao1 + ao2;            Q(4 * as + bs + 1 , 5 * ao + 5) = etaA*(1-etaB) * Marg_PA{ao1+1,as1+1}*Marg_PA{ao2+1,as2+1};          end        end        for bo1 = 0:1					for bo2 = 0:1						bo = 2 * bo1 + bo2;			      Q(4 * as + bs + 1 , 5 * 4 + bo + 1) = etaB*(1-etaA) * Marg_PB{bo1+1,bs1+1}*Marg_PB{bo2+1,bs2+1};;          end        end      end    end  endendfor as1 = 0:1  for as2 = 0:1		as = 2 * as1 + as2;		for bs1 = 0:1			for bs2 = 0:1				bs = 2 * bs1 + bs2;				Q(4 * as + bs + 1, 25) = (1 - etaA)*(1-etaB);				for ao1 = 0:1					for ao2 = 0:1						ao = 2 * ao1 + ao2;						for bo1 = 0:1							for bo2 = 0:1								bo = 2 * bo1 + bo2;								% Q(4 * (x - 1) + y, 5 * (stratA(x) - 1) + stratB(y))								Q(4 * as + bs + 1 , 5 * ao + bo + 1) =  etaA*etaB*Joint_P{ao1+1,bo1+1,as1+1,bs1+1}*Joint_P{ao2+1,bo2+1,as2+1,bs2+1};						  end						end					end				end			end		end	endendb = vec(Q)						b = reshape(Q, 1, []);endfunction