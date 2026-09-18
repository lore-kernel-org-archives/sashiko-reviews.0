Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0577E3F1070
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 17:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753631; cv=none; b=Rt8sYzdrbRd4ZYPoqLUtfiNceoIiYIVHq26vJZDjcRCsUPqmR81TlUEYBcAYMNZVO6329U6c/OATyi59qa+xjcvUQJR1vp72IsvvgDEr/20Q2coYdG5ph0Sq5b4cF8O+aNz+Kr1ETzclqE9A1NNePM6iPiJJ8/hAbC6glAYCTMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753631; c=relaxed/simple;
	bh=f42dMciCrW1J0Mcy+QEp7Bb81fgEDJ3RV9ZJ2fzxP40=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aYDf6UoBWl/xbNPEbcgfPECjjoLzc2J9eLpTL+OPq3vutNq1+e7Nb0juuG1GvaSQ9BMW8WXZMzj7NAh4oS+yr9Pk0qiXLdmJGm8Kbr0yv40z3BRppS/k+LirnnsWQzhFyXO+1AzU/YQnOw3QtGH66j7u1+x7IQVDMB5qkaIubFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoujTvEf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoujTvEf"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so9412435ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 10:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753620; x=1790358420; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GZvh9frVpT1nHhEQKPyuEwEyEjCXAqjHGVMbR0ccXvE=;
        b=CoujTvEfvWSqlc30kOboSRZ1iHnnlFKT8ILIqnazJrGktmx3xTMyy7mjiRININ8dqE
         zmrbn1tKZwIT9XkXMVbFgB30OJmUXn0eOr/1d5SQj8VwMkriVNIGOut0HCIo4wd19gBx
         UA+3YAX5hUhd2SYGhVbveVeRXw+JiOnMx/g2gP10LYsg1g5s5E7YJSvC9pZ7iIJwSryB
         LeP1Vk/dd4VrMb6+KL41LxP05wRodDOZJfstBtkUKXTQWRubWfLl1cpOMBLd65RHfHQz
         ICq29V92rZJDEtbdlUULq2zyzlbPnlXsTHAiwlG6pTxCK8BZXGGIst4diUI3v0dMx/79
         8gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753620; x=1790358420;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZvh9frVpT1nHhEQKPyuEwEyEjCXAqjHGVMbR0ccXvE=;
        b=kQKNytaCqy65RkZqqpbOVRMf8Of2wI0gL1HgZ4SvjG5cVAmjMzqloOmOmc2ZESY9Mv
         o3xTIp+MFAxkN+XjEyjJcZSO50HJcoknYnEdpiiAEMp70EGNwAZ4VzRPzmzqk5OSrexx
         ZuJk5D65vWfUoJ80fnypCVf1SHsyOWDYnHXqpgFFCB/JOvYWptD2yS6+nIKH6RO2s6AE
         wLg7VRJQwJxEezlnMVCQkCFi23wfuUT1qsyFB0jdzxk9j0ndVFfWpd5CFGfAZ5vMY6fs
         OBzXJZ6fcOD7JWp0df3OtWMe2/dDiM2rvNeBMo9cyudCRO6TWf2se242Xvf12finNcVz
         9sqw==
X-Gm-Message-State: AFuF++mcCviyfs0Ypez39oNJsgPOK7dQlQMk9R3EEK8zBrTEbom5a/mn
	lGW9H7MzFYJ565aS2cevnb/j6UgJ1zZW7IxcOk3sn4YdxnCOIBFKG2SMhJ26pKYi
X-Gm-Gg: AYBFou0Oikm5ZrGssgpolA5cbNNC6fhGiX9tfDYwLA1TaVsbwfInQQx0vFGQfSnPONk
	IB/aI1juuVkyXxD8g/e0mjKF0sIsxj7j0BTNFhzeEZ9/FuzuNAY0B/3MyPGiIoYRRK7UTB94KXp
	cVj1B8kURJKRw5f8M3Vggwyt+wkYNmNJGlxOPNbObYxzPdRLbH3EBHahaYaR1lTYX1kCCRq22+K
	6aO2LWUMDFXcMPdSRRt8RaHWIwoil7Z/HK44x0NG7FKSLWhcSxjz/vHbjtb4F6MsUmXpJ6nrPra
	FitJ1zB3tXBQ0SZyG8xgRJ2SxEWuMzs1p/wIWkU8vOrilinSjxzoO5cBH2Qe+3BfQTcn/HJPEg1
	j3gmiQX0IsgGdwq1YxOrDB4R8rEyQGq4mLeNpzSPKk8RQYRTFBgAR32U5zvFxh12NUp3A1l6Chr
	SMMBfYq26WzTNn5LMjJ+X095sXPmHajCAJOuC91A8XWnyQh2m+izPcYCw91uTHyhH3wiT3e1i8L
	eulQPN4p6Wn2FyEFz4oOOfy8g/CWdoszwT8VZ9kHympAvHilGoo0IRVmQ==
X-Received: by 2002:a17:902:c948:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2ddb1add3cbmr62250255ad.7.1789753620314;
        Fri, 18 Sep 2026 10:47:00 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:e136:8952:772a:93a4? ([2620:10d:c090:500::4:e681])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17e17e0sm364765ad.70.2026.09.18.10.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:47:00 -0700 (PDT)
Message-ID: <962a73fd049d797d27f8e51e8a14dc011d21415c.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 3/8] bpf: Check read access for initialized
 writable memory arguments
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>
Cc: bpf@vger.kernel.org
Date: Fri, 18 Sep 2026 10:46:58 -0700
In-Reply-To: <20260918055038.1D4AE1F000FF@smtp.kernel.org>
References: <20260918052906.12226-1-memxor@gmail.com>
	 <20260918052906.12226-4-memxor@gmail.com>
	 <20260918055038.1D4AE1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-09-18 at 05:50 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] bpf: MEM_WRITE without MEM_UNINIT enforces BPF_READ breaking=
 output helpers
> --
>=20
> commit aebadfb01a3b32540321fe2b60bcb6fb1c8673be
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: Check read access for initialized writable memory arguments
>=20
> This commit updates the BPF verifier to derive memory access types based =
on
> argument flags, correctly enforcing read access for writable memory argum=
ents
> that are already initialized. The change addresses an issue where helper
> argument checking previously omitted read permission checks on map values=
. It
> adds a generic func_arg_access_type() helper to replace the kfunc-specifi=
c
> access overrides.
>=20
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 1d5e4ee64fc00..21eb806b1351c 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -8886,6 +8886,15 @@ static int process_map_ptr_arg(struct bpf_verifi=
er_env *env, struct bpf_reg_stat
> >  	return 0;
> >  }
> > =20
> > +static enum bpf_access_type func_arg_access_type(enum bpf_arg_type arg=
_type)
> > +{
> > +	if (!(arg_type & MEM_WRITE))
> > +		return BPF_READ;
> > +	if (arg_type & MEM_UNINIT)
> > +		return BPF_WRITE;
> > +	return BPF_READ | BPF_WRITE;
> > +}
>=20
> [Severity: Critical]
> Does this regression break pure output helpers that lack the MEM_UNINIT f=
lag?
>=20
> For example, bpf_snprintf() is defined as an output helper:
>=20
> kernel/bpf/helpers.c:
> const struct bpf_func_proto bpf_snprintf_proto =3D {
>     ...
>     .arg1_type  =3D ARG_PTR_TO_MEM_OR_NULL | MEM_WRITE,
>     ...
> };
>=20
> Because bpf_snprintf() does not guarantee full buffer initialization, it
> cannot be safely marked with MEM_UNINIT. However, with this change, the l=
ack
> of MEM_UNINIT means func_arg_access_type() will return BPF_READ | BPF_WRI=
TE
> instead of just BPF_WRITE.
>=20
> Will this inadvertently force check_helper_mem_access() to reject valid
> write-only maps (BPF_F_WRONLY_PROG) when passed to such output helpers, c=
ausing
> valid BPF programs to fail verification?

I think it should be safe to relax MEM_UNINIT interpretation for priv
and not to require full buffer initialization. That would be only a
documentation change, as far as I understand. Then it would be fine to
put MEM_UNINIT for snprintf. For unpriv and MEM_UNINIT buffer we can
scratch the buffer as a combination of BPF_MISC (for previously filled part=
s) /
BPF_INVALID (for previously invalid parts) instead of requiring full initia=
lization.
Kartikeya, could you please take a look if this requires any code changes?

> Additionally, for unprivileged programs lacking CAP_PERFMON, won't this
> erroneously enforce stack buffer pre-initialization by enforcing a read c=
heck
> requiring stack initialization in check_stack_range_initialized()?

But that's not an error. If the helper reads the memory, there is no
MEM_UNINIT annotation and we pass a pointer to uninitiated memory
buffer to the program, then such a program should be rejected.
