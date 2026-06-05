Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E95D3264D7
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670389; cv=none; b=ozIFguHII2Xj8qeuXvdDFDesnyrVBTVPYJmjlNyzkm9vNr/FUFWf5Uuwe8Xf0k0wsPv/06Lc1N8uYKqi9aaiUJDknkftuZhjP1wMwXWqhAL7C5gliMLlDjcd7qsOqrG5QmFEmySPIZm7GXoHb5+PjfITZ6W1+D8Ry3rTnPnWj7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670389; c=relaxed/simple;
	bh=CM1vQsdGnWWlTXI4I4TAccxaKDUx7kLliDXk79XSviE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SC2sonQ/ZbhNylL8TK/MtMmPzNDjxGtnRYhat8X7eL8KuEe2qeXPD0mGuLF3AyzM87f5bRfCG5BC0NtClSOwm47e8J2KvzcHp332hb3sAMf2w7KghRcA94M8/j9IEsZ8l0w6oCEkSFliV5sgp8Tq6ghQwtnzx4Y1yVDtbN0hu7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RppL9Cy0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RppL9Cy0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b7866869so23916095e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780670386; x=1781275186; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUIZL9i8oUophSbYRoza7KammzJbwhT6WTOvTfjAekM=;
        b=RppL9Cy0kbOonlVFFAZ6d+Yq1NbTpHBF6lvlkhTXZP8n9OLAl1ODiI0DMGciO3y5Ie
         JF6lCVGmj9Z3AMC1LBJ4IdOstHTCojQ606zGnTMjOS+eT7NgzCjlx+ykZyHstRyUyXFI
         fyXwaHqGIIEDdyYG8MY2QE0M0IVX+MgL6yo1Jl6g5ZNasKjoIOGJjpnzSGwBGutizZDn
         P091OVRt/rzC5nbfFkbzj8XMPjtdbloWwXqxv0Sky9swklOR3S17DTaam9IoQ5RnfQ4V
         iSBHp4Bl6m+QxurmTUHe2zFB2PQJclrejEeRz+55yc66EtaTpDBTOH4YFl5zbtdQy2TY
         39+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670386; x=1781275186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUIZL9i8oUophSbYRoza7KammzJbwhT6WTOvTfjAekM=;
        b=N2ToGAWorQ842UMQJJk1Zgfxt7KH7zOnVvFpXCf0Dv8nm3s6IShvFtK/BQX4fBPYiN
         4o7K4/JvR21uJmzWlRp0sSIm+lLte+gw+y9J5Pix4w1jX5scoxFaH7v2QBQowhTVyOyK
         ChllGETAM2b0x8xWYiJd9K0+N/HtCsZszB1wgT+0w8sNYZj7ysKp9W84u5GxQW0idMno
         R7msYjhxvj43UtJ0yjOomXe1rpsJ1UNX3A+FdoQsg0wgpx5GG0dm5DZjA1psrjtQd/m0
         /kErZTJy8TwKhFpzaVMwVvRMI3jx4PqMfQ8Hxz79AqAJL5fW240hcXEWwBIH4cAePkMT
         L/JA==
X-Gm-Message-State: AOJu0Yz+c3jbq2Bz8WRHTSgpLP24WgNgD9SO2ZcqyQoIYk3m4cZ3tHuW
	6CFBeMsFF0WBNGUEB1nx+ONBR21Cs5278NLcfDNmz9RSadH90TqDjeqz4B/fHZ0XrFw=
X-Gm-Gg: Acq92OEFtjw8878L72cMEq33zecLZUKG6mZLy5cbEtngQ2A91BsrnhXnzuoVREKj7g3
	5OFr3OYiSvLleIKBo+VB8KJ7Bl7vz6v5xHjN3FeJvpYgOzR4VWYzvLxDSgj45qlTARXEqOeGMHn
	Z6hPLY8NEbkMHBpuU8OkgQ4xg+w+CNST5n0DOb1D1gdQLt33Bslnbbmlq86ZL03XtEqt6W3MeP/
	vPKH/yKR3ERdGOKGZFNWs3A4GfC2/REaZ4/FHWLaylG41IHR5jOzRQ8C2oKRWV6uzsUjhQZzfj8
	P4AhMLdSAY1n/7Yr8/AJYZMwNqR6CFCfIHCYAOPfmotf0uXZ4xiMIqPkdLmsvrGdyKbLLTvMcoK
	ZZ4ItRFT+FAixM7ofFEBU65/5bApbIQDb5UwYrs80/8hl/lFUpBwR66EYfLrWAojxdvoEvonoZH
	oAIgIPir2pJITzGlVM1QumpqVZPMcdmUHR2LmNjbVMrPoYPDA=
X-Received: by 2002:a05:600d:6444:20b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490c26e1acbmr46976175e9.12.1780670386590;
        Fri, 05 Jun 2026 07:39:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm168167005e9.5.2026.06.05.07.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:39:46 -0700 (PDT)
Date: Fri, 5 Jun 2026 16:39:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: sashiko-reviews@lists.linux.dev, Miroslav Benes <mbenes@suse.cz>,
	Shuah Khan <shuah@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] selftests: livepatch: Adapt mod_target module to
 pass on 4.12 kernels
Message-ID: <aiLfsDBUTgAu4x3s@pathway.suse.cz>
References: <20260524-livepatch-unload-on-fail-v1-3-7465de7f741d@suse.com>
 <20260525002416.3B3A41F000E9@smtp.kernel.org>
 <0f269520407c8cfc554059ffcba45ef3220ecfea.camel@suse.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f269520407c8cfc554059ffcba45ef3220ecfea.camel@suse.com>

On Fri 2026-06-05 11:05:32, Marcos Paulo de Souza wrote:
> On Mon, 2026-05-25 at 00:24 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider:
> > - [Medium] The `test_klp_mod_target_ops` structure omits the
> > logically required `.set` callback, exposing the kernel to a NULL
> > pointer dereference during module load.
> > --
> > 
> > commit 532c1b8c7438f534fd4e3440716ede6cf83efe1c
> > Author: Marcos Paulo de Souza <mpdesouza@suse.com>
> > 
> > selftests: livepatch: Adapt mod_target module to pass on 4.12 kernels
> > 
> > Use the stable module_param_cb API instead of proc_fs for exposing
> > module
> > state. This approach is compatible with kernel 4.12 and later.
> > 
> > > diff --git
> > > a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > index 9643984d24022..1382a266825fb 100644
> > > ---
> > > a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > +++
> > > b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_targe
> > > t.c
> > > @@ -5,31 +5,29 @@
> > [ ... ]
> > > +static const struct kernel_param_ops test_klp_mod_target_ops = {
> > > +	.get = test_klp_mod_target_get,
> > > +};
> > > +
> > > +module_param_cb(klp_mod_arg, &test_klp_mod_target_ops, NULL,
> > > 0444);
> > 
> > [Severity: Medium]
> > Does this code need a .set callback in the kernel_param_ops
> > structure?
> > 
> > When a module parameter is passed during module load, the kernel
> > parses the
> > arguments using parse_args(), which invokes parse_one() in
> > kernel/params.c.
> > Because parse_one() unconditionally executes the .set callback
> > without
> > verifying if it is actually defined, omitting it here leaves the
> > callback
> > implicitly initialized to NULL.
> > 
> > Could this lead to a NULL pointer dereference and a kernel panic if
> > someone
> > attempts to set this parameter during module load?
> 
> Indeed! I'll send a v2 addressing the missing argument. Thanks Sachiko
> for spotting it :)

It should be perfectly fine to use NULL for the .set() callback.
It can't be called because of the given permissions 0444.

We should teach Sashiko about this ;-)

Best Regards,
Petr
