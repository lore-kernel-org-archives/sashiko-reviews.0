Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34845443E4C;
	Wed, 29 Jul 2026 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318873; cv=none; b=Tx0pCpLUhVD1pVBbcjA4FI3LBKZqqeow03V3PaXXV6hN1jd90/Srgjhan7jAguANCFY3R/jVl2rXejHVhLxpCCtmWL/15NFD3u9kDGR5vRvlrMec3NFUK2J4HbQSu3Tfo9fa4y2uYOtqHVK2wAFT7mFK8POE+tlctTpi/I/xDSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318873; c=relaxed/simple;
	bh=imui3R/0vYCF6N922AQBFiU71XBR6Z/ucfaxKG1HgWI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHh2oolQR3XzZ2hUad8uLzgeOfxPbPYqAlftQH0m56Di4pV1oNNXpgzDGCAx76RsvcunpYE9Lfkzlo+ePjk9Vz3EuTtwp3zs9BoKCiyRgZVu/Lz27G+W65eoLRBkSIIBcyFvYRChrmGZGg/9xvzuL3uB/K0rCg4LenyR0Y79jA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8PmnrTG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8PmnrTG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6094A1F00A3A;
	Wed, 29 Jul 2026 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785318871;
	bh=LVcDA3xezlmTl1NajKjqRETDsHsLNfimeEju9cIQEX0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=F8PmnrTG9vWE4KhJExVOol4GWqwd64EU0COppIy71qbYl7g1r7SiwmvxCs0OMAAPT
	 XvFiCJaB7m3vqW7xWDOyC3mGNemvbhFLA7T/i6cWeM9OFMVaDDu9VOYdvAKe3GyDEP
	 X7QtKnQLBFlOW0BarvJv96ZtJ2D7LD58Nt95nLJCmXBJav6Sv4+CnU6/9GmBXNeIyB
	 dzUp6n/oLycEU6As/yErwkBlN/YVgcamBKxIIZKpXEDpk5lXf5r2YFwY0oiZmRMxME
	 3634fzXXAp2gSVaM6OZmw0KCxqg6MzLIlCdelHEg3T1DMw0Cx8Eyj5P5UVZ8v19MmR
	 6QG7ctLhUm3gg==
Date: Wed, 29 Jul 2026 09:54:29 +0000
From: Yixun Lan <dlan@kernel.org>
To: sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <20260729095429-GKH76518@kernel.org>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-2-aurelien@aurel32.net>
 <20260728211959.4174F1F000E9@smtp.kernel.org>
 <amnJsOiWSfuBR1ps@aurel32.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amnJsOiWSfuBR1ps@aurel32.net>

Hi Aurelien,

On 11:36 Wed 29 Jul     , Aurelien Jarno wrote:
> Hi,
> 
> On 2026-07-28 21:19, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [High] This problem wasn't introduced by this patch, but wiring it up to cpufreq makes it a serious hardware safety risk: the CPU supply regulator (`buck1_0v9`) has an overly permissive maximum voltage constraint of 3.45V, which could physically damage the CPU.
> > --
> > 
> > --- Patch [1]: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter ---
> > commit 4e25fb96470d1ad37415e03a27de699ef1f0da26
> > Author: Aurelien Jarno <aurelien@aurel32.net>
> > 
> > riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
> > 
> > This commit enables CPU DVFS on the Milk-V Jupiter board by including the OPP
> > tables and wiring the CPU nodes to the CPU regulator supply.
> > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > > index b61f5995ec771..3c16d0c20050e 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > [ ... ]
> > > @@ -107,6 +108,38 @@ &combo_phy {
> > >  	status = "okay";
> > >  };
> > >  
> > > +&cpu_0 {
> > > +	cpu-supply = <&buck1_0v9>;
> > > +};
> > [ ... ]
> > > @@ -209,7 +242,7 @@ pmic@41 {
> > >  		dldoin2-supply = <&buck5>;
> > >  
> > >  		regulators {
> > > -			buck1 {
> > > +			buck1_0v9: buck1 {
> > >  				regulator-min-microvolt = <500000>;
> > >  				regulator-max-microvolt = <3450000>;
> > 
> > [Severity: High]
> > This is a pre-existing issue, but by wiring up the CPU supply for cpufreq in 
> > this patch, does it introduce a severe hardware safety risk?
> > 
> > The buck1_0v9 regulator retains a very permissive maximum voltage constraint 
> > of 3.45V. Because the safe physical limit for the CPU is 1.05V (as defined in 
> > k1-opp.dtsi), could this permanently damage the hardware if a kernel bug, opp 
> > misconfiguration, or privileged userspace requests a higher voltage up to the 
> > board-defined maximum?
> > 
> > Should the board-level constraint be clamped to the safe physical limits of 
> > the CPU (e.g., 1050000 microvolts) to prevent the regulator from supplying a 
> > destructive voltage?
> 
> This looks like a valid point. Yixun, I believe the commit a5d7000e1a17 
> ("riscv: dts: spacemit: Add cpu scaling for K1 SoC") should be drop from 
> your tree until this is fixed, or at least it should not be pushed to 
> v7.3 if the regulator issue is not fixed.
> 
Instead of dropping this patch, I'd like to get it fixed in tree, I don't want
to hold on this patch, it's generally tested

> I'll try to submit a patchset fixing that.
> 
Yes, please, I think we still have time to get it in for v7.3

-- 
Yixun Lan (dlan)
