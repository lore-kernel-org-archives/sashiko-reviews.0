Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5C2DF126;
	Wed, 29 Jul 2026 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317818; cv=none; b=sscPwsBeIYllvEr2eyiFtPbyoVYGVwdE68xOLKSi12iD/1irfSwSYZtmnE87fbQf5glVLN/omL/NfmiOojG6G0yLuNu1fFK5qs2UIWEXT0KWsJ4gLSOeA6uMRpNZF8GGmY5DxVPR+evp/EYg+rlmzulCKYxIOzZ8Xl49cNQd+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317818; c=relaxed/simple;
	bh=z57oH0Cq5ytPel7s/Wplhq9hNm3CFrE/JDFEjRyzREE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u569flTf5CQU2OmQjGik5+4RfbSmJkdHLcZiZIRXqxkg1PaVg/f5EscgZEBJ2mH2lxdq2R3GGpY2sml5E0llX1Lpyjc4niR7qQ+b9orheUF8h5a4q4isyF32+0k8g0UV6I5bHJX3ChKSuWh3KPOSyHidpYDFfrnccBil9OmgcgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=c+DCOdb7; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="c+DCOdb7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FLs1G4iS1Ks3TbB/7uB4YNhqsER4mXB13kHE1/rgnOA=; b=c+DCOdb7OvX9sEyBxqr6mI/v6N
	mHPGLZnQRpKw0k1ZT8iSycAzjkamuT4y0OsVnHEsU2Gvlo6ldPQzwpvwiY8uXcQIXz2jTytFvHoZd
	8oSpairzAzcbU4yr5f0VWlQ0eZn+PYjoq5PAxoNewKGNmAoI/WJRPljdds73/eYwzb6t+6Qoje46P
	r7oIZmv64yJqsI/XDHIHUBKCmHsWBLqvC1hU2s8aEu9+VhbSmuop4p0TDPFU9qPaQrvRZS1fU2ynb
	7dJle0KB8aheRvETEhKe3tbIj4WR8a+zuD1CG2NxpKUeXwNZpmd25HV5RccIyaDJprJp+Qntr9uUF
	cUfma6qw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp0ib-00000002Jkq-1lu9;
	Wed, 29 Jul 2026 11:36:53 +0200
Date: Wed, 29 Jul 2026 11:36:48 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Shuwei Wu <shuwei.wu@mailbox.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <amnJsOiWSfuBR1ps@aurel32.net>
Mail-Followup-To: sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Shuwei Wu <shuwei.wu@mailbox.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260728211020.1248676-2-aurelien@aurel32.net>
 <20260728211959.4174F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728211959.4174F1F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2026-07-28 21:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but wiring it up to cpufreq makes it a serious hardware safety risk: the CPU supply regulator (`buck1_0v9`) has an overly permissive maximum voltage constraint of 3.45V, which could physically damage the CPU.
> --
> 
> --- Patch [1]: [PATCH 1/3] riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter ---
> commit 4e25fb96470d1ad37415e03a27de699ef1f0da26
> Author: Aurelien Jarno <aurelien@aurel32.net>
> 
> riscv: dts: spacemit: Add cpu scaling for Milk-V Jupiter
> 
> This commit enables CPU DVFS on the Milk-V Jupiter board by including the OPP
> tables and wiring the CPU nodes to the CPU regulator supply.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > index b61f5995ec771..3c16d0c20050e 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> [ ... ]
> > @@ -107,6 +108,38 @@ &combo_phy {
> >  	status = "okay";
> >  };
> >  
> > +&cpu_0 {
> > +	cpu-supply = <&buck1_0v9>;
> > +};
> [ ... ]
> > @@ -209,7 +242,7 @@ pmic@41 {
> >  		dldoin2-supply = <&buck5>;
> >  
> >  		regulators {
> > -			buck1 {
> > +			buck1_0v9: buck1 {
> >  				regulator-min-microvolt = <500000>;
> >  				regulator-max-microvolt = <3450000>;
> 
> [Severity: High]
> This is a pre-existing issue, but by wiring up the CPU supply for cpufreq in 
> this patch, does it introduce a severe hardware safety risk?
> 
> The buck1_0v9 regulator retains a very permissive maximum voltage constraint 
> of 3.45V. Because the safe physical limit for the CPU is 1.05V (as defined in 
> k1-opp.dtsi), could this permanently damage the hardware if a kernel bug, opp 
> misconfiguration, or privileged userspace requests a higher voltage up to the 
> board-defined maximum?
> 
> Should the board-level constraint be clamped to the safe physical limits of 
> the CPU (e.g., 1050000 microvolts) to prevent the regulator from supplying a 
> destructive voltage?

This looks like a valid point. Yixun, I believe the commit a5d7000e1a17 
("riscv: dts: spacemit: Add cpu scaling for K1 SoC") should be drop from 
your tree until this is fixed, or at least it should not be pushed to 
v7.3 if the regulator issue is not fixed.

I'll try to submit a patchset fixing that.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
