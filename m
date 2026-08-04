Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D7480DE3
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 20:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876208; cv=pass; b=VcElpGfeE+TRolu6+vkCCBKL3+1KOUOwtoUWnjlD6HSTFmvyBiGggmdG4/n1kDK9FwkYaOJrHzngUV20gAHV633vimoJZRxgzDMniPTYKo41/cLixkfGj/pbijJyF5tjeBJCPSzk1Ptr55G387kV3/mBdXrjl1HAGynNcBSi/oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876208; c=relaxed/simple;
	bh=BRgrRn1zPowjhwOLiaZSOQPLt15cU3xIhb+EGJfhcQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nH5GB0xTXhcIoRbWc0tU2r46x0awb/VAx8BeVv4I7RlmAM1gcKMPahHlV6pysyvZL5uw289Rn2ikdWZPytpKSEgUDejnD/MEqPHLk8cFaI/hq1dErycx0ngaXQSqa0nZ9dBx/srRt3/IxQVR7e2c0StAXsYT+6KNRQUYOD/6bLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/yZYEvY; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/yZYEvY"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so164985a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 13:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785876205; cv=none;
        d=google.com; s=arc-20260327;
        b=GQYQkli6qkzGgnWMQVCiKXwChQ7UqX+xd6duA2Enu9uhEDcYItIy/V9FW9bU4x/fw6
         vYSSQjabj+rnLqr40J04CYPtIuUvHwOGr3yeKRJXDXF3nk+BETO7lGBMB06nnOu5PxpC
         EXWR/kL/PNtAFEED7vGSzh46VHOJFyhaIiEyZeZDmF1MAd9JXLJbzoQtyiXAXOMjtgse
         VdUfne1wYBhrVU8Art5DPeVh/O+kiRuECIdjKIFb5HQ7ZoKJ8ttfcKmmycVNRSg0Cx/+
         cHfxJ2Xi8WJ/6flQpULj92mA21fdXObYY6zoCG8lK0SMYpjNj3Vo2EZ5kOEZCZ15iOMH
         Dldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cxavE2HhwRG9KnyTUo+TV6fM8Yj2zo1+iL7/LTIuN3k=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Qk2kUQYCgJNFcSDS/zyRY06xkovTLtCzIN5Z35z+5dUYr0HX2GEUSWGmPtcgWlz9tR
         pdRnLAxTTsFrPVYdALR/jywAPHZ5mlSHs/VpEtci5BCh/vLzpwdNg87chIzyfgu5kGV4
         cITpzbm9WMis+ITC30/1tdffJn5NWYiZ8STqTcle69VfD2izSo9GbQhjxmaIah1dZrEm
         CofvxWzzAOj7dKxK+I1IEYZN/VZjl/1jhnszyD7UL+74SRwuyXszFS3VBtvyKDeKXuI6
         G2dMhH+C/x40ViZGNOkHDK0WAXCa9jTRUP/udEIX/Gir3p6TPApXFT7No/MYX+zfcJaa
         Su/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785876205; x=1786481005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cxavE2HhwRG9KnyTUo+TV6fM8Yj2zo1+iL7/LTIuN3k=;
        b=i/yZYEvY/EFpS8uHKKq9RBw0NmCxZKFWcik5kgsUEfWdcJfaUy0r8fQDmK22nPv2Hw
         4OB6lZw6RjbZLJ8xmhv+7/g05waLVknlO5w1WGIvFVveooVXqGQhbUnQhNd/9V5hwjWq
         TIJHyrYEl9QO0svVMO6rrM7pKXSsvQHDDvhgDHW0EkQAqO+EMFtsvYAPa7sqq0AIkBuC
         26tA6Bm/emLimganpMgaUSRuiDQvf+T34e+AwJAZN58kgPD2aX41Qq3XH1mYpkJAd5dl
         19zsoGXcYk7tbjJZ5l+I/oHH+vlenqAk/UKAa+H/ANrLl48sn5Rmon2LXZLlycDpHahS
         bSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785876205; x=1786481005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxavE2HhwRG9KnyTUo+TV6fM8Yj2zo1+iL7/LTIuN3k=;
        b=ViAimbD8J3E0jRGWxIRHZTxorKDjT0lTtqguwXdO78Bt2yDBGkLlTLkZzqmqQbzotj
         Xep6M+CvAKkTnOZ4BFrfJlJGDENSSfUDnzm5G3mFdDeKqWojJpLylozArzrMBP0G0nQq
         92aW+pwjAREYcQn4ZuQ/3+t842PlyCEN4HdfYxxDGrjE+wtuyNT5IhOsSbi3TXuAA+Wm
         e0+aNS9+CQ1NDcV3GiQPFIfE0cJaRhswwv/Q9LYMGYJzi+MS3CQKE6SZ5x4ECqQSY0Ro
         4DUBtpjEezkoFGPcwtAvKyoeQNXkSkM4Md1+fFeUqRTdZyhiQUBAMsaFVDJrqRfBFXau
         wBrw==
X-Gm-Message-State: AOJu0Yx4N2lIWZShcQ5ew9ivnUgt7XjZdRMcr2p+Mcm3MUU77/sSIUHO
	m/4P6Dye1lyzGtzD/dckaRGfuMbavMmbvQckn5EKu96TInTyGmrJV+ljWjD9L7MX3Z5PM/vNbqA
	xMLMGEJ5EqGOGkwZ773DYqAS1fc61OD+5KdRy+MTq6A==
X-Gm-Gg: AR+sD10OIUVdkKQSsECZQ3zp80B6qfy/RVc5TEOhmEAcMATgg9EmHB5PLCY4vZFNhhd
	RzGeILBGEjZCO4p0Ag9F4xKMKshy1v8lLBu8vktgnKWtWmar7mERSw0ZDgJpBdHAHtSrmuqGWu4
	JkdozW9V7rSGK/HnDPaWGuBEkZ+ls3uIQGjkiwVRdFs7BqudWlcvVHtCn2fWDSJZJSwVjf//umK
	ln/KB4vlJub8iZYU9KWmdtv7DzRwnuhhrPt5g+qs2UpYBvHxyorAPQazwz8gd9j5nRtn8tWOYPU
	UQnbMlKF/VZSDhtpZbRJ5miGb5YjNadwkCCJZZbGmRgaABFaRQUECH1/hzTxkRSodto6t951ksc
	GKbLCO7922k96rg==
X-Received: by 2002:a17:907:c14:b0:c16:831c:427d with SMTP id
 a640c23a62f3a-c2039c4af80mr75671666b.21.1785876205109; Tue, 04 Aug 2026
 13:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724042600.175440-1-nickolay.lysenko@gmail.com>
 <20260724042600.175440-4-nickolay.lysenko@gmail.com> <20260724043556.BEB5A1F000E9@smtp.kernel.org>
In-Reply-To: <20260724043556.BEB5A1F000E9@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Tue, 4 Aug 2026 13:43:13 -0700
X-Gm-Features: AUfX_mzjJZj_ihZ8k57XSsgXGRn0MQWZhAkomNBddo_NaicC8B0PWbUw5MsZ3e0
Message-ID: <CAMtxOX1rW=piosQaHrbv_fTLGHf3QSgMEWnsSE0hO8FJFDf1_w@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v4 3/3] selftests/bpf: build each test runner
 instance in its own sub-make
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct - the message was stale (the derivation was dropped in v4 per
review); wording fixed in v5, no code change needed:
https://lore.kernel.org/bpf/20260804170156.1709916-1-nickolay.lysenko@gmail=
.com/

On Thu, Jul 23, 2026 at 9:35=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit message claims that light-skeleton demand lists are=
 derived dynamically, but the implementation retains hardcoded lists.
> --
>
> --- Patch [3]: [RFC PATCH bpf-next v4 3/3] selftests/bpf: build each test=
 runner instance in its own sub-make ---
> commit a1ebeec9064cd1ef457a1d6c67e818e26521e31b
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
>
> selftests/bpf: build each test runner instance in its own sub-make
>
> This commit replaces the double-expansion test runner logic with a
> Makefile.runner script invoked per test runner instance. It aims to simpl=
ify
> the build system and fixes a latent parallel-build race condition.
>
> >     standalone binaries and the kselftest lib.mk contract - and delegat=
es to
> >     the runner through explicit per-instance rules. Light-skeleton dema=
nd
> >     lists are derived from the tests' own '#include "*.lskel.h"' lines;=
 the
> >     bench object list is derived from $(wildcard benchs/bench_*.c).
>
> [Severity: Medium]
> The commit message mentions that the light-skeleton demand lists are deri=
ved
> dynamically, but the implementation in Makefile.runner retains the hardco=
ded
> lists.
>
> Was the dynamic derivation logic dropped from this patch, or does the com=
mit
> message need to be updated to match the code?
>
> For reference, Makefile.runner still hardcodes the lists here:
>
> > diff --git a/tools/testing/selftests/bpf/Makefile.runner b/tools/testin=
g/selftests/bpf/Makefile.runner
> > new file mode 100644
> > index 0000000000000..ced44aad7eded
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/Makefile.runner
> [ ... ]
> > +LSKELS :=3D fexit_sleep.c trace_printk.c trace_vprintk.c map_ptr_kern.=
c        \
> > +     core_kern.c core_kern_overflow.c test_ringbuf.c                 \
> > +     test_ringbuf_n.c test_ringbuf_map_key.c test_ringbuf_write.c    \
> > +     test_ringbuf_overwrite.c
> > +
> > +LSKELS_SIGNED :=3D fentry_test.c fexit_test.c atomics.c
> > +
> > +# Generate both light skeleton and libbpf skeleton for these
> > +LSKELS_EXTRA :=3D test_ksyms_module.c test_ksyms_weak.c kfunc_call_tes=
t.c \
> > +     kfunc_call_test_subprog.c
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724042600.17=
5440-1-nickolay.lysenko@gmail.com?part=3D3
