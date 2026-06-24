Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA12D238F
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782318451; cv=pass; b=MQuOpKBGrgFpYDL/W9i6CQXb99d3UK67cYUDhcs8iCv9lx82m9zTXiDYeb8r0DrIte6zu91Z0DWsiCgTGCIlWCrG9nVkhZjVKok58UczFJ1DRB0lJhs8YqKNtvGILBmL5tD1PrueIkQUMSkBbkVqnT/6kvoIq7TgyWsNXwDXC/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782318451; c=relaxed/simple;
	bh=+iyovmhXQPWmNJFHRUJTlrkiAh6j0El9YZ94aJpibP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F40P5GQZ437eycXPCwLcEhGa3vc7eB5K0pDX7/jPEFTOf0TLw2Zvr7r4iM04vpCZkVH6b9MfwRTHQqDyvLBTARyNc4wKJal2fCQtJjB3l/95PriSRoM2xziKH6WvMRnn5BnXXxpqFbPU97TDolQr+61Evvd+DL6MJLrN7T+1Zog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vuYE3Khk; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vuYE3Khk"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-519ed52bcc6so339411cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782318449; cv=none;
        d=google.com; s=arc-20260327;
        b=XR3JLWAQzZyLz+liyB1dYdUSj06XHpUjmGZheWrxjweyABy/lwEjamCf8vu6i29wQX
         Ee6fdLvxMquIeEJxX1K94jgimBbilovMGL/lltteHX4VB/fa6JIUXWwPxmq1d8Xf9ss3
         +R/iNwOJij4fz7Jv1J7VnU0kDoIOLNGqFxJ1S7NBknrzaqTXaz5eUjJnUs2Mf/3UA58y
         CydcpLH86Re6KO7Ay1gYfkM5gSqVJVwFhzv/u4jaASbAOO4it7UIkxXeUUM6TpLuMKTH
         OuDqe6IdroZX6WFmxDMihMQ6KXdryik5Ls5L2mkNyKhDee/+WcouXZmhq0Dhfwg6z0hX
         Ftbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ARfU5T+Qw/ABRfv4KZaV88/2BHUdyOwkwS1gP1VtOU=;
        fh=R6J4xuuuNZSIIg63Fi6as5m6BSujSktu/qjE02w42Fg=;
        b=s9QfkidnJ5m8Pw1RgwI+aw3DJW8ynB6ZrXZKgdUxqnN9v5+T6bQxmaJULKQB1ucRlL
         ijE+vepgGpjy6S6NXXEfers/nSVozGdB74e7C3pNt5+0cUBsB8XbWIkNNO3kUZNiJSFz
         NcM7Qx4xQ/xirTnpT/UrmdkffUO1Ux12eoAAxwwEHCz2zQ0bN8TrFkJSrPdwbbRDRgM9
         vlR8JPDvGJm7y9BOHfoi3U/FJdRF8y8fDy5nnsiHOHDzwJKmUgxWEvZU7R5Q9kShqfqU
         J/OuA/+f69TRrEDsLMCDzM/UWeyRx3xD49d5dJ7IkV1R2UBTRbMN+MQldbbklSKpgBXf
         dGsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782318449; x=1782923249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ARfU5T+Qw/ABRfv4KZaV88/2BHUdyOwkwS1gP1VtOU=;
        b=vuYE3KhkiNbSbO953HHQuSNTGX1o7njSg2IlVuDSHeJC1ctdixlruBKMZCTXR3Kufd
         BQrIPo+fWVt2ThRvCR2SZtRXpH3KLaLFH8AGgXxbliJuvLP7LDQY3K/VQIj+WpebqhYU
         u5eOmXRKS/+UrWYHOiF9TdrsSwo+GkeN0Tgta/RJJWMxF5AQEM3DTVmkM25rur9kcCc2
         qlMHq9fZ8O16yph3Dben2In6yqC7TCU1Du6plJDNQ4h23u/lqh1Z6TexEPCReBfL8OQE
         anAzS/pAdPHIRx9AAbyQZjw4N1QovjygOZST1vFvTRNId5ET+kfrz/b8gg8Tsfltw192
         CbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782318449; x=1782923249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ARfU5T+Qw/ABRfv4KZaV88/2BHUdyOwkwS1gP1VtOU=;
        b=cXjrEFCEDPZqDFmiHG1lq3T4TklgGiIPP1S0jIJ8MtOg6KbXTs0hXBMJ+pXlyvII1P
         Qt7uo16tQg1Do1l716VimgjB5oKEflJdLvdt4AwkDtZ6+8Cb94aUmyzrl5Nr96WZsNfu
         5/bWfnI4eH1TlXxEECKV9eWELysK+2JWgs/C053jK4JwmQgC2AJogNeRbljui1f3PZln
         9N32FC8gjIBpJjveJc8cTITD3/3sTAisSwy53IrMGs/btyXbxFKSOVCJOmbVsLT+Ra4n
         DZcBzGxEtNShr0N5+HMt5qJ9wBgD007qih4I484hAjAuqCRiV1C4a0Ohq5GByO1Wy+ei
         faSw==
X-Forwarded-Encrypted: i=1; AFNElJ9Pvm3vWO1PJOvvH7hH8nCtbsuX9v9m0odk88kTeTeEYqCjgct2zQB66XNYlO0WGdoVdApfIT2uneNZpKNHk54=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxba4+w65mU41rdjCD8qu/Ht+ZQlXI+wU44veQfNozMtCYSAiYU
	+Zyt5dfu3ML6Sa0tLbGNRy07X0SJ2IIDu2VrJ2NouIdTVyYYiQtrOlr/2Ofdgb6rcpzk67LJeKo
	WpeeS6lmJ1cteESQUHl7ZVkw9pPYqzw3fLEv7su/k
X-Gm-Gg: AfdE7clU5RVcC+UDVJ0x2TN4byCzqoEuhttRoT6WdLIvVSmOC6aQcHs6LLWNaSg6EcI
	JZtSLTXMl0O7zbz1DOPwN5pQJia5pdOtUzZLm0msCGZ4G2B7UxFPS0X3F3x7NnNCc65zP9XRB5B
	8CtgqyDlJWN2xXQpYjjDygTAi8W/cUxteSmUzKt6g9aYH9jVZYEDkN9HiP7fkW37Hkk/7e+9eer
	UtTntNAzODprk75E1xclS25CjtYMBxUC8xCE0E/AlLVqX24Eah65PCGmBiC7gXerW8T/G1AwAYI
	AfkZyu+QGpTamZYpHcqWVfTf+Fs=
X-Received: by 2002:ac8:5c83:0:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-51a61629645mr11861071cf.6.1782318448634; Wed, 24 Jun 2026
 09:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622-alloc-trylock-v2-0-31f31367d420@google.com>
 <20260622-alloc-trylock-v2-12-31f31367d420@google.com> <20260622102105.53D141F00A3A@smtp.kernel.org>
 <DJFJ96IPBX9H.33CCUBF385H1W@linux.dev> <037178f2-bd9e-4766-8df1-0881e2eee9c1@linux.dev>
 <DJGBNRPIEYRP.1XDOBS7YGKO1P@linux.dev> <1c86fa84-6c9a-4004-9466-c78f036aeee0@linux.dev>
In-Reply-To: <1c86fa84-6c9a-4004-9466-c78f036aeee0@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Jun 2026 09:27:17 -0700
X-Gm-Features: AVVi8CfmH3g5_CMkyns7KSWcZ6iAiDyKBUNGK8QZnlEZrzsSs7MKALsfGxSD26M
Message-ID: <CAJuCfpHAMaK2sZYSgS750CvgksCKEfOmLzZasXdBup+CrS-3Pg@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] mm: Move __alloc_pages() to mm/internal.h
To: Hao Ge <hao.ge@linux.dev>
Cc: Brendan Jackman <brendan.jackman@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, sashiko-reviews@lists.linux.dev, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 2:40=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
>
> On 2026/6/23 17:30, Brendan Jackman wrote:
> > On Tue Jun 23, 2026 at 6:50 AM UTC, Hao Ge wrote:
> >> Hi Brendan
> >>
> >>
> >> On 2026/6/22 19:14, Brendan Jackman wrote:
> >>> On Mon Jun 22, 2026 at 10:21 AM UTC, sashiko-bot wrote:
> >>>> Thank you for your contribution! Sashiko AI review found 1 potential=
 issue(s) to consider:
> >>>> - [Low] Missing EXPORT_SYMBOL for out-of-line alloc_pages_node_nopro=
f() causes widespread module linker errors.
> >>>> --
> >>>>
> >>>> commit 42f7742177beb0066c00a7aa081250feb5859171
> >>>> Author: Brendan Jackman <jackmanb@google.com>
> >>>>
> >>>> mm: Move __alloc_pages() to mm/internal.h
> >>>>
> >>>> This commit moves the __alloc_pages() family of internal functions t=
o
> >>>> mm/internal.h to restrict them to the mm subsystem. It also moves
> >>>> alloc_pages_node_noprof() out-of-line into mm/page_alloc.c since it
> >>>> depends on __alloc_pages_noprof().
> >>>>
> >>>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> >>>>> index 36f0d625a4390..38238203ef7b0 100644
> >>>>> --- a/mm/page_alloc.c
> >>>>> +++ b/mm/page_alloc.c
> >>>> [ ... ]
> >>>>
> >>>>> @@ -5419,6 +5419,17 @@ struct page *__alloc_pages_noprof(gfp_t gfp,=
 unsigned int order,
> >>>>>    }
> >>>>>    EXPORT_SYMBOL(__alloc_pages_noprof);
> >>>> [Severity: Low]
> >>>> Since __alloc_pages_noprof() is no longer visible outside of mm/, sh=
ould this
> >>>> EXPORT_SYMBOL be removed?
> >>> Yep.
> >>>
> >>>>> +struct page *alloc_pages_node_noprof(int nid, gfp_t gfp_mask, unsi=
gned int order)
> >>>>> +{
> >>>>> + if (nid =3D=3D NUMA_NO_NODE)
> >>>>> +         nid =3D numa_mem_id();
> >>>>> +
> >>>>> + VM_BUG_ON(nid < 0 || nid >=3D MAX_NUMNODES);
> >>>>> + warn_if_node_offline(nid, gfp_mask);
> >>>>> +
> >>>>> + return __alloc_pages_noprof(gfp_mask, order, nid, NULL);
> >>>>> +}
> >>>> [Severity: Low]
> >>>> Does this code cause module linker errors? alloc_pages_node_noprof()=
 is called
> >>>> by the alloc_pages_node() macro in include/linux/gfp.h, but it does =
not have
> >>>> an EXPORT_SYMBOL.
> >>> Yep. Doesn't show up in defconfig but if you set CONFIG_BLK_DEV_UBLK=
=3Dm
> >>> then:
> >>>
> >>> ERROR: modpost: "alloc_pages_node_noprof" [drivers/block/ublk_drv.ko]=
 undefined!
> >> I was about to report this linker issue myself, but Sashiko caught it =
first.
> >>
> >> While testing your patch on top of mm-new, I hit the exact same modpos=
t
> >>
> >> undefined symbol error as mentioned above:
> >>
> >>     MODPOST Module.symvers
> >> ERROR: modpost: "alloc_pages_node_noprof" [arch/x86/kvm/kvm-intel.ko]
> >> undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof" [arch/x86/kvm/kvm-amd.ko]
> >> undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof" [drivers/gpu/drm/ttm/ttm.ko]
> >> undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof" [drivers/misc/sgi-xp/xpc.ko]
> >> undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof" [drivers/misc/sgi-gru/gru.ko=
]
> >> undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof"
> >> [drivers/net/ethernet/amazon/ena/ena.ko] undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof"
> >> [drivers/net/ethernet/amd/xgbe/amd-xgbe.ko] undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof"
> >> [drivers/net/ethernet/aquantia/atlantic/atlantic.ko] undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof"
> >> [drivers/net/ethernet/chelsio/cxgb4/cxgb4.ko] undefined!
> >> ERROR: modpost: "alloc_pages_node_noprof"
> >> [drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf.ko] undefined!
> >> WARNING: modpost: suppressed 14 unresolved symbol warnings because the=
re
> >> were too many)
> > FWIW something like this happened on a previous patchset of mine, and
> > someone was like "so you just sent patches without any testing huh?" so
> > I just wanna note: I did test this (see cover letter for details) I jus=
t
> > don't bother with modules!
>
>
> No worries, this is quite common. I've run into the same thing in
>
> my own work =E2=80=94 missing =3Dm configs in test builds happens to ever=
yone.
>
> It doesn't affect my testing of this series.

Building allmodconfig before posting the series is a good idea. I was
bitten by this enough times that it's on my pre-posting checklist.

>
>
> > Anyway, this is the 2nd time I've sent a patch that breaks the build of
> > CONFIG_KVM_INTEL=3Dm so I guess it's time to add a new build to my test
> > scripts :)
> >
>
