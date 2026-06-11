Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F7352C58
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157138; cv=none; b=r6j8gaEraztpwluyV4INF4S5TKElAvegrrEsQOEeXekoYwud/B5MtaORhcWDoPofG+sabnVePU/npjI7vmBNEcfCxWlyL1DufQcu64R9NuW7dpW39W5MRtvkBQ9f0gCm81pmv2/JJvgdf4RiqcrVqp4EBrcMr/BYLqxi1zpGUKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157138; c=relaxed/simple;
	bh=xPx7RgR67G3N4/jEoI1W3Zf2pLG40IugenK3jJd85L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0Vt02k44umKtj13Jz7WGRWHr2LYDm4EhGcE1i1QYxn1Fm9cUsAA6Mv/p+M4I9wkVuo+R7YCkIgJfnlCXO7Uh9hKU9ogTvD2FnKO7IxcRM5zzqtMUFbqA3lWEcFC08b21laOfbwkzPLh2cYzInqm/MG5IWnDFH7fGZpx+q6s4VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lAsbN2lW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DBz0LuqF; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lAsbN2lW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DBz0LuqF"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 9578E1D0013F;
	Thu, 11 Jun 2026 01:52:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 11 Jun 2026 01:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781157134;
	 x=1781243534; bh=1ZeUt6nlhejJriS9GvQS3C2Gq5MFPsTxMtlG7fd3reo=; b=
	lAsbN2lWahqo19Z6Cln0JYeGti/09a36CXD6FA8gC4R8rmbIHH26RRjMxREnmH3b
	KGKtM4oq5airJ0MLBZA04xRbd2snQ+a6FfoH1S670w1YNToh0sf1i2/FSWU1Ca+J
	EW+lvLAXLc4mdbZdLJjEDpGYrCi6oyD6CYEgyxIs1bQUwiu6N2sWHnBHOVLDyAQu
	u9Pdq2GbPgNMcIhOjy61F+zhZ3w3IMDbc2g2dQyQBwQwAQM8ZmCUevWOCcs/uNa2
	p8CrG9Dwf4wF98clg6nWnQ5Ze6kjNTAy8dYkQATXYz/LW4BQqOvmi9SnLDPHNB80
	qRYXDcanY4l5GcGg5SXRew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781157134; x=
	1781243534; bh=1ZeUt6nlhejJriS9GvQS3C2Gq5MFPsTxMtlG7fd3reo=; b=D
	Bz0LuqFgUZ/CIdfmH6TVMR+vQ/7cIwGaRorX1lsBVFh7mhm1jvfUTPkZu7tW0SwT
	GwjPUsqIOBskBc5BAP34rmNOdIoBBzxtuVLagPbmN7+ooWm3tp/xykb9ncnaEZD8
	mpGco/WVOZ3FCEhHQyP0oqPox1u3hPbKojveQvKfIjOtiDjOyOGGsgtTCSH9+rmp
	eYS0sBopuD/n6GM4jOQg0s6zbJqlcTej7vOJ8O5WT4fXYa6VgpGZqpWp28qw4Zlv
	NO7sow4dN2Pyn92eKu8yzYttXhSzJRwREKVUA+xYPwk3I/8U1BxWXpDvD8WxqJB7
	1qiMqeNrxoLhkMl9Iscew==
X-ME-Sender: <xms:DU0qaitkhIzWB71tPzyO4-LKQtLsKyVWVYsKIPbV22VpxDbc41j38A>
    <xme:DU0qao9you2VT96pmdH0gdTPYNqPBLDItVXoor7AvzEtO8Rs0at-tkCGjWSnsm9Dh
    zSkU91AnVgfCA4Zp4WQjOfRpAOr8cgJwWktOqSJfKXElJQj2iSAPc8>
X-ME-Received: <xmr:DU0qat39APTXXJHZyqjjolrU4twbjH8X4y7pjR8BBrint5SmtPz2LO2lSI6PnI2jSYR0pK2cjChNc5cb5z8IFd8EJpTo>
X-ME-Proxy-Cause: dmFkZTF5ejwB0PiDCFBkkA0hhMb8yAuL344uA5eIAtpn5j1WKv5dOpjeDgMU+lNorbXBV6
    8uVVvtdC/w5pA6wOr2DFWXjFctDS4fHVg4E5Y1JzYqYKfnga3328Oi94QjoGoLNyHQCZvN
    dsXQ4R6MTxdg6+jkpznUx3rcf/7wwqnDPxZDn6yO7oxBbEEo+H6miEIowXE6IRgMmOijev
    FY3Dt0+psNgeBi7QujV66Ya+8gdRYz2oiwJ+STGVheOiq4EOAZdpwdWlgBgFO61XuzU/cd
    wEMoLnjFto+BwZ5jGfGrOO7RmRV6HvzqUDta8oUANJ4ffvxC+w7TsdG5BC7t6KQqpzdkHs
    02iDCPQqXyUtlGm5hw/fJq+pODHiNYAZPfFYX00WPDeB4GY0YKWEiP9IWY2QwA6XlYHOBn
    RzIxOJG4sUWa8X9ihIjOs+482KIY7a3kQyzZpjByvXKvhcVJqwawOpAPrYKmsOkiz2j+DP
    uyU1H2QffhAux1XC80kPC+ylS3UBTYm2KD2xgzhg9i5T3hqZ5fXWZZ76roLJKofmsvRoEh
    ZjxLcsKz0c1cl6b94oSILOi7ZBhiPH7WSswf9eTLYiwc53xXE58LGD5xx+wZIDq5+7goY7
    a1rR/+59TGcJCeuZ3a62ZNJBfpke0CS5E5MFhHdknI3BQ76oCG3EcdNtbD2g
X-ME-Proxy: <xmx:DU0qatD-OHpeYKfR_PHaZRVqenlcEUB1QZkmsoOkPUDlf89ERsjt1g>
    <xmx:DU0qapemLN2z3CYKYO3zWwpKXe1SX05YVjf60X720tndu2f-XWr2WQ>
    <xmx:DU0qaq7ZU8YQxC721jNmpzPcjyK5h_5NqJqlJijbeSnapGyBkamvMQ>
    <xmx:DU0qasVdcaDKzZGrWZZtHxxwXErzGqCaeXzwjZxoOUjQ3OhyLBnRcA>
    <xmx:Dk0qauMkIhMfHv-ndXu3hKJans39FcNt3r1rt6IE_EWD4x50c5SiwLIj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 01:52:13 -0400 (EDT)
Date: Thu, 11 Jun 2026 07:52:11 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [net-next 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
Message-ID: <20260611055211.GA69568@ragnatech.se>
References: <20260609215711.2960150-4-niklas.soderlund+renesas@ragnatech.se>
 <20260610215741.431DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610215741.431DE1F00893@smtp.kernel.org>

Hello,

On 2026-06-10 21:57:40 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Device Tree Resource Conflict due to overlapping memory, clock, and reset regions between `tsn0` and `gptp`.
> --
> 
> commit 225abba0fdcd1f7e4ebd535f168ba1447d871a7e
> Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> arm64: dts: renesas: r8a779g0: Add gPTP node
> 
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
> 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > index 82a7278836e57..758c4ca0ae5f2 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > @@ -603,6 +603,15 @@ tsn0: ethernet@e6460000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		gptp: gptp@e6449000 {
> > +			compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> > +			reg = <0 0xe6449000 0 0x500>;
> > +			clocks = <&cpg CPG_MOD 2723>;
> > +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +			resets = <&cpg 2723>;
> 
> [Severity: High]
> Will this introduce a regression by duplicating resources already claimed by
> the existing tsn0 node?

Yes.

That is the idea of this work. To break free the ptp memory region from 
the RTSN (on V4H) and RSWITCH (on S4) so it can be shared with RAVB.

This is discussed in the cover letter of the series.

> 
> Looking at the tsn0 node earlier in this file:
> 
> 		tsn0: ethernet@e6460000 {
> 			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
> 			reg = <0 0xe6460000 0 0x7000>,
> 			      <0 0xe6449000 0 0x500>;
> 			reg-names = "tsnes", "gptp";
> 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
> 				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
> 			interrupt-names = "tx", "rx";
> 			clocks = <&cpg CPG_MOD 2723>;
> 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> 			resets = <&cpg 2723>;
> 			status = "disabled";
> 		};
> 
> It appears tsn0 already claims the 0xe6449000 memory region, CPG_MOD 2723 clock,
> and reset 2723.
> 
> If both drivers are enabled, will the second driver to probe fail when
> requesting these overlapping resources, such as receiving -EBUSY from
> devm_ioremap_resource() or request_mem_region()?
> 
> Should the overlapping resources be removed from the tsn0 node now that the
> gPTP module is represented as a standalone shared node?
> 
> > +			status = "disabled";
> > +		};
> > +
> >  		i2c0: i2c@e6500000 {
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260609215711.2960150-4-niklas.soderlund+renesas@ragnatech.se?part=1

-- 
Kind Regards,
Niklas Söderlund
