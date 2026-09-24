Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBC1440A2B
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286534; cv=none; b=cZVKNz3bjtkOt8Tvc4zIFEx485IswzDbrAfH7eXxOmyFrAx+G9N+AqIXKwkspaQnV6kO5hOoUY+4YGhw9AYwD5g2jPFhaEhq9aIectZ8Gl3fBwKL3YvjZRt+mgXLYZpCknhF5AUk9n7/Z91lXjhiSsO+6TJWbVmeQm1XCYLgYH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286534; c=relaxed/simple;
	bh=22T5Y5q1dDPW8Fz12c4c6F2VYqRVut/pkd+njYS4uxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dy1eY2pSeZ8694f8XMrFUt01TmvXJgngxla3rhAFckEBsCUtI2mhvCt34XaWqQRHnyvXSWjgGDWeIIolQuVFpHMK2GyL00t5JctpQaHG+dBvQfs9JePTJUeIQdoAwZR1QPt0DOgcSK7LKryPgFSy8Z4qIOp4rGvjzrMZO4+Beew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2Sps3IX; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2Sps3IX"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c4so265694b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286532; x=1790891332; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2VDHuC8A3j6iZ3qSRJ3zMwgO1Yc9tVse+wSVpxPDMY=;
        b=S2Sps3IXUG+CMrSrUuxpgwih+pg0jmoHifTMnT400kgLnxxytvynCTaUJRULpwRdYD
         iT59+rLsxWR3vGEL23+DayBFTI+BszZowIjgJR0MsER3xE0jerN/2Ipu3j/pEIeoOKb6
         br1SsvAu92XVw1xkCxeL1E4qL0MjkYZutm9s9/J97yhxX57KhJl/D8W23aFivaUVHXIO
         QwZhlPGtv6w1bkPRWfZBk3WF4V2BlnAnFd4s6HpnldqgIqv1abX2qw1k7g/aLVGUjZc3
         bUr6vDh1kXacZKTtIrBrTpQbhOs648TfMdWeIXe4XsCv9qLgi5GmZywX9OM/Hc0Uvy+e
         KgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286532; x=1790891332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2VDHuC8A3j6iZ3qSRJ3zMwgO1Yc9tVse+wSVpxPDMY=;
        b=hldXNtSTrmYa04usqnqALisls1PKLuhK5+GVNxQ1OfiAIHNdLPzGgy/lfKvbbVjTp7
         vY5iGTdlgUnMAelQ78OsIYBo9+YFvbvEZoQ8i55aSa+DxnyaStz4QJ9w3WmwIuehVI42
         NCnzkgLz8M89zJ/lreC28wQsSEuwFsRb+KeLAwNcoQZng3rzmqmHnS+JcLXVpdgViE//
         QldUUD9w6FRZeW3za6F5oyxVDeJSxNJBKAH9uS1Qsef1xR23T8OyZb/PRzFlqbJoN/xT
         rfMdBrVtKYVFLwe6c1aS2iQcOw9Dayu4UgbZc8IxW7fbaF4B+NGvZJgmC6RX+VLzU4w0
         /RVQ==
X-Forwarded-Encrypted: i=1; AKwUvByk63dkKCGiGyedZyIjF2qaB4VhzXT0UhH781YJJOXsPxf/DvQu5q/NKd9adGqGkWC4O8mb9guOibBty9S3SCw=@lists.linux.dev
X-Gm-Message-State: AFuF++nudFgflz6V0gbZwr6oTBTEh8iJRpdU3SCHBX4AcI34TI8zY4jn
	ZiBAXgeVTb/tka2o7QyABoxb1mMIL5Mt08sOiHJ2co7pV4XHkpKsrjSL
X-Gm-Gg: AYBFou0uSurah+PCGgU+82hLgk0hxnUoFZVejZurbYX26FmxBRZv1QQhC1Efl6qEhvy
	Hx1BpimHwp+z8Sga9Q2x4D1O+83aiKcvg2XaU3Ov2lOjOk/JrXQL6+Zqq6onURDCW79389cbHgx
	MEdepBANV7VZ7M4bqgvvWEtpFJopK8O75islnx4/9d8Xc9AT+sxcgPRw8JycjSk4Bw/53aTABLS
	MTSIuyVR9Uz/jG1RSgce8l3zQ1IumGo761LtD/WDfIeVaGLjfyAtXRzpK9eEvFHjkItQYOzZ7SZ
	JWty31+V1loKmLFGGK/R9XsximikD4NGOEf000n40kpJCqKsVqrbY3gngs2qPUaLATGe83kl3aw
	Zbt5U8m3S7RY5jUUpReC+RIJYG6XXHiun0RYfx3OZ0Z7q4Eh3uKmmEUAn7eZtyhkmylPPBaqj0d
	NnbOJZZuIfvHG0b0RJKeOvpdJcE1/RPrtiRfWJm/uZSRsuEq0gTVHKkw6EjjS2MmtLoPl5RpGyv
	3637n3F69Z8iEOUZXKQJzc=
X-Received: by 2002:a05:6a00:1948:b0:878:37b2:df9d with SMTP id d2e1a72fcca58-87e9ca1e71amr3307440b3a.55.1790286532158;
        Thu, 24 Sep 2026 14:48:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb57e56csm196702b3a.48.2026.09.24.14.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:48:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 14:48:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-watchdog@vger.kernel.org, sashiko-reviews@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com, robh@kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Message-ID: <4f5aadf0-8f23-4871-918f-430a0c99900d@roeck-us.net>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923105237.7B87D1F00893@smtp.kernel.org>
 <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uD16uG8cc9m7NHVZXT5bU64TYfu+_1POuXeioRAy6Z+A@mail.gmail.com>

On Thu, Sep 24, 2026 at 02:44:07PM +0100, Lad, Prabhakar wrote:
> Hi Guenter,
> 
> On Wed, Sep 23, 2026 at 11:52 AM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] watchdog: rzv2h: Deadlock in restart handler via syscon regmap locking
> > --
> >
> > commit 1e1b26069f70735a537750b22a51257bb422c2e4
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > watchdog: rzv2h: Add syscon support for WDTDCR
> >
> > The commit adds support for accessing the WDTDCR register via a syscon
> > regmap interface for RZ/T2H and RZ/N2H SoCs. It looks up the SYSC regmap
> > using the "renesas,sysc" property or falls back to MMIO access if absent.
> >
> > > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> > > index 76c1d315b0e77..30b0b70fecaa9 100644
> > > --- a/drivers/watchdog/rzv2h_wdt.c
> > > +++ b/drivers/watchdog/rzv2h_wdt.c
> >
> > [ ... ]
> >
> > > @@ -93,18 +104,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
> > >
> > >  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> > >  {
> > > -     guard(spinlock_irqsave)(&priv->regmap_lock);
> > > -     return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
> > > +     struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
> > > +
> > > +     guard(spinlock_irqsave)(&sysc->regmap_lock);
> > > +     return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
> > >  }
> >
> > [Severity: High]
> > Is the external sysc->regmap_lock still necessary here?
> >
> > When using the syscon regmap returned by syscon_regmap_lookup_by_phandle_args(),
> > the regmap has internal locking enabled by default. Since regmap_set_bits()
> > already performs an atomic read-modify-write using the syscon's internal lock,
> > this external wrapper lock appears redundant for the syscon path.
> >
> > >
> > >  static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt_priv *priv)
> > >  {
> > > -     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
> > > +     struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
> > > +
> > > +     return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
> > >  }
> >
> > [Severity: High]
> > Could this lead to a deadlock during a system panic or restart?
> >
> > This function is called by the rzv2h_wdt_restart() handler, which executes in
> > atomic or panic context and must remain strictly lockless to prevent deadlocks.
> >
> > While bypassing the driver's local sysc->regmap_lock was safe in the legacy
> > MMIO fallback case (where rzv2h_wdtdcr_regmap_config disables locking), the
> > syscon regmap has internal locking enabled.
> >
> > Calling regmap_clear_bits() unconditionally attempts to acquire the syscon
> > regmap's internal spinlock. If the system panics while another CPU is accessing
> > the shared syscon block, the restart handler could hang trying to acquire this
> > lock, defeating the purpose of the watchdog restart recovery.
> >
> Agreed, the syscon regmap lock cannot be bypassed from the watchdog
> driver, so the _nolock variant does not achieve anything for the
> syscon case.
> 
> Rather than working around this, I think the right fix is to not
> register a watchdog restart handler on RZ/T2H at all. On RZ/T2H,
> system reset is implemented by TF-A through PSCI SYSTEM_RESET, which
> triggers a software system reset via the SWRSYS register. The PSCI
> driver registers its restart handler at priority 129, while the
> watchdog restart handler is registered at the default priority of 0,
> so PSCI already resets the system first and the watchdog restart
> handler is never reached on this SoC.
> 
> With the restart handler gone on RZ/T2H, WDTDCR is only accessed
> during probe and from the start/stop callbacks.
> 
> Is this approach OK?
> 
Makes sense to me.

Thanks,
Guenter
