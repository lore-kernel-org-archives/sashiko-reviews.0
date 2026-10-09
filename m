Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A234F68CE
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575040; cv=none; b=Xiy//uCgm8TUxKV2T6uCtLPBn0LSop2CWQ9o8ED0DiLEgoyEtHjS3LoLnNyte7dkdcDcsIA1CNeqHTXjDpUeLm6MgH8DU3cFrNPFhAAOl7/V2VTJAfSZsj4gShdfglfPa3GCeAi135J7Lff4H9nnnczFXzgSfiP3O4Xz2GicMIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575040; c=relaxed/simple;
	bh=yPK/C56r2l/kIp6KJnmw0Go5IkCDB8h4EMJ4V6uvBGs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NdewQfcFE3HpxLNRjOM25QW5wboGzGFESedaNqJqORM+iz2iv2bugUromua8FV+vn98UeRtBkLZHa0msjKGZVn2SC4lUwmIHxU9zNZkJANuU7Wi91Hg2sLwamY6HhKf+fOGHQ5FB8EUEv97u0iu22TDrJPdf0bl+EvDHlNuh9kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adMzUTr5; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adMzUTr5"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15168a20b47so77498c88.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 12:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575031; x=1792179831; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dfxw2OEyiidY3NWEHa5Smnr/xOHXIYrJKQeWaHdqTn0=;
        b=adMzUTr51KhlwsBEm1KSsTgUkYaduZtGBnVYXE+M5Ouv4IKdYQotIEuWx0otGjDcV4
         zUBPSYH31srFE5ltoyoFbAlFarkqsFiD5seSDFxS7X8oqlHtZtrEZjdiriJ+po5XyaDe
         6SFbQwuAepKsPM0ZFphuzva8M7ESXCZVOuiaxc5Z3KyvlmB6Ax6RqISts8PGPKbdkN8R
         fZ0RB1Ki8GaHQGqRLGtz6l9pOIR1KGlihdP25NIMyi/2bRIOdZ7CGrm9rPJeNY0IgOqC
         FFvf61P5SFRwOQ0iZ39Vy6xlF1IrT2fpgNctDK9IKpbVSNGDXGDK7jM3UkcY/PqLmb1B
         YvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575031; x=1792179831;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfxw2OEyiidY3NWEHa5Smnr/xOHXIYrJKQeWaHdqTn0=;
        b=mJIHOltJDwFGiTzsS2P0ZGg4u/lxjVSLMZSMTOCxbSdS3jo9devLUa4rH+nqpKqlHf
         8qsQi/d+x58hO+i8hZukqeZlcSuczTmkGwmQSD7amfQvaSzeL6CvwUZVSEumUozwpMsz
         3buKU1oZFsuFARI339/yqv3LO/1wLXqvUQhob6+jmL1FLQ5B7tziCF+cN6oE9kt07jWt
         SgdtufWTtxBl93ldW7U2Pz5cFwCjoikb7XVp0VA5O8ocC2NcXJAkqmeYxm/N0oMfOGVy
         FxSmBzJpzgEA7gyxNsBtKJ7QsjYhTJwesYPbotNpJWHVDOn34mJ3mZZdU31LAYc3DuL2
         rvqA==
X-Gm-Message-State: AFuF++nZFwVfSpxTobRek28T4vte4thQawy6hM3k/XgKut/mlWLHzWmp
	T62TL62xGQc3+7FEAal11pDxJrUz803ceUYVe0JvDu50hRhvoDtRdwH4PVhM/g==
X-Gm-Gg: AYBFou0/i/9XMvBpSGOECRaSJkz4YXdr77IDx1ifK0dwUa07GUc92CCSsruwxEFIRBk
	rX+KINcrXjmPGL0uwN8erwhU+ne/7dt9fVGRuEEtnpMvYk6C2tIDIMaffHu2O+kF7E0JMOVmRMp
	kQJSJuZZbFbuACF8asNuFvLqB8VS0+rJIMS/uKFWo1hGKbRUwL6f6OLrbyaMzKz04HbAntwclRO
	Utsay68Xn68zv9DEBqB6RoTxXE399mOp3SYxDTfpt/3+qTb1W2hmYoje4Qlo+J1xumCKgwBnAy5
	jh5EVtwnHkzXVsx/NoivQDOe4e9ooj+RRvwpDswU7claRN3+6IJZa1dktqQc6hWhdUQsguetL3d
	cHqGJJdsy4VO+6a+pWkIPZ5bjKGtOK7SH3cuJKDj7PXccrXNn9aF4a2Rx6xKJ7bj2yykx9MrI78
	XfTK0asBkv+eGktNiELC0am7NUIEDksAF1ovUpaBaqOXD7MwEoYhPaCM4/+Hek6IsdkrlXfl6/D
	ZjKVA98gY0ONFxrjUGFV5o7CbdZAGpsGNtvMMHGkqjRTqSbBxp41qua
X-Received: by 2002:a05:7023:882:b0:15a:4155:3d9d with SMTP id a92af1059eb24-16a6034685dmr4538066c88.31.1791575030511;
        Fri, 09 Oct 2026 12:43:50 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:26fd:a5f6:5f7e:c6b7? ([2620:10d:c090:500::4:66bf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm16849893c88.13.2026.10.09.12.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:43:50 -0700 (PDT)
Message-ID: <e546abc913e5434df6cd2465299aac538c0156d7.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 20/51] bpf: varying offset access support
 for PTR_TO_BTF_ID pointers
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Fri, 09 Oct 2026 12:43:48 -0700
In-Reply-To: <sashiko-outbox-165405@kernel.org>
References: <20261009-scev-minimal-rebase-v3-0-bcba9bc53ac9@gmail.com>
	 <20261009-scev-minimal-rebase-v3-20-bcba9bc53ac9@gmail.com>
	 <sashiko-outbox-165405@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-10-09 at 11:41 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] bpf: truncation of 64-bit var_off to 32-bit bypasses custom btf_=
struct_access bounds
> - [High] bpf: unbounded variable offset read on trusted PTR_TO_BTF_ID byp=
asses PROBE_MEM
> --
>=20
> commit ec6d1e8a8c55dc442e46ac3d70d36a00ec8a9ffd
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: varying offset access support for PTR_TO_BTF_ID pointers
>=20
> This commit relaxes requirements for varying offset accesses to PTR_TO_BT=
F_ID
> pointers, verifying they stay within array bounds and align with elements=
.
> It modifies btf_struct_access to validate minimum offsets and array spans=
,
> while skipping upper bounds checks for flexible arrays.
>=20
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index 0630675377aaa..f4d119f3d5ef9 100644
> > --- a/kernel/bpf/btf.c
> > +++ b/kernel/bpf/btf.c
> [ ... ]
> > @@ -7899,6 +7961,55 @@ int btf_struct_access(struct bpf_verifier_log *l=
og,
> [ ... ]
> > +		array_start =3D min_off - arrays[i].off;
> > +		/* An array within the flexible tail has no upper bound to exceed */
> > +		if (array_start >=3D flex_off && btf_type_is_array(t) &&
> > +		    btf_type_array(t)->nelems =3D=3D 0)
> > +			return ret;
>=20
> [Severity: High]
> Does this allow unbounded variable offset reads on trusted pointers?
>=20
> This logic explicitly skips the upper bound check for flexible arrays,
> assuming PROBE_MEM will safely catch out-of-bounds page faults at runtime=
.
>=20
> However, if the pointer being accessed is trusted (meaning it has the
> PTR_TRUSTED flag and lacks PTR_UNTRUSTED), wouldn't bpf_may_fault_on_dere=
f()
> evaluate to false?
>=20
> If bpf_may_fault_on_deref() is false, bpf_convert_ctx_accesses() won't
> convert the load into a PROBE_MEM exception-handled load. Passing an
> arbitrarily large offset here could result in a native load from unmapped
> memory, potentially crashing the kernel.

This is a pre-existing bug.
I think the correct fix here is to always treat flexible array tails
access as un-trusted, varying offset or not.

>=20
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index f5b2500335a7b..192efb7229975 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -6608,6 +6604,18 @@ static int check_ptr_to_btf_access(struct bpf_ve=
rifier_env *env,
> >  	}
> > =20
> >  	if (env->ops->btf_struct_access && !type_is_alloc(reg->type) && atype=
 =3D=3D BPF_WRITE) {
> > +		if (!tnum_is_const(reg->var_off)) {
> > +			char tn_buf[48];
> > +
> > +			tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
> > +			verbose(env,
> > +				"%s is ptr_%s invalid variable offset: off=3D%d, var_off=3D%s\n",
> > +				reg_arg_name(env, argno), tname, off, tn_buf);
> > +			return -EACCES;
> > +		}
> > +
> > +		off +=3D reg->var_off.value;
> > +
> >  		if (!btf_is_kernel(reg->btf)) {
> >  			verifier_bug(env, "reg->btf must be kernel btf");
> >  			return -EFAULT;
>=20
> [Severity: High]
> Could this assignment truncate a large 64-bit value into a negative 32-bi=
t
> offset?
>=20
> Earlier in check_ptr_to_btf_access(), the negative check for off was remo=
ved
> and replaced with min_off. Now that off +=3D reg->var_off.value is execut=
ed
> down here for BPF_WRITE with custom handlers, a very large 64-bit
> var_off.value could wrap into a negative 32-bit integer.
>=20
> Since there is no negativity check immediately following this addition, t=
he
> truncated negative offset gets passed directly into the custom
> btf_struct_access handler.
>=20
> If a handler like bpf_scx_btf_struct_access compares this negative offset
> against size_t boundaries, couldn't this bypass the bounds check and
> allow out-of-bounds writes to kernel objects?

I don't think this can happen.
reg->var_off.value is bound by BPF_MAX_VAR_OFF.
`off` comes from 16-bit instruction offset.
Plus there is a check:

  check_add_overflow(reg_smin(reg), off, &min_off)

just before.
