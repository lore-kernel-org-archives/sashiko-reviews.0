Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56422277C88
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 03:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780197190; cv=pass; b=CGAuaZHQoj1/RyKFM2Wu3LzBDHtbMdcg2cpNZRou1y65uziVZeQMxFGx6pWboJzdgyzGzd4FcfXtastUdCxw8abpyXHTNkPardcc3/DhuV82NvbRSxMvyyFOBFOkR+rxecW30sYria6ilA0Fk3FmjFvU3zXHv9pQImPx6EQE4nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780197190; c=relaxed/simple;
	bh=CfucBwsLdVcr2ve0/amm3ZlavMN74u3y39FiocnxyvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig5KSlPzCrzETUZjASWxk92sbPQDlfBhPjuppK0W8YWQdfUZMZjkCzfoft8KYBtlxh5RM2o0tsoofvMLgPsWaWt+hkbzse+0Tc0WdcXwa5leA56S7zDsRj8peXcqwZjI6Ig2DAtT9q3uu/uWNAIOf8xgnEUJNBgiSxv9CPfGSPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nhn0kMx4; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nhn0kMx4"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516d1ddcdf4so561cf.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 20:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780197188; cv=none;
        d=google.com; s=arc-20240605;
        b=V7niYMaN5onscjODDqeZ/jPllHXHal1/KZl57d4XRGxdLQp9X8h2Zs4TIR1RAPbcWD
         NeXa917qS/useCisDKBtNzNYZwiKWZ9zGOkMuYCSSc6uFdhpfZyZglapEH5jfR74c75U
         g/dVthE0XdXO91lfZSYwnItUdbGqgxhcguPOg1ewRwNVuAr25Sf/PYKtEEyrovfVxQ7Y
         BbVSQSq6EYBPD5Gt/10eHC/x8mYumcQq298+p1CFj03SXFGCC6B3H9NGh5wpfXrTd62L
         HTg/M62z4GD2V0A91CAW7tMTN8CNgI8RyOPzlHS/KHPVdNeTsrVZmTJPx9gYYzuRTVUu
         jKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0aKFbssi/3YPxEE0KQ6RqqdiyefgKuZPgHY0IdlEzs=;
        fh=qwAHEygO6oiegpp/vuoASCfYTsg0pySGtNZvVTFXlfo=;
        b=DRFXFk/rABLycLIyLL6l+dUraOkR2Xg1vEGkuM1brF26kOAfoSa/aAYHTQ7HPZlnMN
         X9dfGfhmOBoFf25qiFAhKkxBRhNMeZDLIF3LuaEAngbaP4X7+Rw9iGnH4OW9Gm2CM6Mv
         GWzvO8JhVnbiv6ojVZDZ9E8b/wozaG2d00nwrtUr6R7/W/DSAYHEOGp3LQ+xWg0ZWdZ2
         rBQ/PHZky0kYz/E5K4EBsvA31E47p7o8mY8sxMj2cuOgTppXfoF1AnS/ttsnxP08wEZs
         vW80/sT3F81gpTWCyvqpeo6i0WcgkxWGM/JMoo1oy9mThdE7BFG+7JnWHKuOWmoNmsT8
         2N8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780197188; x=1780801988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0aKFbssi/3YPxEE0KQ6RqqdiyefgKuZPgHY0IdlEzs=;
        b=Nhn0kMx4S/YwLGxfH0UFWNobmruam1wtZ+GC8vRU9PRNV7HnCSPC16NYLeeEfLirGl
         pC/YkLy3Zk95o98skxk82TP4hm7oxAuepRN/wOlbmT5/KVE1UMWhI+F0BNsc0U4NbSAr
         8Ln0OqwRQGf1q7Sj1enlx11dLTjF5VD4yUcwQFalwrxSDYvhmBH11ev9Fcv00O2s9vO6
         qJt9gdU8pTNT/0X8GuI/NGFGruvAmFcUxqWRT+p9NkxrSlzpscF3X74eJVua30GyTPwM
         POYvhDwidyKTCzuaLdpnxht3IxERasOqTGJoCIQE3Bee4D+E8t7GSZ7QoXtZKRPJCodD
         2KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780197188; x=1780801988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0aKFbssi/3YPxEE0KQ6RqqdiyefgKuZPgHY0IdlEzs=;
        b=dxV32NgeHqHcTXE2VHnRQeEex2Fl8e5y/tjJsLu3QKnpiaKBvm6WQXt3bbjil1jTpa
         n7u2xNKxbSr3MlCWoTb31CmEP8BJpLLyxDigGaZCtItEDJfat4Uo6kvt1+90ivRHDrej
         +ykao3BrROPgj4BxcscgqbHZ/3iRKFmWJ/LEhzekHy2AbHl7wuogL31IZpgBSU4w8iGm
         ocbSb+wCSWJn05Lqx4icNtbO3naRd+3lA3addbP1fh2jAPKkzdAiienvmH/AtAuhfWEG
         KDHmD/RVQVKzF2q/1rFl/qeO5LL6halj7Dj/MpQFhgNH9BbYNpzfMNnOcX+noLoT4u8i
         SDHQ==
X-Gm-Message-State: AOJu0YxN7By1KJVX5vOOUqrTFPavh3rFqjFeu//ZJVeZEAfBVZW7Tpye
	vdRuGdZC6CYWhLAGa4ti0qOwrKHQrOwKTHx0WRANiwTVEkiTICrF/o0tFfFwcJ1WiLmKXS46C/Z
	Ph9q7BDQ+Qokkd2BTiNFvwReFTXzYv6J+0FEwhyXw
X-Gm-Gg: Acq92OH8Wx7XpaFQuwyliWJ2WG1YLh9dEQbgTA66JBQ7L/UhU3ku1uRBg7q6jOL9HtF
	528peih4ilra7onL55aDYQbW8CZhGEtD3g2fxu+tQZcgEGu/4HJp3WmhByTSq9/Vag5z56SS5yo
	C9v9mxatgPLT76pBpuRwsYmnPWLzWdAwRJA9p0+4dVBzMcCLsILoM0aqguVHFq9dNovQDyCQqYH
	jsPdpUpPsKtE6RuQjm2GcVERVyE0eMBh8Agm50a2X9Y8Zoo3rE0xHmJFmKSCjwpy+vb6tYQWCuU
	r54DT6Nd/TKIJsl/Pc1Yx400XoEZPGnkAuEN4Ca/cNqMAbkGGk/QpwUE5NrV3fb2
X-Received: by 2002:ac8:520a:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5173c7d3720mr9449371cf.5.1780197187595; Sat, 30 May 2026
 20:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531004748.3567875-2-yuyanghuang@google.com>
 <20260531005931.D4F201F00893@smtp.kernel.org> <DIWIZY7U8VDW.Q0HWZ5FCLRLE@gmail.com>
In-Reply-To: <DIWIZY7U8VDW.Q0HWZ5FCLRLE@gmail.com>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Sun, 31 May 2026 11:12:31 +0800
X-Gm-Features: AVHnY4JQ5t76RoVa3pXrRg3PNKC88_9EzRITct__Vizlg10yn0vREj3y0fpWg_I
Message-ID: <CADXeF1FsR4UKRtNT=vCP5zTLqzyr9_smNdZto2+uBnYP6998Ww@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: reject BPF_PROG_QUERY with short
 uattr size
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 11:02=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sat May 30, 2026 at 5:59 PM PDT, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> > - [Critical] The patch unconditionally rejects BPF_PROG_QUERY requests =
with a smaller attribute size, breaking backward compatibility for older us=
erspace applications.
> > - [Low] Returning -EFAULT for a structure size mismatch is semantically=
 incorrect.
> > --
> >
> > commit 205b70f382d21dfafc18f8275384ff0f06e59f6e
> > Author: Yuyang Huang <yuyanghuang@google.com>
> >
> > bpf: reject BPF_PROG_QUERY with short uattr size
> >
> > This commit modifies bpf_prog_query() to return an error if the user-pr=
ovided
> > attribute size is smaller than the offset of the query.revision field. =
This
> > aims to prevent an out-of-bounds write to userspace.
> >
> >> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> >> index 9e91fb2fb492c..4dbf53e81a38c 100644
> >> --- a/kernel/bpf/syscall.c
> >> +++ b/kernel/bpf/syscall.c
> >> @@ -4719,8 +4719,10 @@ static int bpf_prog_detach(const union bpf_attr=
 *attr)
> >>  #define BPF_PROG_QUERY_LAST_FIELD query.revision
> >>
> >>  static int bpf_prog_query(const union bpf_attr *attr,
> >> -                      union bpf_attr __user *uattr)
> >> +                      union bpf_attr __user *uattr, u32 uattr_size)
> >>  {
> >> +    if (uattr_size < offsetofend(union bpf_attr, query.revision))
> >
> > [Severity: Critical]
> > Does this unconditionally reject older userspace applications that pass=
 a
> > smaller uattr_size? The BPF syscall generally maintains backward
> > compatibility by allowing older binaries to pass smaller structures.
> >
> > By rejecting the call entirely at the top-level dispatcher, wouldn't th=
is
> > break ABI for all attachment types (like BPF_FLOW_DISSECTOR), even if t=
hose
> > specific handlers never attempt to write to query.revision?
>
> bot is correct. this is too broad.
>
> > Could we instead pass uattr_size down to the lower-level query handlers=
 and
> > conditionally skip writing the revision field to user space when the pr=
ovided
> > buffer size is insufficient?
>
> ok. let's propagate uattr_size all the way to __cgroup_bpf_query() and do=
:
>
> if (uattr_size >=3D offsetofend(union bpf_attr, query.revision) &&
>     copy_to_user(&uattr->query.revision, &revision, sizeof(revision)))
>         return -EFAULT;
>
> With single fixes tag:
> Fixes: 120933984460 ("bpf: Implement mprog API on top of existing cgroup =
progs")
>
> and explain in commit log like:
> "
> query.revision in bpf_mprog_query is structurally identical to the cgroup=
 case: a late tail field, written unconditionally.
>
> But the backward-compat hazard is not the same
>
> The min-historical-size test is per command, and bpf_mprog_query only ser=
ves attach types that were born with revision in the struct:
>
> - tcx_prog_query =E2=86=92 BPF_TCX_INGRESS/EGRESS
> - netkit_prog_query =E2=86=92 BPF_NETKIT_PRIMARY/PEER
>
> tcx, netkit, the revision field, and bpf_mprog_query itself all landed in=
 the same v6.6 merge window (053c8e1f235d added the mprog query API + revis=
ion; tcx in
> e420bed02507, netkit in 35dfaad7188c). There has never been a tcx/netkit =
BPF_PROG_QUERY userspace that doesn't know about revision. So for these com=
mands the
> minimum legitimate struct already covers offset 56=E2=80=9364 =E2=80=94 n=
o old binary can be broken here.
>
> Contrast with cgroup: BPF_PROG_QUERY on cgroup attach types shipped in 20=
17; revision write-back was bolted on years later (120933984460). That path=
 has a real
> population of pre-revision callers.
> "

Thanks for the detailed review again. I will send patch v3 based on
these suggestions.
