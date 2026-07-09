Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EF32744F
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783627279; cv=pass; b=V1sRnJDAl8pY962tmcAtfo1wl1dAvSFmJGVa3Pxoa5iXHwxUHcQKy7NdnF0aqkKxArAxGV7SPWWNgz8d0RTmUUSRYy/HtPP+jb2jqvyyV74mXwaTntSKYxuzegTIvrt8Bw66MIHKEjLjA36bezqkLch+yWyLdYFwDMOP9+MF1eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783627279; c=relaxed/simple;
	bh=w17eX4Jkmr+FsItCPkabrTfffyNgjO4WCwf8MwfNxw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESrMyxZySt0G7mub5HIIplT74nfVHiRLwgE9hGhDJpvYUDDU1Ftu4pDTba610GxcXLsITM5LSM3ewRCB6N36VYNJslDpPMoKL0J8zlAh6xesegORzE7O2auS0ar9a0vs512N231giurkttKaFXiqn6neIycELeX5eJM4acj6SLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STtkdyrL; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STtkdyrL"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664b05d408bso182629d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 13:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783627277; cv=none;
        d=google.com; s=arc-20260327;
        b=cWQheqgWsoj2AD8j7+sA+/tp35TsxUT2ch8tqJgwtYuBsIj3bXDA2bH7Udke2Bvi6U
         K0davX6/FwtdSlnX1nvGXTNnB6elGEWyJBfdAkx3EmAM/vct7rdq+A7AUSXxH4jhXA2A
         YJW57iEC+GmbRkOfPRmOUr3cESguB1ATA3duHQUMl6OQIxQA19Xmz+6c09iheqKtoT9z
         4V+6KUd12yBIaDItSQfgNYCiHQ1zd6b3YSSFIZ5LWGYX5oaQ6Nxzig+icBftqVB2+Lqz
         qBE+7lIDCp/YvFf2T97+I3ni8AGNrOmZHOa6LrvYqYzctvLVxMPOHqC3pJhAnSrNhPDk
         TxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UdaAx5E3GxIJv4e+ntEXnbFwxYgeCSAWQNtuiLCa5yo=;
        fh=Kb14feeRohb+MBve+QPB5/D6iTh7BdvkG8FgaUbVQ1w=;
        b=p33euAUoNSyZj9SyJf472infCA+YigCC2GMkY8L5khmezxAAVoSRKOG7sRfM8/L5xQ
         WjJA86iUGEY3q/2B82V5Ib3M3L+gVZwJsI/3W+3HFcusAATHZw1fdvUbFlz2vFu6i+BF
         9f7omTTerhngpdqB0PG+om4v2do3wmUBtfKEwHZaFeGxtjgC3sxUw+O5YezuZ5W/DnAU
         dJgnl0b0aLsM2RyaaXEP60sTUbEcg4PRMupbz+gRQcNL5YscmtArG1QfwumW8qiIv9pU
         PsjAQ8B65J2ealbO5PhbtBnnZgJFvTbyMOn4B3VxIk6gfvaOeg8ZBeDVVrs4cZOY4n3K
         h8RQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783627277; x=1784232077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdaAx5E3GxIJv4e+ntEXnbFwxYgeCSAWQNtuiLCa5yo=;
        b=STtkdyrL2xGC3D2VjjBG1PiUVgQk5W5HH4fm5lJcZWcdGMboNR076JjWKKxl6hDfmX
         grmry2+cpU9QMwRtMXoKWdDXFOh/mgC2Og/+U2YwXRzDOogq58sE53HUrDuwF2BwdJHJ
         hcN1VH0Fu1nDWCQGKQP0HzPbTa6CzmThTWm67RRQk9quai3DbSjXIfzBeP4esav/gFa+
         OpBdFsg0Mc9IooPTmjJJQL/+m9LNIP24aRLrOtEQaTVDBfGfZTq2GcIjmtDfW4/9uILn
         A9jNwYYGHyAnkhbh/sKISpTr/NX+uFcW0nnI8Ug0xxg6LhMrqvsYwY1XTNge7EIkdqLU
         Awxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783627277; x=1784232077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdaAx5E3GxIJv4e+ntEXnbFwxYgeCSAWQNtuiLCa5yo=;
        b=cS+qE7kCcFxWTzC82AZoZ2TxqHCPdDOf9HRv9dhWFNYmkeqYMKQXYngPoei4dbSnSV
         d20Q4Te43FScBKhzGQUUZGeJZb3kZVrH8mEUgd+3iaz04ml7DkNSIx09//dmnIZO7p/B
         o8VOoLh5ia2Vf/BB4NgPW8J5yyWL/5MzDMJuGBN6tBfQHW5tcXuPCwXQOKya9cBPgVgr
         mSXTa7qEDApvMCKoP67TrTgzx1xox/xo6j2/5Upx8NP/Vky6O7aSIiaWSvHCL5fPbJiw
         /+cgONrpGzYrPLDwuusZJEiQ3/H4WFYN19KjQpvqLErl0AwLB/+xgwfwOH9Z3fcglHT9
         Nxyg==
X-Gm-Message-State: AOJu0YyM58+J9FiAu4FGV9dtfasJYciDxs/O3m5++LRyQHRucWUwLLub
	8DGSA91TXDLb7daUpr1umcFFrLOHHqvXcgePys0BfLImSw/an6pGZ+qISuelSDWT8ygcqJPgSF5
	TkIKkAAJVHdJp8/mUDiccdOpEi+XbZLxS0g==
X-Gm-Gg: AfdE7ckIBOV/SRijCpnHQJQGd891gSzqEMBabtJCDOeDqgUluIJhIgIAmiqL07S8Eil
	bSyy/dtbvwSnXQZ+EAsPVn9l1E21Z3ftC8ggoyXFpGuxP1dKqlQao7G3mSZDcuwo//7LbaOsY3S
	hTTywYVqQxMaZJnbvji1OdbQD2WCsFU6I9WmQvs7Cjva64QKXL4gRLRNhhZqKpQ6sIkEbauCNg3
	UbIZdG8E2yeoMKdeDa90jKawCq4oNFG1Lnoam7l3cm/PXx/ZDM9rN/FdIn6IhRUEJbUxiO5siP4
	CsLnOCTJRw==
X-Received: by 2002:a05:690e:458a:10b0:667:b314:aea4 with SMTP id
 956f58d0204a3-667b314d9ccmr3503746d50.16.1783627276609; Thu, 09 Jul 2026
 13:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709155837.1879230-1-main.kalliope@gmail.com>
 <20260709155837.1879230-2-main.kalliope@gmail.com> <20260709161557.794E01F000E9@smtp.kernel.org>
In-Reply-To: <20260709161557.794E01F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 9 Jul 2026 13:01:03 -0700
X-Gm-Features: AVVi8CfU-FLHyOf2gmxnebYvCzxCj6hmKslGaI-cs-0STr_UKds8Lxhcdl5flWY
Message-ID: <CAMB2axMeZbxWry=P5JTVo_xDw7TUeUKdK6X0_LKjvLWnLJyHMw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: reject rdonly/rdwr_buf_size kfunc
 arguments that exceed u32 max
To: sashiko-reviews@lists.linux.dev
Cc: Nicholas Dudar <main.kalliope@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 9:22=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] 32-bit integer overflow in `hid_bpf_get_data()` allows arbitrary=
 out-of-bounds kernel memory access.
> - [High] Explicit 0-sized requests to kfuncs result in out-of-bounds read=
 due to verifier BTF fallback.

I also noticed the second preexisting issue when working on a patchset
unifying helper and kfunc handling. The patchset will fix it.

> --
>
> --- Patch [1]: [PATCH bpf-next v2 1/2] bpf: reject rdonly/rdwr_buf_size k=
func arguments that exceed u32 max ---
> commit 440bc8eb1e0c84aa93160b0ebdb9ef4731dce2ea
> Author: Nicholas Dudar <main.kalliope@gmail.com>
>
> bpf: reject rdonly/rdwr_buf_size kfunc arguments that exceed u32 max
>
> This commit fixes a truncation issue where a 64-bit size argument was
> incorrectly truncated into a 32-bit field without a bounds check. It reje=
cts
> sizes that exceed U32_MAX in check_kfunc_args() before assigning to the
> PTR_TO_MEM register.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 233472a871be5..c7fabe50e4874 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -12097,6 +12097,11 @@ static int check_kfunc_args(struct bpf_verifie=
r_env *env, struct bpf_kfunc_call_
> >                               }
> >
> >                               meta->r0_size =3D reg->var_off.value;
>
> [Severity: High]
> This is a pre-existing issue, but how does the verifier handle an explici=
t
> 0-sized buffer request here?
>
> If a BPF program calls hid_bpf_get_data() with rdwr_buf_size =3D 0 and
> offset =3D ctx->allocated_size, the bounds check passes:
>
> drivers/hid/bpf/hid_bpf_dispatch.c:hid_bpf_get_data()
>     if (rdwr_buf_size + offset > ctx->allocated_size)
>         return NULL;
>
> The function legally returns a pointer exactly at the end of the buffer.
> However, in check_kfunc_call(), the verifier seems to misinterpret an
> explicit 0 size as an absent size:
>
> kernel/bpf/verifier.c:check_kfunc_call()
>     if (!meta.r0_size) {
>         __u32 sz;
>         if (!IS_ERR(btf_resolve_size(desc_btf, ptr_type, &sz))) {
>             meta.r0_size =3D sz;
>             meta.r0_rdonly =3D true;
>         }
>     }
>
> Does this fall back to the BTF type size (1 byte for __u8 *) and incorrec=
tly
> grant a 1-byte read permission from the out-of-bounds pointer?
>
> > +                             if (meta->r0_size > U32_MAX) {
>
> [Severity: High]
> This is a pre-existing issue, but does allowing the size to reach U32_MAX
> expose a 32-bit integer overflow in hid_bpf_get_data()?
>
> If a BPF program calls hid_bpf_get_data() with rdwr_buf_size =3D U32_MAX =
and
> offset =3D 1, on 32-bit architectures size_t is 32 bits. This would cause=
 the
> addition to wrap around to 0:
>
> drivers/hid/bpf/hid_bpf_dispatch.c:hid_bpf_get_data()
>     if (rdwr_buf_size + offset > ctx->allocated_size)
>         return NULL;
>
> This bypasses the bounds check and returns a pointer to data + 1. Since t=
he
> verifier records the returned register's mem_size as U32_MAX, does this
> allow arbitrary out-of-bounds read/write access to kernel memory?
>
> > +                                     verbose(env, "%s rdonly/rdwr_buf_=
size exceeds u32 max\n",
> > +                                             reg_arg_name(env, argno))=
;
> > +                                     return -EINVAL;
> > +                             }
> >                               if (regno >=3D 0)
> >                                       ret =3D mark_chain_precision(env,=
 regno);
> >                               else
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709155837.18=
79230-1-main.kalliope@gmail.com?part=3D1
>
