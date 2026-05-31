Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249520C029
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 03:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780196523; cv=none; b=TKaD+wBYqwCqS859unTDFnv8iUi2TQLFedOVAnwHE+xGzpHmLyKeEY+y5lTaJ0v2nSQR/GJ85qrtFMetcRKyG8+7xErkvRqOuW6mKRUT37SHSA1X87Z9teVj5FU8Oxd2VDv3Ctc1IcQVVFkg91Rlt5NFf0vBVJWZ+qamwXss7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780196523; c=relaxed/simple;
	bh=8HesMmPopPHyjuGUTNIlvBrHXcvGi00fldCIKrCCSm0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=e8dudE4K08tVc3pwaJ9k8L+IHaU0l8ljDFSlceFcYskK0PcrE6a85TmQ+15KctF+1D24JrBjvuWWosjAd1no7awcRe1VO4tXKiUIXzc/ec0VHicTGwYtWHqTHJ29zsr62FBktPTpA1xg6111CfevUciptT96ueQKF+FlG5lGoIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPhSSCuA; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPhSSCuA"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e6b5c374e5so266641a34.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780196521; x=1780801321; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsmd12pLGX+TS7ApQoI+Bb30bGj8oks7xKAyqCnXlUg=;
        b=iPhSSCuAVuQcHOztwO0UI+FyU04zWhZJItTYX8Wh+v7FHnnLZGqN0UJidvCblzMNji
         Q/QiUC+MzaT09LO/X0H13vMKTimotzp1KWFINkLbicYiTHzlgEuvz0pu59DRuF7GmrLT
         0p8nNouInTuPwwtqmeMchk5QoM3+rNqOM9v0vgCojntnDph27q3cTug5DTaGrcHFyW0O
         3H4Nh+0URtmp7/99X6q62weZIsFof4cC80Z4KSz+IlN6wSEot3rA3XqxlZnGwwfWdmo3
         GqBYDIYT37KyW/PuXxq39WuFobDJHgOxx9mtaVXYa0a4v4hFqHfkzpWWeRqjFDozW4vN
         t+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780196521; x=1780801321;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsmd12pLGX+TS7ApQoI+Bb30bGj8oks7xKAyqCnXlUg=;
        b=BLV2VolrLCCl3OfVzPPdSZQITADrYFCcW5BKRUTqRYq29yfrOyEWWVPdXUA54z6kxZ
         02+ooCXkNNVDRvXjSjK6vaYEHW3Xphd8bgwTRC4/wNFbTeBh3XRfLUxfLKkrTAX7RXmG
         bgUij2tb2JVL+UjP63LTYROpnIgKIetee/JsE4QYEMTDM/b++K61e9de9wzGMF1TylTP
         9AHWA1V4ctGrtzPrUkf5BcOvPdM6B9Svyk4K5T7Vreqj9Dprar/3oApWHu7vd9NFC6AB
         j5zoC6QVu7lWWbpazSqZ2R78ofyjHY92yzl7s7Hps3JDBcHmK7gRNKvNjiIbWuSygzDM
         BkSw==
X-Gm-Message-State: AOJu0YxfRbhu9yBNE2GDapA9Ec4rsPIRFoKIu9gGHXYGV5kWZayTZvtb
	XkIawbZfE8BIMnYBqUWUcuThWl5i9XD/mPwbmGrnOyIBrAvP1ieAARAsNUpOZg==
X-Gm-Gg: Acq92OGZ+iah7o6K9Rxb5p8/0pK3+xw7JBbSdCN/+jJpJO1+NkkW2Qc4A3JGLDLBdw8
	U+0LKoM3HukqBCQU6PvmdiscWgnc/Pi0EGe5NRcax7erl4RAocppFRfxT3df7hKJ0cSFumTwmYy
	nNVKC/29MR7emaFFNiKTh3cJFQiKTM/fNGogABhNcsg/mo3ctWVD+OBE19ywjud3a2ZJm03Jcc4
	SkW3fhQGYJt6mFrOaQchKSdfnGArbW8yreKS+I51aw+xHiqtXZlq7ESmopEu4twFiS1Mf+7NpeJ
	Ry+Il65lnowsr5RvrjBMvaSOPcgDkrC1AsoEX419t4fflR+32GbiMzEmi83kuF3pKVwXCXdDHnU
	2W9M2NSUsAXi/g8thNJjrOzC6Vfn8eVJNov7umGIwZ9ULBv/J6LlV9MsliwkNSetw8WwXc4Y800
	fW6fmVcJ0g8GiRiSy3AV6NVGrC7X/YFg/80Grg0KgCLdeHZJ1dkSVzKkHwndXDxjiDyJGGif5SG
	bj7YXzASwl7z7eztmsY+/kBDm4I
X-Received: by 2002:a05:6830:6d4e:b0:7d7:dcbb:280b with SMTP id 46e09a7af769-7e6a2e63d1emr2840299a34.1.1780196520963;
        Sat, 30 May 2026 20:02:00 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:44::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695d17b1asm4778913a34.17.2026.05.30.20.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 20:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 20:01:57 -0700
Message-Id: <DIWIZY7U8VDW.Q0HWZ5FCLRLE@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: reject BPF_PROG_QUERY with short
 uattr size
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Yuyang Huang"
 <yuyanghuang@google.com>
X-Mailer: aerc
References: <20260531004748.3567875-2-yuyanghuang@google.com>
 <20260531005931.D4F201F00893@smtp.kernel.org>
In-Reply-To: <20260531005931.D4F201F00893@smtp.kernel.org>

On Sat May 30, 2026 at 5:59 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] The patch unconditionally rejects BPF_PROG_QUERY requests wi=
th a smaller attribute size, breaking backward compatibility for older user=
space applications.
> - [Low] Returning -EFAULT for a structure size mismatch is semantically i=
ncorrect.
> --
>
> commit 205b70f382d21dfafc18f8275384ff0f06e59f6e
> Author: Yuyang Huang <yuyanghuang@google.com>
>
> bpf: reject BPF_PROG_QUERY with short uattr size
>
> This commit modifies bpf_prog_query() to return an error if the user-prov=
ided
> attribute size is smaller than the offset of the query.revision field. Th=
is
> aims to prevent an out-of-bounds write to userspace.
>
>> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
>> index 9e91fb2fb492c..4dbf53e81a38c 100644
>> --- a/kernel/bpf/syscall.c
>> +++ b/kernel/bpf/syscall.c
>> @@ -4719,8 +4719,10 @@ static int bpf_prog_detach(const union bpf_attr *=
attr)
>>  #define BPF_PROG_QUERY_LAST_FIELD query.revision
>> =20
>>  static int bpf_prog_query(const union bpf_attr *attr,
>> -			  union bpf_attr __user *uattr)
>> +			  union bpf_attr __user *uattr, u32 uattr_size)
>>  {
>> +	if (uattr_size < offsetofend(union bpf_attr, query.revision))
>
> [Severity: Critical]
> Does this unconditionally reject older userspace applications that pass a
> smaller uattr_size? The BPF syscall generally maintains backward
> compatibility by allowing older binaries to pass smaller structures.
>
> By rejecting the call entirely at the top-level dispatcher, wouldn't this
> break ABI for all attachment types (like BPF_FLOW_DISSECTOR), even if tho=
se
> specific handlers never attempt to write to query.revision?

bot is correct. this is too broad.

> Could we instead pass uattr_size down to the lower-level query handlers a=
nd
> conditionally skip writing the revision field to user space when the prov=
ided
> buffer size is insufficient?

ok. let's propagate uattr_size all the way to __cgroup_bpf_query() and do:

if (uattr_size >=3D offsetofend(union bpf_attr, query.revision) &&
    copy_to_user(&uattr->query.revision, &revision, sizeof(revision)))
        return -EFAULT;

With single fixes tag:
Fixes: 120933984460 ("bpf: Implement mprog API on top of existing cgroup pr=
ogs")

and explain in commit log like:
"
query.revision in bpf_mprog_query is structurally identical to the cgroup c=
ase: a late tail field, written unconditionally.

But the backward-compat hazard is not the same

The min-historical-size test is per command, and bpf_mprog_query only serve=
s attach types that were born with revision in the struct:

- tcx_prog_query =E2=86=92 BPF_TCX_INGRESS/EGRESS
- netkit_prog_query =E2=86=92 BPF_NETKIT_PRIMARY/PEER

tcx, netkit, the revision field, and bpf_mprog_query itself all landed in t=
he same v6.6 merge window (053c8e1f235d added the mprog query API + revisio=
n; tcx in
e420bed02507, netkit in 35dfaad7188c). There has never been a tcx/netkit BP=
F_PROG_QUERY userspace that doesn't know about revision. So for these comma=
nds the
minimum legitimate struct already covers offset 56=E2=80=9364 =E2=80=94 no =
old binary can be broken here.

Contrast with cgroup: BPF_PROG_QUERY on cgroup attach types shipped in 2017=
; revision write-back was bolted on years later (120933984460). That path h=
as a real
population of pre-revision callers.
"
