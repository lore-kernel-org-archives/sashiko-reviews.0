Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570625B0BD
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848336; cv=none; b=bqQ+XGdT5Y9R1nEDwLGSHpVW2QWfWavtU+LhwKSgKw/Z91oX3GmqwiOBXmAHMDVWVrU3SZjNq5p4jjoAK3DUZN8gfKR73VGFZmsYb8T6pBfuPo/Exj04TB6mA8NDJPelj26aEyIj1xKndTe3aGz/kbVYyjv4tG/3ioucgFwxO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848336; c=relaxed/simple;
	bh=Gp+S0v1rYV7hpzCCANfT++44VMYZp/S22ThXtTKVNRw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcawvX+7a+yZWLYe6Tyy0EPX2YSEW+uIJwcrfkm7TYNMIqIpjF4EkuRQxxgKOMy5enN8lVX8MD2e+xEcUjguuSDT5XTiQu0DKZbO8DCjpBqJV+z2DX+ngRNfChVP5HACWZpWIvlgXzjGEQXUmI+c/7hCcYS2FdbzgBW4SSnwhiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRjmeJeS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRjmeJeS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so79579285e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 05:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778848333; x=1779453133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IrShLxsV3WkUC0fBh2wRnSsPzj6d/MK1yXuxavlu4hc=;
        b=MRjmeJeS+/evWPBAETPUMELki2mk5ePnh0aq4RkQo2u8jKT7yikbuvg02VraKXYE5m
         k47NzKgRRWoaVbXsMNDxH0NMaXZ5hokuJsgvj6WcP5qZ8B4vju+bTEM78P9QxQ8VP92t
         8yvZkaEjDI6CxbvTSDzdiVh9CRPp5CniXKBwEKJgrZp5eO0ZXVGbWv8nbfvTrn27zs5B
         UPrGT4yeduMLP46JYN8FFBEimAC9y5wDvmDWri0py1VpA/umLbdyWQysK5vAlcSlfX4J
         uR/dCzKR9soSF4IgrdfIkkJotXGxUtqNaT3S2zor8QX7bzyAZijJsHk17bZwbMS6+tQ0
         hCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848333; x=1779453133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrShLxsV3WkUC0fBh2wRnSsPzj6d/MK1yXuxavlu4hc=;
        b=dbVKvvEINFYKXdwMWAkOknk+UD1aBL6ObvXFq2ELTIcyOxgP/ryA67KRY5sFw5r4Rc
         VxBUaE3N7G08CNhfA3vFy5Xxf70yxMZAUDrS6RK1J+k72s/KBnAXoymvvdUhZj1UaYyE
         +gAK/eAM1RTcCAwlQwIAWNI1+e1F8EH1Bo6iUEEdbjPTx80SoFQQDW5a7/wUofNW0vYY
         XWLeLjYQMi6lIAl9ULtwnpYTlcesyy37tfYouqlCdXHbN5wXYJOZ4WLRW/ess7z7TkZZ
         ip6gSupke3ixr5rhGdiCNZaJIzLaDhDoT6G9pK8chYRzskkBFsoQl3aAyRjQ3nYXIzw6
         G2Tw==
X-Gm-Message-State: AOJu0YykknEFmNz0YFOjU49YvHAQRVX6B0HZ+w9xnsOWj79VKCDqLyrE
	ZyLWgnwRcz/nz4WsmP0CTRp2wXlTEDEW3NE5n5VERA5Syna3blDIEjdc5IIme03k
X-Gm-Gg: Acq92OEue0V//0Ntm+2nryQ0yzg7bBlTgE1VeMV2IAiTCGE53Iv796+b1srHPup72Th
	dthciinXFYaB1/NckXvXMuFqTMtITnm5uaIM1ZrOfaH/PG/dcgjg3lJBSaorexdcI/s7Si9oBF4
	5ToskRnm3aC5VcpLXiOdWgHTSZzu8L2GvxT7Ci6ThWnkgIjeVNbsGXwxEmR0Rq+4Jj7Cjo2Ij3u
	fJBu1h4qDQ1Nm15hYynuVB6z2g/nZy8wjelRROOVJ6DRAdY7lWWf7293Hv9u9SwiuQulAfcBsiR
	wFJqB+jK8uxEjHuKUGmvcdzF1OOa/TjXPJVk74MuTX28s3iMRlROWnOruMDV2WJSdMXBl4K0tE9
	CCZKKc7S5wXfxAI2ZUXh/VG2F8cCcYEPlglWDUj6MKsMyert4GGDgp+y+IBebkLetX23r7KjNDC
	JrpznzVZcM/zB6MLM=
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr51392865e9.32.1778848333256;
        Fri, 15 May 2026 05:32:13 -0700 (PDT)
Received: from krava ([2a00:102a:4039:3341:dfc:8dc0:b9c5:81b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm105593905e9.6.2026.05.15.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:32:12 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 15 May 2026 14:32:10 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH 3/7] selftests/bpf: Emit nop,nop10 instructions combo for
 x86_64 arch
Message-ID: <agcSSnEu0nWsWgvc@krava>
References: <20260514135342.22130-4-jolsa@kernel.org>
 <20260514204426.36E20C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514204426.36E20C2BCB3@smtp.kernel.org>

On Thu, May 14, 2026 at 08:44:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit modifies `USDT_NOP` in `usdt.h` to an 11-byte `nop,nop10` sequence but does not update `prog_tests/usdt.c`, causing the selftest to break and introducing a git bisect regression.
> --
> 
> commit 600c1890b9793e001b5d8d9027629fb122af9024
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Emit nop,nop10 instructions combo for x86_64 arch
>     
> This commit updates the USDT_NOP macro in usdt.h for x86_64 to emit an
> 11-byte nop, nop10 instruction sequence instead of the previous nop, nop5
> sequence. It synchronizes with the latest usdt.h changes to utilize nop10
> optimization support.
> 
> > diff --git a/tools/testing/selftests/bpf/usdt.h b/tools/testing/selftests/bpf/usdt.h
> > --- a/tools/testing/selftests/bpf/usdt.h
> > +++ b/tools/testing/selftests/bpf/usdt.h
> 
> [ ... ]
> 
> > @@ -313,7 +313,7 @@ struct usdt_sema { volatile unsigned short active; };
> >  #if defined(__ia64__) || defined(__s390__) || defined(__s390x__)
> >  #define USDT_NOP			nop 0
> >  #elif defined(__x86_64__)
> > -#define USDT_NOP                       .byte 0x90, 0x0f, 0x1f, 0x44, 0x00, 0x0 /* nop, nop5 */
> > +#define USDT_NOP                       .byte 0x90, 0x66, 0x66, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00 /* nop, nop10 */
> 
> Does changing this instruction sequence from 6 bytes to 11 bytes without
> updating prog_tests/usdt.c in the same commit cause a test breakage?
> 
> The selftest in prog_tests/usdt.c hardcodes the old 6-byte nop1_nop5_combo
> and searches for it using find_instr(usdt_2, nop1_nop5_combo, 6). Because
> the old sequence is no longer present in usdt_2.c, find_instr will return
> NULL, causing the ASSERT_OK_PTR assertion to fail.
> 
> I see this is addressed later in the series in commit
> ca88e95623000540d5b706ce364d5b5abf75b4c1. Would it be better to squash the
> test update into this commit to avoid breaking git bisect?

yep, selftests are modified in following change

> Additionally, looking at that later commit, it updates nop1_nop10_combo to
> 11 bytes but appears to continue passing 6 as the size argument to
> find_instr. Should that size argument be updated to 11 as well?

yep, will update

jirka
