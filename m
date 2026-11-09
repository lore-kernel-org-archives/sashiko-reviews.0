Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232690;
	b=EnrgjgsFv2ME3a6v2VFTBmEzDKSBol1MRMmG238zwkCn9axK4EfrszUUQAmEwyo2z7E3
	 B6q5eKvLX7aw3X/UY6GtbDN4L+nPZx/gzZ9zHTIwjEnOoi5Ha7iDrG8iIk+llb9u2krvC
	 A1MT1KmoLSc8EVFzqkd6zlNXSelsGeqna13lkDSN5MG8H5SrZ64tTFHecyv7uG4MEX2Mj
	 /KzI1gilf4RFe6D1qbP3LFcj3Tssm0yWeRS6TSJ2sYocitIRrpXHo5KowNUd8Kvz8KOmu
	 J4sXuJBwMVcerjdBCE0WQuW+PCWMekR5nkN0JlTnglIEjAVo1OS9abosD5aRDoODq6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=dZDeE2xZH0nMQ26DQzLtMh8DKmBlzuXu6Jf57xM5sMI=;
	b=Uwq14mzp1Nhqul+CCnSbuEHPnmpmr9GuFjx5Xcv9T1LpbOFyIHJDpQR/XPglQEyOOMIS
	 YWSQjge//hjyNZ2Eu2x4agMAOBG12gTVqBjI8OFVYmK7Iyh4VRASwQnnA3pBl6H/6ZozQ
	 slZJVWKoFPmU8I6p+8sj/EdKCOmgUpVaEWvwqo34gBxKmX38uKQAkN62cwPwSTOLErOjw
	 LTuMAr5gOONpRXIq3nJTd2TQvWkFSaq2sruZJzBPCl+93kH5PzWgbeSrnsSMBeJaNUA0+
	 sST5KrD74T959sGHdhSCPJc/+VetdU0M8zvadjpGUNrGiVKWwUJv8K36FKl2lYX0DBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSyTer1w;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8D5606A332
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 13:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8D5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSyTer1w
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5091535e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 05:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794232689; x=1794837489; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZDeE2xZH0nMQ26DQzLtMh8DKmBlzuXu6Jf57xM5sMI=;
        b=eSyTer1wcHfU7p8wUJT4n42dSEUkFwE3SU3MjD7t0CamuACSxY+ERx261YyPZ16d0O
         N2lYg0ZCVNwvtmaJLVrOX1ny7W++uj0i8qxdD6O2O9RamaMrpm6UNtpC6NLAvQxMI9yh
         cfYJDoaAGYVCUFZ+Tg5tVX2M1WfV3AL+HaJCSRlMTaDezaLSkiTINClVgB7OuH5gsVgD
         bKolw9KTjfd5ZKyUQgOugvHY5M0leOX2Tjf7AxWUwc9GxavnBJlkm8DfZGwpd+FHAtHo
         LnkA/iFKtxFPnFNiOhmcAuYyj3cnDiuRAL2hRbfjV1/RwkqD2J86CoX/zMYfnfTRlBcG
         v7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232689; x=1794837489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dZDeE2xZH0nMQ26DQzLtMh8DKmBlzuXu6Jf57xM5sMI=;
        b=FqACbs2cRlO3dowTmmgNxe2jTCpZGGBvoaURkI5fxzzvrQmEyO5UKkNpgi9sIi9Qpz
         co3dZk3b86o04ZJ4/yzFn9328sVy3xFLCOQ4Oc8nGIKhI/sA0blm4cX1hh23mf3sTyZV
         YZiitvZgqYpHqi/axpCUllJ0Nt7agGd1MxCTg0HObuOz5x5uph63zWah1A3G4tzz1j9o
         pLaf0vV/AYw1gdToa2vptfZ9Hza1klhuU9vnX2ReFQrnIjJXnWwwoBM06K6KCgE55nZE
         9eyLeaMYIdFY8MhrDp1Q91a66WK4puqCfLAuYfW6p7j8uYdMtCGljqDSarEko0SS1B+m
         ZfxA==
X-Gm-Message-State: APuU4Z/8chQN5J8/jvf7W/hHjNoGDnTZowlAUpNSjeQS0Uz1zc84CT1X
	bBMH8xHf+wgAoPSIPdZXMPlIn3hQRTGvR8oYMzaQh3OfM6ucP6srAIVIxDcYxg==
X-Gm-Gg: AYBFou2kjPXqN09Mts+3DNC21zOP7YVTPW4f/fH9v8KDrZDfTKcrsnYh7YDZLgQtdxA
	g6yffIbGRdvF3JX84Wd9ATDM8o6W1i3FAUdEe3CHZk/owjZoQWaBF3qaKu7weCMiQy3t3TQKYw1
	dVLA/hqCngQu3Gabspr6s+pi6ZAobV4zSHgRrhVdal99PRlHan2LKM8AFauZdAEp1pqAKhGIM5Z
	kMCkVSJIyQB2SMnByXBgx7CQEYYZc9QhfCN60IGVrPuQIOf8KuhiSIxkUyhrKb5+iNmIPQTG5QN
	x5m5a0P0CnrE+yX9OMWGhicAi0PnPFygJtcvYPyZrE0bgAGL/FjZW3bSsIyX6tkM2SsPtl6LWr4
	Rb5SYkz4DXmKcX6YBNVHfuLV0OpyRVp6ODrASJgK/ET/yOzT3vFphPiphoN+Daf2CS7IyGMCJqW
	fVXOCcdv/JK3BlIw4EW3WjxfzDyQap8BkK6VUwIssHbZtWYOso9dxa2QuuKXnidR9Z2R3O39s/7
	mNKiknZdmfPsywlYyswnAhhZlTIE3mxhI6/reOhWfuLCLSmijs1x6zvE+QmYjcq/eXtnyMOhdbI
	4DxawTIAd7XU7Pxjp2xaVmBbZJyEkNFmcg7t
X-Received: by 2002:a05:600d:84ca:10b0:4b9:ff69:19ac with SMTP id 5b1f17b1804b1-4b9ff6919f8mr13489005e9.11.1794232688967;
        Mon, 09 Nov 2026 05:58:08 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32b46a3sm252430215e9.6.2026.11.09.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:58:07 -0800 (PST)
Date: Mon, 9 Nov 2026 14:09:42 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH v1 bpf-next 16/18] selftests/bpf: Test fmod_ret
 candidates found by bpf_scan_ir
Message-ID: <avHUJhNSgifusdtc@mail.gmail.com>
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
 <20261106210314.1767267-16-a.s.protopopov@gmail.com>
 <sashiko-outbox-202287@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-202287@kernel.org>

On 26/11/06 09:09PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] selftests/bpf: missing KASAN and KCSAN exclusions for
>   bpf_testmod_retval.o
> --
> 
> commit 628c6eb28eaac0eeb5e557c0b787a65b02cd6e06
> Author: Anton Protopopov <a.s.protopopov@gmail.com>
> 
> selftests/bpf: Test fmod_ret candidates found by bpf_scan_ir
> 
> This commit adds bpf_testmod fixtures and BPF selftests to verify the
> fmod_ret target tags generated by the bpf_scan_ir compiler plugin and the
> verifier's enforcement of restricted return values.
> 
> > diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
> > index 031c7454ce65f..475df9a7680ea 100644
> > --- a/tools/testing/selftests/bpf/test_kmods/Makefile
> > +++ b/tools/testing/selftests/bpf/test_kmods/Makefile
> > @@ -23,7 +23,16 @@ MODULES = bpf_testmod.ko bpf_test_no_cfi.ko bpf_test_modorder_x.ko \
> >  
> >  $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
> >  
> > -CFLAGS_bpf_testmod.o = -I$(src)
> > +bpf_testmod-y := bpf_testmod_main.o
> > +# The functions for bpf_scan_ir use clang extensions and need the plugin
> > +bpf_testmod-$(CONFIG_CLANG_PLUGIN_BPF_SCAN_IR) += bpf_testmod_retval.o \
> > +						  bpf_testmod_retval_strong.o
> > +# Coverage instrumentation makes every path of the fixtures dirty
> > +GCOV_PROFILE_bpf_testmod_retval.o := n
> > +KCOV_INSTRUMENT_bpf_testmod_retval.o := n
> > +KMSAN_SANITIZE_bpf_testmod_retval.o := n
> 
> [Severity: Low]
> Should KASAN_SANITIZE_bpf_testmod_retval.o and
> KCSAN_SANITIZE_bpf_testmod_retval.o also be set to n here?
> 
> bpf_testmod_retval_private_store() and bpf_testmod_retval_private_memset()
> use __attribute__((optnone)) to keep their stack writes and memset in the
> IR until OptimizerLast.  When CONFIG_KASAN or CONFIG_KCSAN is enabled, the
> sanitizer pass runs before bpf_scan_ir and instruments those operations
> with shadow stores and runtime calls (__asan_report_store4, __asan_memset,
> __tsan_write4), which bpf_scan_ir rejects as side effects, causing the tags
> subtest in test_fmodret_retval() to fail.

Added KCSAN and UBSAN (just in case, neither is enabled in tests).

> Sashiko AI review · https://sashiko.dev/#/patchset/20261106205523.1765622-1-a.s.protopopov@gmail.com?part=16
