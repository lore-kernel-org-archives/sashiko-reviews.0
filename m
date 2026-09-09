Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9E44C4FC
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940165; cv=none; b=PqKwpZqPIEseXIr3Nuej9iMu/HN7UhYTV6zmkU8Xf6WMS5JySedngr568iuRB8etdV0yOS4AKCEgQSG1swBVpZVDYVFsNrD4heZYTXJ6+pcIRyyO1F2g3c7t5qgIa6lLa6Nhg7C0qYXtkxda38SOtUmHfIhQYrxk/xS6m6srNtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940165; c=relaxed/simple;
	bh=8vnQd1GurJDqR7xeC2xaNvbnJW63kIcEWuhSCTVmSs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bD5Q7C/OaHwhM+SlFObCYx9GPWUaOjAVX+qIHd0VAECVnPdFFIsYRGiemL1nYIQd0Y3ZTgP7tWm8r9FmtC1ILMCDvzG2oWuJDw/SBlqHpGJm02wg+95O7vTioNao45cgdPIZOaxTYKzgHEd1nwYwS7LcfMQwfivTfQIFox7ZYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso7334907a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 00:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940162; x=1789544962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUF8DuryuHuYEzLxZ7UG03vzeBaGcVG9r9nJNBW5Bow=;
        b=i4by4uz4XsUnh80iMCRwQ9JuJdPXTj46OkjbuaLYNMer/U/Nvmrw/cswgiE2R+lwZf
         XB6IkmkX7M8Of+TdCoR3xtdEWQxHjN0bXU9w4ZNGCmg5gm+UEUDWAW5nSEXSUzNShxyF
         MB6FxdKclZ4bTEuyrUX6lmBeOCnSJ3SxZOeZ3RUNHvcabhSau9RFRtfcuZctqc8abaaJ
         YSBtf1hzN4LvNvUMH1UNR9n46XpejMeiKtx/wsHhbp0rhWYlb6HEQVMp6zUYzT5LYojD
         iuMGkng7C2Ep4Nnl6iRRJaksZza9IkLWtxfu+n2JTZ+4qDCfpdZA/kI40w24Jz+ubNdj
         2lqQ==
X-Gm-Message-State: AFuF++neCVRQOgz0QhavlLfO7j5xVYAYf2hE6iGNJ7NhqFes9NagWxjc
	Hr+F6azVKRW3ySUwXGOA0DbjIReE3kC0JJdvtS8u8zr3VZRDLbEQEvfj4NmBC5BDcPQ=
X-Gm-Gg: AYBFou0e4Gg1de4pSqN17eHKX83a1mjdXcperXbXMyqXv6kTN3ItmQa/BjY0VEmvku3
	841LLdCNuq98RMl1OvDAp9LTgS/UK3JdC/6siK6euSTzjz8rkJHn/ytjIdby9w/sBlewOTT9G+w
	voM5TEihsweDRLidC+lRBZDpHcIPeHmBO18IsubBuJw3YhzkvFdrI7SIiDfpp9JUIWbyZ7QmkRB
	ZT4L7E3iUeH6sTPgDTqSCN0LReG0/ZaiRXu7WKTV7KbpcROlWnG4pzhZjD/xL+BWlOHP2BNbeec
	OvQtU6AxSKEQiwbMa3uF9CjkGtvyHjIFqivhH60xWL4Mmcj36HQi0bAR9Uo9ExcyNPVuVaUAnTP
	qbjITjTCctJAgMvPprbusCXGaAHsxpT9MY9kKbFsimved81XQM2aarWkKzlUTpSCNTDTxQGw+fM
	228vfflckL+V+pBvPuy+klEptS7bYqEYkyi8/c4Whayoi/KGpzh4Le1RPSpDUZ+KZaB/iT5EHq6
	RnmHT3s7WbutirgwLX8BMUFyVvexZ+BFukE
X-Received: by 2002:a17:907:c16:b0:c25:34c7:44d1 with SMTP id a640c23a62f3a-c260c421a87mr1258589066b.0.1788940161568;
        Wed, 09 Sep 2026 00:49:21 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2938a59134sm21972566b.51.2026.09.09.00.49.21
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:49:21 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso7334897a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 00:49:21 -0700 (PDT)
X-Received: by 2002:a05:6402:4341:b0:6a9:9ac6:c3dd with SMTP id
 4fb4d7f45d1cf-6a99ac6c857mr116589a12.14.1788940160982; Wed, 09 Sep 2026
 00:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com> <20260908175845.A6A4D1F00A3A@smtp.kernel.org>
 <aqBRpviTCjwo3weo@redhat.com>
In-Reply-To: <aqBRpviTCjwo3weo@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:49:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0o8xuUd-DWetgek5eO7noteJJcRpuLnz5W3brPVgHVg@mail.gmail.com>
X-Gm-Features: AcwNN1WKttUj2cnJbIK6KhCwT1KolPKy7s8wGC_Mrufwi-OIl1osoywjKGmKypE
Message-ID: <CAMuHMdW0o8xuUd-DWetgek5eO7noteJJcRpuLnz5W3brPVgHVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, wsa+renesas@sang-engineering.com, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 20:22, Brian Masney <bmasney@redhat.com> wrote:
> On Tue, Sep 08, 2026 at 05:58:45PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] Missing semicolons after macro invocations in `subsys_driver`.
> > --
> >
> > commit cdf3179a9f2205efd1b552f70b7522e1db5ee888
> > Author: Brian Masney <bmasney@redhat.com>
> >
> > driver: core: add subsys_driver() macro
> >
> > Add a new macro subsys_driver() to eliminate some boilerplate code in
> > drivers that need to register earlier in the boot at the subsys_initcall
> > level.
> >
> > > diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> > > index 768a1334c0a1d..29fbc01ef06fc 100644
> > > --- a/include/linux/device/driver.h
> > > +++ b/include/linux/device/driver.h
> > > @@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
> > >  } \
> > >  device_initcall(__driver##_init);
> > >
> > > +/**
> > > + * subsys_driver() - Helper macro for drivers that don't do anything special
> >
> > [ ... ]
> >
> > > + */
> > > +#define subsys_driver(__driver, __register, __unregister, ...) \
> > > +static int __init __driver##_init(void) \
> > > +{ \
> > > +   return __register(&(__driver), ##__VA_ARGS__); \
> > > +} \
> > > +subsys_initcall(__driver##_init) \
> >
> > [Severity: Low]
> > Are we missing a semicolon at the end of this line? This relies on underlying
> > macros providing a trailing semicolon in their expansions. While it compiles
> > today, it makes the macro brittle. If the initcall infrastructure is ever
> > refactored to not include an internal trailing semicolon, drivers using
> > subsys_driver could fail to compile.
>
> The other code in this file (like module_driver + friends) has a semicolon
> however checkpatch.pl complains if the semicolon is there. I didn't know
> if the semicolon was legacy. I ended up going with the approach to
> satisfy checkpatch.pl.
>
> I have no opinion either way about this.

IMO there should be no semicolon.  AFAIK, the rationale for this is
that if its use looks like a function call, the user should supply
the semicolon, just like for real function calls.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
