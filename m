Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9984519AF
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051941; cv=none; b=cPrM0zKAzQQvqO7XPYOaMfHrFxmRaNnICKoFWU/m7EmfHIIZuNOm/w/aSQT5ahQId4PDXk4e+K25f34zRagVG3LTLVlX89XFfcQ59NMW6w0s/x4QsitZvuMHBZQoGsdo3VV25BlntL6QmR9MBEQqR3ZFgxuNS/ED0f73qUsdtZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051941; c=relaxed/simple;
	bh=EUwSWHVoqi7SpNUSsFx8wmyipmYlk9bShSAnWyQM2iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNp3L4CJbps9u++E9eFyhjlcGZ2xm0PG/3ygWdAT/my+COfS08LCaOM6WLEUv4Tyr6oWsu3LAuoXHqbsPIPlOGcWBYKGGUEiyDt7w6hRVktQxCAj4OfBV5LEUUo/rOrO9pCoAGTic+8TEVkX3K/SB5m+bOoFMqKxbygBw5+AhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASZa6hk2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASZa6hk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792051939; x=1823587939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EUwSWHVoqi7SpNUSsFx8wmyipmYlk9bShSAnWyQM2iA=;
  b=ASZa6hk2Jrz9Il6/L+cCGi8U6Ck5yho8PPTW7VKUNBWL+RzKkQougWwr
   f70ai78nYTnX5B+8E/BWv86pfHSdSzNyOwaMAmdyA+1egk2nqhFe5t7Zz
   fULkuJt8Hf3z64PdIhasXVKy20NxXgcwvlZrQ67ubVwaW8z9CapioVCm+
   dTMOZjwG+RWHSoZsVICTNnAhxZ3jCp8hTk0LCJ2ge8pJdkp0itmje+WwD
   vfhfqqdDMwxlD9s2kNOExL4FJi4Y8RT6GaQRgFQBRsCd2FNJL9FPyNRSy
   zjf3k8+W7S2H3UE8QQnZdVMaFvOhCQ7eJ/Kre1nKY9GjrBdX26pVtBhjR
   g==;
X-CSE-ConnectionGUID: K6E4tQSETgSXbHAS119KFQ==
X-CSE-MsgGUID: Fy5eG2HCSaaa9IAFj2Xezw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="917101"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="917101"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:12:18 -0700
X-CSE-ConnectionGUID: iZ4w6FFDT+mLNk9dzTsEJg==
X-CSE-MsgGUID: ZKe06ZHSQI65q5soKhkrHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="3466829"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 01:12:16 -0700
Date: Thu, 15 Oct 2026 10:12:10 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH v4 2/5] drm/i915/3dlut: disable 3D LUT for pre-GLK
Message-ID: <urarshuqsxwfwjbsdcnzuvj7i5xpcmtjmn2ny5kjvbafqj354k@ka7oucqstwfo>
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
 <20261013204705.1574475-3-michal.grzelak@linux.intel.com>
 <sashiko-outbox-170497@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-170497@kernel.org>

On Tue, Oct 13, 2026 at 08:59:16PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/i915: 3D LUT remains disabled for GLK/ICL due to unmodified version check
> --
> 
> commit 31c6b1070ace7be34ebe695316e80a7d65a5d1a7
> Author: Michał Grzelak <michal.grzelak@linux.intel.com>
> Subject: drm/i915/3dlut: disable 3D LUT for pre-GLK
> 
> This commit adds a has_3dlut field to the display runtime info to indicate
> whether 3D LUT is enabled. It initializes the field to 1 for GLK and newer
> platforms, and adds a HAS_3DLUT macro to check for support.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> > index f1df0f9ba7624..95de75e1de984 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -4304,6 +4304,9 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
> >  bool
> >  intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe)
> >  {
> > +	if (!HAS_3DLUT(display))
> > +		return false;
> > +
> >  	if (DISPLAY_VER(display) >= 12)
> >  		return pipe == PIPE_A || pipe == PIPE_B;
> >  	else
> >  		return false;
> >  }
> 
> [Severity: Medium]
> Will this still return false for GLK and ICL platforms even though they have
> the HAS_3DLUT flag set?
> 
> The commit message indicates 3D LUT is supported on GLK+ hardware, and the
> patch sets has_3dlut = 1 for GLK (DISPLAY_VER = 10) and ICL (DISPLAY_VER = 11).
> However, in intel_color_crtc_has_3dlut(), after the new HAS_3DLUT() check
> passes for these platforms, the function still evaluates:
> 
>     if (DISPLAY_VER(display) >= 12)
>         ...
>     else
>         return false;
> 
> Doesn't this existing version check unconditionally return false for GLK and
> ICL, defeating the newly added flag and keeping 3D LUT disabled for these
> platforms?

Those platforms are currently not supporting 3D LUT. Purpose of
has_3dlut is to fuse off 3D LUT support when the flag is reset, which is
introduced in later patches. It does not force to use 3D LUT when it is
set.

BR,
Michał

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013204705.1574475-1-michal.grzelak@linux.intel.com?part=2
