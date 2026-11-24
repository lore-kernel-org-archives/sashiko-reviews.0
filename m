Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516189;
	b=VaIv22IAENhm0sP8fjf/ijKgrc3MFqL8lqFeNSWa00CJhCrHBW1q5D0mgkuazouzpyZT
	 pH5f8tFQvlvvur/oTuKPmJuu8GRFwMy8uiE8SP4/18Cx1B8vR8vfGmFPCxG1tqLPlGzmS
	 AuS0X4wVh5osz2RhOsCC4sw/VArObOE+5f2DTW5h33497jKlBOrCQ+Ya/m3/z0lQGQX1T
	 7B17MdGz/qqkKFRsKK3e9uutcWOuB5FZD3F36lrFMKMbfr6Qyjd9iwhHzSlEzy2o6/XT+
	 U1YVxjq0ukntea9d7DCWsdAcS6a38MiVg9v6elCdgIIG11r8zVAsp8rXLNpvrCVq7aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516189;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iaIvSPISVIaDkMa/Njamk42P9grxZ6gnYA4DkbKik8k=;
	b=3JwUi26d+Uikvqfbnut2pYaZfezeuZvC7vIElSgP0agf2J3fNzHx346rgSCoRdOwEoMi
	 OAzOtrxzwSZJwF4wgRb51tirX9ltppB2rnDlF55fKcIRlrbsJjOjgozZSyp1A6JZJ3ViA
	 9+j9VS/8nKHtWnVmWnSudlBzRXU6njHUTqWYBVxJLDLxFtd3E5HG8StPTy2uNQKYp9J+l
	 KFes8r8mSvNzgzCqiNN7d2962z1MDDm8cv/XGRne/2xqTQrNcv97Uvy8+PWZBQ76amaJ/
	 D3EjvzVzM9Y49Yr1Pt9kCio0uzk4AOoaUDC+Np9uoA2ZjJ0fNqh+5wIIsCgcLHuqKWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=y4bdz27H;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237F606A31E;
	Tue, 24 Nov 2026 10:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4237F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=y4bdz27H
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xVnmV-00000003kuf-0et3;
	Tue, 24 Nov 2026 11:29:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=iaIvSPISVIaDkMa/Njamk42P9grxZ6gnYA4DkbKik8k=; t=1795516187; x=1796725787; 
	b=y4bdz27HVsq7lHN9bmRqfRNFt6tcFQZtJuH4z7zXvKn6u++yWQMZtArx3ujgW06MNBsNEIKBct1
	wYYh4qbDfCqX2UaxM50JMv7sVe6ul2IdMGUs/te/m/wIpr3y7Gon2zfbsY9EuUHvSAUfJR2jqBW3S
	uX6jmsiPN9VdMzSyUMu6hDhgBTlG9UMl7ZJJ2HKXxKGbph4gdL6nXMfJj91XrdwTniTlBxmIzODlu
	cmdbweoSHWGavwbPVuEr1N6Pk5aqeNhgmoMoC+chUyWv5XvNWrmzPVCmR95vS2Pharrn6uR8TzI96
	/xXxAVNbHs0phCqCrBCvdBiiqD2yHPShUxRA==;
Date: Tue, 24 Nov 2026 11:28:34 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@kernel.org
Subject: Re: [PATCH RFC 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
 requirements permit
Message-ID: <20261124112834.775a1042@kemnade.info>
In-Reply-To: <sashiko-outbox-230024@kernel.org>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
	<20261123-imx6-idlestop-v1-1-e32f1f44e46f@kemnade.info>
	<sashiko-outbox-230024@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 20:49:04 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] ARM: imx: i.MX6SLL-only STOP ON idle state registered on all
>   i.MX6SX/UL SoCs
> - [Medium] ARM: imx: imx6sll_check_pll_are_used() omits DCP DMA clock in
>   CCGR0 check
> - [Low] ARM: imx: duplicate BIT(21) term in CCGR5 mask in
>   imx6sll_check_pll_are_used()
> - [Low] ARM: imx: imx6sx_enter_pll_off() duplicates state 2 power-off
>   sequence
> --
[...]
> 
> [Severity: Low]
> This isn't a bug, but imx6sx_enter_pll_off() duplicates the state 2
> power-off sequence from imx6sx_enter_wait(), differing only in passing
> STOP_POWER_ON instead of WAIT_UNCLOCKED to imx6_set_lpm().  Calling
> imx6_set_int_mem_clk_lpm(true) on every entry is also redundant, since
> imx6sx_cpuidle_init() sets it at init and imx6q_pm_enter() restores it on
> resume from suspend.
> 
probably these things should be merged.

> > @@ -95,8 +125,18 @@ static struct cpuidle_driver imx6sx_cpuidle_driver = {
> >  			.name = "LOW-POWER-IDLE",
> >  			.desc = "ARM power off",
> >  		},
> > +		/* STOP ON */
> > +		{
> > +			.exit_latency = 500,
> > +			.target_residency = 800,
> > +			.flags = CPUIDLE_FLAG_TIMER_STOP |
> > +				 CPUIDLE_FLAG_RCU_IDLE,
> > +			.enter = imx6sx_enter_pll_off,
> > +			.name = "STOP ON",
> > +			.desc = "ARM power off + PLL off",
> > +		},
> >  	},
> > -	.state_count = 3,
> > +	.state_count = 4,
> >  	.safe_state_index = 0,
> >  };  
> 
> [Severity: Medium]
> Should state 3 only be exposed on i.MX6SLL, and should falling back to
> state 2 respect dev->states_usage[2].disable?
> 
> imx6sx_cpuidle_init() registers imx6sx_cpuidle_driver on i.MX6SX, i.MX6UL,
> i.MX6ULL and i.MX6ULZ as well as i.MX6SLL.  Unconditionally setting
> state_count = 4 advertises an enabled state 3 on those other SoCs that
> always demotes to state 2, causing cpuidle_enter_state() to record false
> state 2 "below" misses whenever actual idle time reaches 800 us and
> skewing governor residency bins.  In addition, calling
> imx6sx_enter_wait(dev, drv, 2) directly bypasses sysfs if state 2 has been
> disabled by userspace.
> 
The idle state is probably good for the other SoCs as well, but
they need individual checks, so until that is there, probably decrement
state_count if on non 6sll machines and of course usage.disable should be
respected.


> > diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> > index 3c73e2cdb8ceb..65a5268d31614 100644
> > --- a/arch/arm/mach-imx/pm-imx6.c
> > +++ b/arch/arm/mach-imx/pm-imx6.c  
> [ ... ]
> > @@ -287,6 +295,21 @@ void imx6_enable_rbc(bool enable)
> >  	imx_gpc_restore_all();
> >  }
> >  
> > +bool imx6sll_check_pll_are_used(void)
> > +{
> > +	/* check for any clock active which provides more than register access */
> > +	return readl_relaxed(ccm_base + CCGR0) & BIT(29)  ||  
> 
> [Severity: Medium]
> Does the CCGR0 mask also need BIT(11) for IMX6SLL_CLK_DCP?
> 
> In drivers/clk/imx/clk-imx6sll.c, IMX6SLL_CLK_DCP ("dcp", parented to
> "ahb") is gated by CCGR0 bits 11:10.  When mxs_dcp_start_dma() starts a
> crypto DMA transfer and sleeps in wait_for_completion_timeout(), the
> single CPU on i.MX6SLL can enter cpuidle; without BIT(11) in the CCGR0
> check, entering STOP_POWER_ON stops AHB and PLL clocks mid-transfer and
> stalls DCP DMA until it times out.
> 
Seems that it is a good idea to also add CLK_DCP and teach the driver to
disable clocks when not used.

> > +		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(13) |
> > +						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
> > +		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9) |
> > +						   BIT(7) | BIT(3)) ||
> > +		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||
> > +		readl_relaxed(ccm_base + CCGR4) & (BIT(23) | BIT(21) | BIT(19) | BIT(17)) ||
> > +		readl_relaxed(ccm_base + CCGR5) & (BIT(25) | BIT(23) | BIT(21) | BIT(21) |
> > +						   BIT(19) | BIT(15) | BIT(7)) ||  
> 
> [Severity: Low]
> BIT(21) is listed twice in the CCGR5 mask; is one of them redundant or
> meant to be another bit?
> 
That bit seems to be redundant, will clean up that.

Regards,
Andreas
