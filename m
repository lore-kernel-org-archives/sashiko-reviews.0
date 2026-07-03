Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE74348C42
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067173; cv=none; b=azNC2swsnJ/g5Ww67kTT0b3+PAGEb0w8Sf1JDcOg+Z55ahtd7iI+3DbBdJdnIYRzRZiTkM0LCu4c5WIO64DS2QnlqFOZoMOOSUX2qARbl+yta9Smxnu0BUpPkWEDacR+C4+0uJE5cIWWAC7rN9AV3CYxINFcAW9O/exVEADuCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067173; c=relaxed/simple;
	bh=XKI2pAfG7OX1O/DXM04l/YZndOsoqOzA948p9sxcHoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7fH1gi8QGylGbhKStyjidwKUg/MDTopqD5ExhTkIUyFV9iitLeiByOgZZ4Bdqzdd6h/ekL6ORBHdNl4n/GBJwBVedlQMzkjoMnVvqJjrATTEV3uuTkwR8p8N8jMYf7P7Q2WnMDzdkPe+AAJVGqzigvSaM1lDnJ9uDzmG4CAlng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HK240GIP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HK240GIP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so1684715e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783067170; x=1783671970; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi3rhvEIY7HPb2+WXJBWNBz8xP5NaPUV+FO6A/JpBpc=;
        b=HK240GIP/EdmTfjzSRP4A7S/2UOltMzpvQV6U2i44KSLj5ZDE35hVv37D337kShPqy
         IBHhbJe5mRd6VqxmWF30BtzJZDl4g5hp4MQws0tccXVSIOMPFUTV2ZV3gIycMmawNckz
         lOV4hd9Z0/1RHsfY9vG70lFmvJe0mw0PnYtypjcuTrS7sMagQQnmlVKSX4QzBj1QkLHA
         jFkr8FC2HRGBK+S0cB0Io4i6fji6Fh0GPyhVTfH4zHY0FF7QHB0BBMNGZ1XEhQG/vn2O
         VZpKgVLkXjBX1eZsU2gtBcfMeuvXqAjyhHh0wWKDzuuVmcxpD4nyXgikylXNbmq8U3gi
         5mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067170; x=1783671970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yi3rhvEIY7HPb2+WXJBWNBz8xP5NaPUV+FO6A/JpBpc=;
        b=Loz0G0tdwdTvyXYXbghbYPJpfPgUH7ZYfwlY0f53eeUqbRVmijpiSj2v4oajpXK9hc
         zPYzpmZEBwdHMbInQ+d1l4K0JwIVAvVwtK12Kvun53wAIY+yTJw28Nn0jHvudGtjqGXx
         1OGQu2w34EUh4o7guaqmwkMlpjtHd3W58i3r49g1gZwvz0KaaaF3MURJ3L0MOlBlKE2z
         zR0xlOrpHqeW91otXmqsa2v3syCUg4pV0dM6Ww97EIC26yfIL1lF7vlZce17bYsE9JU2
         EtgzZAzM2zEATUiKOB6s7Jgg8XrIxylBIATw7T4zI0Y1O0jctPDHIL5rAno63j44xmCO
         pvOQ==
X-Gm-Message-State: AOJu0YwExd2g0SmlCAE45Qk2fXMmEdrQ+3jHoCm9qWKzwtUt7wpPREPB
	6vY186zI+Awltjw+Y3MHagCooKWuFvopAQLXs7/37LKb9bhU6QLe9wbX4ffVIazhDceDtijzLIU
	tC2zwCg4=
X-Gm-Gg: AfdE7ckEEsCbg+shRUKSf20r2fbaYct/RkU0X3yG4hPG7iM25XtFBjJ5sM+6jz42liE
	Flvrz6QJVIIe5nbRLVaAJNLgQuO+UNvtnJNyntj/MF5npFxSH61WQysmYLnlWkOVU70jSXQemb2
	kMizsnq9DUcl4zOIBhS6eyHMcD8SZ0P+q/kp2sgbTYSJ9aUqEXLln7zbNAI5hJpnBiKF9Kh/IFN
	2G3+aofzJ6Yo36+B9bi8y2LkYWSXqHVOjEMmH6f98MpMfaTOtsSZFlLZD2mKU+FBMaN5M1RxP7u
	sBym6bDU/t8ceUbMla+4aseYUqnePz4Au4ycRlDWMROlT/6UAATIxGj1QbZQ4U7OzAJSCmG67Q4
	g/hFsObIQ/FjbGuHAOFJIt8QUStpvPDD/QVxud/P5ZcJ8bPNJ/XaHnHu2UNYT4fIYYAVCOjgPGN
	L09pWfycDVDq6ygJY=
X-Received: by 2002:a05:600c:8718:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-493c845bc60mr60654815e9.4.1783067170178;
        Fri, 03 Jul 2026 01:26:10 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm50659555e9.13.2026.07.03.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:26:09 -0700 (PDT)
Date: Fri, 3 Jul 2026 10:26:07 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	shuah@kernel.org, Zelin Deng <zelin.deng@linux.alibaba.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akdyH7rRV1WHtBJ3@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <20260703061449.246801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703061449.246801F000E9@smtp.kernel.org>

On Fri 2026-07-03 06:14:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete fix and inconsistent state: The patch correctly unsets `sub_make_done` for the `kselftest` targets to allow Kbuild command-line reevaluation when building external kernel modules. However, it fails to apply the same logic to the `tools/` and `tools/%` targets, introducing a discrepancy between build entry points.
> --
> 
> commit 06c418388d65deb3d8494a6e8e7071c0e709186b
> Author: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> kbuild: unset sub_make_done before calling kselftest build system
> 
> This commit unsets sub_make_done before invoking the kselftest build system to
> ensure Kbuild reevaluates command-line flags when building test modules. It
> mirrors a previous fix done for scripts/install.sh.
> 
> > diff --git a/Makefile b/Makefile
> > index b9c5792c79e01..f717a4dc96d6a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> >  
> >  PHONY += kselftest
> >  kselftest: headers
> > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> 
> [Severity: Medium]
> Will make tools/selftests still fail after this change?
> 
> The tools/ and tools/% targets in Makefile delegate to the tools build
> system, which can also trigger external kernel module builds (like bpf_testmod).
> 
> Because sub_make_done is not unset for these targets, invoking commands like
> make tools/selftests or make tools/all will skip Kbuild's M= argument parsing.
> 
> Should sub_make_done also be unset in the tools/ and tools/% targets to maintain
> consistency across the build entry points?

This might make sense. I see that the tools: and tools/%: targets are
defined right above the kselftest*: ones. And they are even advertised
in "make help" or "make tools/help".

Well it probably should be done in a separate patch. It would be better
for bisecting potential regressions. Thomas, Zelin, what do you think, please?

Best Regards,
Petr
