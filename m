Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57DE279DCC
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 18:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130177; cv=none; b=T5XYeYl6IhWXUKSKPhYkUZMt8IjTBWeWVevo2tRMcq1IMhkeLC/01jEmll1aITtX/ZGA/gQm4ZpNkGC8z/5ks6/IvRrR2KmxNEMA1i90yZyIwDPa+yP5qgwl3bxP6OftxVVx2+F54mTezShHf/KuBUdLFygO248ULVNvwI3nZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130177; c=relaxed/simple;
	bh=MC6vPKbNlgjaWmED6rvvCIpirl9l+mwWzP22ZBRnHDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGOpdt5DvTvotWt9+FW6da2gC5QBY5j1BUz2W8ZHl+4CxbTlkC7GTwC4ZS+26+dRKVyJ5WdDTyw06Nc5Y2v+seL7VLEUS2IIuyAVSOluXTeQVbWl/ZrElrqsH8Dz1856JCQKAclkp71ejUzVZsVQHvwJfS1rw5y9l6uOQ0zTjGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSMKfEc1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSMKfEc1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e7c636e74so1006183f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 11:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130174; x=1779734974; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ycA5svcD7G5NV7SE5711YCA0d1sVSC7pnvewKsFkowE=;
        b=qSMKfEc1y2b+NQ/yGIdB9g2MbnX+t3U6OM4X/9G171Wb84oGs8HFtX+Wa5GJQNgB2w
         G5Yj2fvTXBgTeuFZkqtUv6hKwucWGJm2VRXHg4sVv5kwuChKJSZLhN6LAFUNL18imola
         9VbAZ3Pf1Z3Wcy3oi5p4d9qgGTJ7ZVoVkqksziWQ6JZeyPLWXtcR5dBCW7m50J1byuZm
         cbn98cj/bZur64kuTzcf72B5FRuMxh+XQYEMIJK2onZJGBPBZh5+Nkg5WmWo2Xxt16co
         Mcc/ei0SmMsdVovMONzdpBW0SSvHkRHZ063CSLVLkPmx+rhpiop+E/Pj5gTHx9HV2GHN
         db6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130174; x=1779734974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycA5svcD7G5NV7SE5711YCA0d1sVSC7pnvewKsFkowE=;
        b=Kb5gFIUN+95Mo3SwEhhKy5LcBeOmxi8f8nlDi5wZ9BYUbcZoY34wvD5JjU/c6PHLP/
         tdxsr8NBfJR4uySdmDod7X5Gr5R8JpmaL0VAx7WXywu9BmeWrnh1egcedtGxtp85pJZf
         8VFkW9Waj73RQcqqAAr36sdM4zlyQ3tg9B7+ZtFCr0ghPk6nzrU01tVJJtAgGUUjVGqG
         mxWLDoTc4mA3L12Q079+aLISsQs7wkxmaAgiWXIjt3dtE+5i9gPqIN9TYHyMT5/2u8tK
         7nupX6JVuYcUMiwIBay/1Xof134k1LpBDD52HJPwlEq4ggFn0ImgmZbFjQqKY8pxt+9J
         k0zg==
X-Gm-Message-State: AOJu0Yy9rrmUipwmqx1wChxTmecqMs9AoOxdyiKLZF7ZauxsBl57oR3t
	H/JOshUiYiwFEkPaLQU5iL9VGsi8WWW6rqKOB08zJRGOc7go9v2M8qkuqpzaqcvI
X-Gm-Gg: Acq92OF9KOfZyazToO1wNmhXSgkh6LZ58akgvKDfJwXaM5nR2xQk/4aZLF2MbTRE/xu
	L/Ks51QBUxRkcP28Fh6WMglcpqmM7VrZeOrWkC55Hu83vFuFrYAP2usprwiWk1UgsFXn996o778
	unn1G5EDN5yUivtQn0jP6qphqQCk296/2nlrCUMZx0djfTEocFO2ojPed0j4EUTxtxg+tJUzHK7
	pozzXvR5yl6Ne/cYEiagrw/oSsSJ+H50xEhAld+HXCr8MANjcgpYB4big3qRLEygo/yf3AfvOSX
	XHdpZjIUYMtsGScG2OoWIFGPM0lJaMdRSOgew+qo2zhs0O+UyMCPMLmcLjRKBTJPBi4Uwz1wRnD
	PHb/hVgwQzI8EJ4n7coTEd9wRX652UPlaQNhUQ1FeRb0HXL7sAu9aFQkpGtTMQq3isRrjDtrsuR
	DCjOfUYbO6S0XPK4tmoPhACm3knTUlvp9TPLNGg5vCfThycAAdCWplAMq4Y12wtLYgJzSEUROQN
	dAAwGFlsHeDN6JD3eTCZWT3ag3o+WYFjOG1bIutLyfPuF2CEjsezizPewWH2xkMTJMWIPKq+Msy
	8FDtUBEktB1IfIUPttuVGteR6wjxk7YhP469MXNyUE6ZqiXm5vAb
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48fe60ed7b7mr225620585e9.10.1779130173722;
        Mon, 18 May 2026 11:49:33 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e0002302090c50a60b9.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:230:2090:c50a:60b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c744sm88940555e9.3.2026.05.18.11.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:49:33 -0700 (PDT)
Date: Mon, 18 May 2026 20:49:31 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Override EXTRA_LDFLAGS for
 static builds
Message-ID: <agtfO9lHdKdP92Mo@mail.gmail.com>
References: <714556da329c812988010ffe53173d9152570a78.1778669303.git.paul.chaignon@gmail.com>
 <20260514042304.EF3ECC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514042304.EF3ECC2BCB7@smtp.kernel.org>

On Thu, May 14, 2026 at 04:23:04AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The suggested workaround `EXTRA_LDFLAGS=-static` in README.rst breaks the bpftool build or silently disables LLVM support.
> --
> 
> commit dcbd0d5d7a0eb4a9300ad0890d83b7e4cdfd3aeb
> Author: Paul Chaignon <paul.chaignon@gmail.com>
> 
> selftests/bpf: Override EXTRA_LDFLAGS for static builds
> 
> This commit updates the README.rst for BPF selftests to include
> EXTRA_LDFLAGS=-static when recommending how to statically link,
> in order to fix shared library loading errors with libLLVM.so
> when running vmtest.sh.
> 
> > diff --git a/tools/testing/selftests/bpf/README.rst b/tools/testing/selftests/bpf/README.rst
> > index 776fbe3cb8f9b..37164322a1023 100644
> > --- a/tools/testing/selftests/bpf/README.rst
> > +++ b/tools/testing/selftests/bpf/README.rst
> > @@ -77,7 +77,7 @@ In case of linker errors when running selftests, try using static linking:
> >  
> >  .. code-block:: console
> >  
> > -  $ LDLIBS=-static PKG_CONFIG='pkg-config --static' vmtest.sh
> > +  $ LDLIBS=-static EXTRA_LDFLAGS=-static PKG_CONFIG='pkg-config --static' vmtest.sh
> 
> Can adding EXTRA_LDFLAGS=-static break the bpftool build or silently disable
> LLVM support?
> 
> In the bpftool Makefile, LLVM's --system-libs and -lstdc++ are only appended
> to LIBS if llvm-config --shared-mode outputs 'static'. However, the
> feature-llvm test in tools/build/feature/Makefile unconditionally includes
> --system-libs and uses g++, which automatically includes -lstdc++.
> 
> If a system has static LLVM libraries but llvm-config --shared-mode is set
> to 'shared' (common on many distros), the feature-llvm test statically links
> successfully, but bpftool's Makefile will attempt to build with LLVM support
> using gcc -static while omitting --system-libs and -lstdc++. This can cause
> the build to fail with undefined references.

I'm not sure I'm following this, but I have static LLVM libraries with
llvm-config --shared-mode set to "shared" and everything seems to build
fine.

> 
> Additionally, if static LLVM libraries are entirely absent, the feature test
> fails, causing bpftool to silently build without LLVM support.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/714556da329c812988010ffe53173d9152570a78.1778669303.git.paul.chaignon@gmail.com?part=1
