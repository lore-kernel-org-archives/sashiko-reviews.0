Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF09423798
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 18:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361920; cv=pass; b=i5CdM8priEwe/yue2CUfxdWE2lD7fQO5XRhocMm3BYyDqT1AWlfMjMtsQLEa7LhLmMXS6wGIlopS5AGrKYMP+A6XlC0crieWNBLS/asOXPF+EOBrOLim0PgJK5lAxYkdJ+mF5UREe8abwlGfZ9wOYbJnjKlihhmBdG4BL4MHs0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361920; c=relaxed/simple;
	bh=i3n/pZjO11b8FZrngtzK4vjoUhf/PA1KucrD+egnHyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GE044ly6zJG1y7W1zpCnAaD6lIQGLy8ZEw+kEjXe3l8f4EG6zrMvDfFzsB3VwIPwc8pATwulG2hBy25j3B6WcHQRMTkYQLmdd2RoZk7GarmYjNN9a/vAUZm10s7oudCXvxgjPEbHtmhK2w7PBGg/5EjGD95/KoPYszsg2d6IU/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o99rbZEl; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o99rbZEl"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664bb15d05dso4644446d50.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 11:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783361918; cv=none;
        d=google.com; s=arc-20260327;
        b=i4/SIt10IC830eYSmErLzVxL5DhP/sPhi/4ERT1w69VUrUGQkLtRyGHSiGkWe2fXpp
         yiSWCeLg23f+7tNkmMt5VuDlay4c5FlF/YMqQfKpuv5ixT5knW4siRrlNv1oU0MV9goS
         +i+J7fo7T2zfpl0zC9ZFBs4LdpKuz0HIShRfyzD9nNuf2o7+xGuyu7uNKlpx33ja1nJN
         sP/AoDhMAiXDXKSdYvNrc5CQEZyXPwgtPuRG7xVDQm+S8bBAKgOfJtAQjvrcFlt28N2V
         g3EM5KUozQsBPp0S0tmI/DyOTcJnKVgg27rY5sgmqcEmCbLBL+j/HBSZSDgr0COlOgcH
         3Jbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gbuqyH3I898LEQWDxhl/FzpS6xH0Rf6DtxQG5lLXLNk=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=iWHFs1BNCJlVRIraW/Z/Key+TNDMYCzpmS65/9Swv/qmw9vheifrtbRWA7/q0mRHlY
         LQ11sIggOsZZfVLmyMTEA3b6QoIBbjicww90lzxZWxcBjV7j0gAmNJGuGS44aSkKX0mI
         +snQMaJRnlPeueKXW1USgFKxjOPEfyXopCdbgG0wIQMO34hAQk/khGmiJ6uYwQ0No2Bl
         Db9IBuOdF9m7O+zVrz8fqBmdPQedfwBVvRtDDZq0VLD3KD6OgkxRL5Tbk51hv26cIHYs
         LprFPutrx86eWqeSE9dGZwLMXjGyjSoLIQxQQP5hvpxYsge8G1ECZ//R585ypq7OllaA
         GjmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783361918; x=1783966718; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gbuqyH3I898LEQWDxhl/FzpS6xH0Rf6DtxQG5lLXLNk=;
        b=o99rbZElfq/E+HNyKSTeVdyb/FpSc5vAdBdZH163bClQC6oO9BZnz6nYewVSQUnlIk
         40hC/omG2nRtPtqE8PdM3yrWo7noukrtoehjQcq2iXh9ZVe3AHPgEDRCJu4HKgII/7A4
         jnvr9WXNpC4aEoqjax/XfP1tItWEYozDq21OZwggkYJg5h3Ruk0uizDdgJPJEWfnQB48
         ecqIfZY/rbYCVl+tIr+7h1CSnhR+He3GMcHuPynuzxYaQsfvIeAUPkTNEVkmbX3zm+kF
         i0+aH3bLx26GqOuSfoiKk/rsr7kF/hAdu9BU9tp9PJ/1N/Hosna3IejDHQAot5gX+nov
         +Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361918; x=1783966718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbuqyH3I898LEQWDxhl/FzpS6xH0Rf6DtxQG5lLXLNk=;
        b=B+Cbek75igOl1gxu3K71HOCaVyG6M4FnrloDmHmwo3hmgKiu/i0Caqbxf2vGltr+NA
         268Xqvg9miDa/2rEdXvW3ULoTsPdK6U3a+iRhlfEPaoUzXyjCUSsONfKLtyzIFVW2P00
         5aQVh5RNd+aY7APl77o+GgLHfS+ZoBjKbFjsPQNRTMmvvYS1tIGE0jYekSdL+Nl3gRXi
         MogVVEyVzWxqKdFQFdxWsusF3OzNgvRuZjPutnKd/kczdjhgJDgdXvUIt8t+wEG2X2QH
         T8kvTMl6Jgo3D0fPhf9XIzmYuuJLoKO3CUdSZOqqtOX5Kephjr94WKhG5EqOCXm6NSeb
         BPnA==
X-Gm-Message-State: AOJu0YwZgBfFr4dviKRjMYDEg852Hk+gTF0juyVzGqBwihunB8X9qgod
	K/AmXXekVAXAzEjJBweC+XBar2JMGJjpMSdm2Lb5KkMar5J/FDDrbBpR+GoCcchp5cxuv3Y/WsM
	3cyPPuQH9F41aUP64T4BBAvYvXPhj09mfyQ==
X-Gm-Gg: AfdE7cnxI3i9lESyG6o7RUkH/mGUUfSPmhKUjgnGMVvcIHJaqXvbjJzCHfps5+67f7f
	0l+vOFmxK87u0UOKdBhPp4f5NhtOzU1ybFIeP6Hya50rU+5qBOYXvDd3zxZeCxIgy2vYQ5F3bZj
	3FJvXx4X8U57x4sFsPWNeE7lkNNaHFiprrIeb9s3Lh9hTQ/SWaP0Lon20rKK/wZEuVWXsB12BIs
	PYKyQCjLfnPyNkGTekr+1oYFRFfxy3YXzo70d05WGDLpquB8iJlfku4GsTSWXMKLRxsrNsv
X-Received: by 2002:a53:d34e:0:b0:664:f064:f66b with SMTP id
 956f58d0204a3-6677fb7cdfbmr1163754d50.26.1783361918169; Mon, 06 Jul 2026
 11:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706171918.317102-1-ameryhung@gmail.com> <20260706171918.317102-16-ameryhung@gmail.com>
 <20260706174721.14CE21F000E9@smtp.kernel.org>
In-Reply-To: <20260706174721.14CE21F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 6 Jul 2026 11:18:26 -0700
X-Gm-Features: AVVi8CfeDjKaihLzFTjCW1uH4GWTKlKUD96ZQGIhYLxEV0t3QQ8NK0F3dtWBtwY
Message-ID: <CAMB2axNUmeYi9nvRQPhLn-CEJACr4CfOXTHWzTW=HWst58MqBw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 15/15] selftests/bpf: Add test for bpf_tcp_ops
 header option hooks
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:47=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Multi-line comments in the new BPF selftest program do not follow=
 the mandatory BPF subsystem comment style.
> --
>
> commit 0974a803b9e5fed2b4e8c0c5360735a19cae9901
> Author: Amery Hung <ameryhung@gmail.com>
>
> selftests/bpf: Add test for bpf_tcp_ops header option hooks
>
> This commit adds a test for the bpf_tcp_ops header option hooks. It uses =
a
> struct_ops program to reserve, store, and load an experimental TCP header
> option to ensure the parse_hdr, hdr_opt_len, and write_hdr_opt callbacks
> work together correctly.
>
> > diff --git a/tools/testing/selftests/bpf/progs/bpf_tcp_ops_hdr.c b/tool=
s/testing/selftests/bpf/progs/bpf_tcp_ops_hdr.c
> > new file mode 100644
> > index 0000000000000..46618a604d965
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/bpf_tcp_ops_hdr.c
>
> [ ... ]
>
> > +SEC("struct_ops")
> > +void BPF_PROG(test_hdr_opt_len, struct sock *sk, struct sk_buff *skb,
> > +           struct request_sock *req, struct sk_buff *syn_skb,
> > +           enum tcp_synack_type synack_type, unsigned int *remaining)
> > +{
> > +     hdr_opt_len_cnt++;
> > +
> > +     /* Reserve TEST_OPT_LEN bytes; the helper decrements *remaining. =
Stacks
> > +      * with other progs in the cgroup hierarchy.
> > +      */
>
> [Severity: Low]
> This isn't a bug, but does this follow the BPF subsystem comment style?
>
> Multi-line comments under BPF-related paths should have the opening /* on
> its own line.

[...]

>
> > +     bpf_reserve_hdr_opt(ctx, TEST_OPT_LEN, 0);
> > +}
> > +
> > +SEC("struct_ops")
> > +void BPF_PROG(test_write_hdr_opt, struct sock *sk, struct sk_buff *skb=
,
> > +           struct request_sock *req, struct sk_buff *syn_skb,
> > +           enum tcp_synack_type synack_type, __u32 opt_off)
> > +{
> > +     __u8 opt[TEST_OPT_LEN] =3D {
> > +             TEST_OPT_KIND, TEST_OPT_LEN, TEST_OPT_D0, TEST_OPT_D1,
> > +     };
> > +
> > +     /* bpf_store_hdr_opt() takes the program ctx (the kernel reads th=
e
> > +      * outgoing skb from it); it appends after any options already wr=
itten
> > +      * in the reserved window, rejects duplicates, and confines the w=
rite to
> > +      * the header option scratch. Stacks across progs in the cgroup h=
ierarchy.
> > +      */
>
> [Severity: Low]
> This is a similar style issue. Should the opening /* be placed on its own=
 line
> to match the required multi-line comment format?

[...]

>
> > +     if (bpf_store_hdr_opt(ctx, opt, sizeof(opt), 0))
> > +             return;
> > +
> > +     write_cnt++;
> > +}
> > +
> > +SEC("struct_ops")
> > +void BPF_PROG(test_parse_hdr, struct sock *sk, struct sk_buff *skb)
> > +{
> > +     __u8 opt[TEST_OPT_LEN] =3D {
> > +             TEST_OPT_KIND, TEST_OPT_LEN, TEST_OPT_D0, TEST_OPT_D1,
> > +     };
> > +
> > +     parse_cnt++;
> > +
> > +     /* Look up the experimental option written by test_write_hdr_opt(=
) in
> > +      * the incoming skb. For an experimental kind the search matches =
on the
> > +      * 2-byte magic in opt[2..3]; on a match the found option is copi=
ed back
> > +      * into opt[].
> > +      */
>
> [Severity: Low]
> Here is another multi-line comment that starts on the same line as the op=
ening
> /*. Could this be reformatted to align with the modern BPF comment guidel=
ines?
>

I will fix the comment style.

> > +     if (bpf_load_hdr_opt(ctx, opt, sizeof(opt), 0) < 0)
> > +             return;
> > +
> > +     found_d0 =3D opt[2];
> > +     found_d1 =3D opt[3];
> > +     found_cnt++;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706171918.31=
7102-1-ameryhung@gmail.com?part=3D15
