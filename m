Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867146;
	b=HAvDhoJcKj4HzTHpL+Yp7riHY8dvFx3jewoNxvZ53UanzFg+C4p72up9NB3ndUrkvquR
	 XDplitoCqCIL+jmcyeAL2kxaepk7fUocdWq35mxaN3EhsmEU6K7cz7uFd8FZeH2xO8bfX
	 yRR1FMjfOOuj/BZ057HVBQfESP1e6aKi7xgdf4fVT5kiEPo6B71CzoKmfFV/cZI1z+iD2
	 T7HLlyA1mmYxx9vQAxETTqwncS2IunLkvUmKISZX/bIAZtF98uvGyAm68NhRx4C8swSw2
	 rvmmWMirsaqoHPsE2iW0Hk/hK3Xy8pFMNcpLmU14MI/cxBW0xdM39QR/y27KBOERJzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867146;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=BItCYPzne9+xLlIe/J0cBx779WEpjOS9di2Lz7lNhcc=;
	b=GJFAYEeK7opm8Zng7k4CuRMeQ9v0yjCSyCW6qKWKeEjTEGFR9OpSXatzV0awQMMY/4UD
	 EjXzKalJD6qL09fHFhdj2nIiwvpz0rZ8OuwlA9qMSMk9IFQhnv9E2ETG6mNuiKC1zufQp
	 AkteLzY/ZW0wNm0v5IUSV5A9QdS9/y/UIWUQlqlkauA2zREvI2hghg8CG3BKbYGRj3GUt
	 mqkeykNqf/WYyFkvgLVQbEzXWGEI04A0pYbHnyIk3xmdlNqSvuP0pZv9eeZ3VERQ+h9Hn
	 D9NJNF9yZdslgIh/AwYZ9ZZzOM/27DvimwSRlklGsn/kkV+gwDMjlnTW34aYEWjy26Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="gmVVusd/";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829D606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 08:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7829D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gmVVusd/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793867145; x=1825403145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6EBRjcp5G1Ckr8WeOTCb83fZ6iA4VB24J7u8Itoq+54=;
  b=gmVVusd/Wkhq4MWUCN9i5lT7WZqndl1DIwvidcPK/CVWkk71qXPRwmxn
   HzHQUOwhGE7efFH6NUUJmFrNYNsEcK1dtJFPJRKcuoAFXpAuIuJbL8c6h
   gAmpZoOQSwS/ScRGu9rgoY77vvvQ8iyH9GmuZSlr6Ol1CARzrDKQi3db0
   Yu8eq96mF/Y8l+WMM/iOgr9HGRRZlUt2X5FFRuPUid0lwFb9LcJn/8C2Q
   J50WqZWmOQj0skHar7e9Z4rbaKJUm7KyJ24uLQk84XvwwrJ3fDhZkHTgg
   Eh0lO37Cw6LVXmQrlBPm2WyDO9lmNYF9b6IRC1n5wFJqDL/2ubxI1mMx2
   A==;
X-CSE-ConnectionGUID: kJ78b1QxQDaJPnjvHyQlEg==
X-CSE-MsgGUID: V1vf8w9lRRueQCdDeBRUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2738797"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2738797"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:25:45 -0800
X-CSE-ConnectionGUID: jhk4GLNOTuCKjxyiEG54tA==
X-CSE-MsgGUID: Mx28KSO3Q9eYAKiNMwYDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6824973"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:25:43 -0800
Date: Thu, 5 Nov 2026 09:25:38 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from
 typo
Message-ID: <7ejc6pruwt3r55cuwi4ncqyzbzbr7b3piz3xt5zxbdsaft3ohk@asw7lnftulqx>
References: <20261104231812.1704129-1-michal.grzelak@linux.intel.com>
 <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
 <sashiko-outbox-198292@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-198292@kernel.org>

On Wed, Nov 04, 2026 at 11:22:37PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] drm/i915/psr: macro rename introduces new typo _CONTINOUOS_
> --
> 
> commit 6ee099cfe2ac28d1b7981063a5dd7a20aa5f8373
> Author: Michał Grzelak <michal.grzelak@linux.intel.com>
> 
> drm/i915/psr: clean register macro's name from typo
> 
> This commit renames ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME and
> PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME to fix a spelling typo in the
> register macro names.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> > index f7fae75751f54..2fd77313971be 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -1074,7 +1074,7 @@ static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
> >  
> >  	intel_de_rmw(display,
> >  		     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
> > -		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
> > +		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME);
> >  
> >  	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), dp2_ctl_clear, dp2_ctl_set);
> >  }
> > @@ -2618,8 +2618,8 @@ static u32 man_trk_ctl_partial_frame_bit_get(struct intel_display *display)
> >  static u32 man_trk_ctl_continuous_full_frame(struct intel_display *display)
> >  {
> >  	return display->platform.alderlake_p || DISPLAY_VER(display) >= 14 ?
> > -	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME :
> > -	       PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME;
> > +	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME :
> > +	       PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME;
> >  }
> >  
> >  static void intel_psr_force_update(struct intel_dp *intel_dp)
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > index a57bc111290d1..56df4d2f97286 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > @@ -241,7 +241,7 @@
> >  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK		REG_GENMASK(20, 11)
> >  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
> >  #define  PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME			REG_BIT(3)
> > -#define  PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(2)
> > +#define  PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME		REG_BIT(2)
> >  #define  PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(1)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK	REG_GENMASK(28, 16)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(val)	REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK, val)
> > @@ -249,7 +249,7 @@
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(31)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME		REG_BIT(14)
> > -#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(13)
> > +#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME		REG_BIT(13)
> 
> [Severity: Low]
> This isn't a bug, but should _CONTINOUOS_ be _CONTINUOUS_ in
> PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME and
> ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME (as well as their callers
> dg2_activate_panel_replay() and man_trk_ctl_continuous_full_frame()),
> matching LNL_CFF_CTL_SF_CONTINUOUS_FULL_FRAME?
> 

Yes.

BR,
Michał

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261104231812.1704129-1-michal.grzelak@linux.intel.com?part=2
