Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF5E25CC57
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787334797; cv=none; b=Ltge8/wkmEtCw392PEckDbQTO4mEkhyKREVKTY4oggRXGjLiVyGyzuE6CU4vJ/6Xa3ifdtTTBIIM/SpcUJKuY0OFSu8n33vd+PGmc2RjFRJShcw35DCUbA8wT95JbcHUU36gqvfZVzZH+Vv7l6uctitojk/laFWvYCac7dZWomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787334797; c=relaxed/simple;
	bh=rr1EVL+4iiksKyR165CGqWE5TxhSTv7lkS+ul8ltQUg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tz9tcL8a0ZxYQzse2n/W1pIG5CxOJMTAyvPPOvaYmz/tbqMNoobAN7VpyyGn+7DqjDBYPZCiw+E40ABeBxLD3A9U2BfIRQrTzMy/z/cama+9gbc2xuo1AP6D7KJ83aAXrRouCyTVL2bYly4WBZmfq1SBrWdI7EUCHGDRPKXTtD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iafW+5ij; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iafW+5ij"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1148398a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787334795; x=1787939595; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x5X2EWJjIO+3uU6HNhskU6QdvAMpHnR+u9hjOMlkEYo=;
        b=iafW+5ijsci3jkXoVVlPSdXW4kKuO1B5/8MybbK//nniN5tid07n6AMKyjbZawdG44
         wjNO61K+6HETjhcOK8b0TEFJ6lvBahSHjeCkMh+NGKIXCh1pB2vnt7BKWpxaPca/lhPI
         yFHXPSzHKxb0IMe699+/aWXhQWI46pU7EC6VT+4dUl2aeOvfI4x+Eyf0Gb6qAEIrcFo7
         AZPSkTPx0g5ibv3rJ3EptDv1ujgti7xqzKH10j+BFW1ZrAGbfQJpVifceADnP+fg5k7k
         CSrTLlkKJTXwRo8FG/5+iZng9zM8uPSHoo+ixTHL6dHYmLboaRGOTK98ect3XkFK62MK
         V1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787334795; x=1787939595;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5X2EWJjIO+3uU6HNhskU6QdvAMpHnR+u9hjOMlkEYo=;
        b=NG10R4fzWoVypZeVA9LiWWvN+HmCXy54D69bfrmDuO/+TbenoqKDyh59c6CcmRADk4
         /B0z45GpmZn+K319mFzkvq0zyF9EqEJdXZXgK73i0n+H1nSUyy20Zrt/kkuCDnjyOntC
         8Skm8BJMJnLgj1WFgGCeDkUkMDyBRPIgqUeLIzWwr2Q5XJb4JOdCO+uAXlmYWEXUoYx9
         xH4ONdUWl3T4G0oZZvpdUL8F81B/uJlImgdL8+Civ3oIhcUrCIqg8THwhDXSPgwmJfW+
         ciCq9sL+PWtBeELeY8I0L0FXNJbUWRD8rFc+sK6YpGylsugQIvXBsS3gWUHtraOWwoVi
         7PLA==
X-Forwarded-Encrypted: i=1; AHgh+Rrgj5uDVJOj/XvNdqrm30I2TVcH+0Cfbck+VK1S5p29CGtCBlLDslnWVj/cXGraMVMHnhNMaKZhtwlhLSEbh2U=@lists.linux.dev
X-Gm-Message-State: AFuF++k7MGF1ag+vXzcdXaRLW1aeNxGoJYIcEUhkGPMqBL1gK0wM6d/3
	j8CFV2SSv3Irc0SRwDDkd7XBhscHn4vvsCbwZIR76I1Npf7xpgbP2c/w
X-Gm-Gg: AR+sD12Pta9JiKzIOuQzryXXHZX5QUk7si0xAopBugnF9wg+YufrWWqC3SghwAixrJ5
	ZejuzAj/AFQ8FSqGlDWA8BVOf6Boh9JilDxAVw4bbPoK4URjHxwIO6Yo6i6tsC1DyD4kUe4Dy+C
	OTvgE1PBJDTjfO6uMHQn4FmITaLv8mC3h3uezjmaqEea71K7U68YLVtg4Ll9A3UvwKycmS/kGam
	xpnbfNsQotIk00CeVFaUomc20FE4KcUIOpNj/rBGGI5mBUVO66/zHJ8fORU8vix0d7z7JF+NI8H
	AwEh88FtG1Nu0T6disLGELW3hmcOt7bhB8fhbvXZDnOuUGPlGoRuJFqwJtx8lAZWDdqqvQ85UBX
	dzPNXsoIxmdsfy6enPgrQIi7JTR12z6BWWSiM3UVcz+LnRWjxXiiR9QXqSPMtHORxF9A2Bm8gnv
	LLx19rEjvOoo7eNJmsV518m+bYIEAdzN2IhN3J6fZSjhZ0G7v641D2yGpSj23CfNuDN5XxGOXJZ
	uzEwYzHkFVpv2KX
X-Received: by 2002:a17:90b:2c87:b0:392:7f74:58c9 with SMTP id 98e67ed59e1d1-395c3a43766mr16440843a91.15.1787334794978;
        Fri, 21 Aug 2026 10:53:14 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be47d7sm3987378a91.9.2026.08.21.10.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 10:53:14 -0700 (PDT)
Message-ID: <27b3997d5c1920db32650c554398feebeea6f0db.camel@gmail.com>
Subject: Re: [PATCH bpf-next v7 02/10] bpf: Add helpers to describe the
 R0:R2 return register pair
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yonghong Song <yonghong.song@linux.dev>, sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Fri, 21 Aug 2026 10:53:11 -0700
In-Reply-To: <b6fbcaf1-295f-43de-a794-7fb546fd4785@linux.dev>
References: <20260819055239.3293449-1-yonghong.song@linux.dev>
	 <20260819055249.3295283-1-yonghong.song@linux.dev>
	 <20260819061746.0DFE71F00A3A@smtp.kernel.org>
	 <b6fbcaf1-295f-43de-a794-7fb546fd4785@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-08-19 at 08:50 -0700, Yonghong Song wrote:

...

> > > +static int bpf_compute_subprog_ret_regs(struct bpf_verifier_env *env=
)
> > > +{
> > > +	const struct btf *btf =3D env->prog->aux->btf;
> > > +	const struct btf_type *type;
> > > +	int subprog;
> > > +	u32 size;
> > > +
> > > +	if (!env->prog->jit_requested || bpf_prog_is_offloaded(env->prog->a=
ux))
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * Skip the main program: its return value is the program's exit co=
de,
> > > +	 * read out of R0, so it never uses the register pair. An extension=
 does
> > > +	 * have a real prototype for subprog 0, but bpf_check_attach_target=
()
> > > +	 * refuses to replace a function returning more than 8 bytes.
> > > +	 */
> > > +	for (subprog =3D 1; subprog < env->subprog_cnt; subprog++) {
> > [Severity: High]
> > Does this code mishandle extension programs (BPF_PROG_TYPE_EXT)?
> >=20
> > The comment mentions that bpf_check_attach_target() refuses to replace =
a
> > function returning more than 8 bytes. However, for extension programs,
> > prog->expected_attach_type is 0, so attach_uses_trampoline_retval(0) ev=
aluates
> > to false, bypassing the size check.
> >=20
> > If an extension program successfully attaches and replaces a subprogram
> > returning an __int128 (16 bytes), skipping subprog 0 here means ret_reg=
_pair
> > won't be set. Could this result in the verifier failing to enforce the
> > initialization of R2, potentially leaking uninitialized register conten=
ts to
> > the caller?
>=20
> But the comment needs update for this version.
> =C2=A0=C2=A0=C2=A0 bpf_check_attach_target() -> btf_check_func_type_match=
()

Fixed while applying.
