Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25AD3314AE
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 19:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526620; cv=none; b=G9RwijgDZq7gH8n15xLjNFfhoprMdmeEWueupIbwuWvk32DpMtp0y3eEFEZqTaMlGgtjZvzKdBjcq75VrbHEB8/kcwpqE5CgqjzGCWGCcQFBZUdeQUYmUCSwKeua/jS6ynm+TXO6zG47j1f7NburEIDZWjOVCp8p8dMc4k9KGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526620; c=relaxed/simple;
	bh=sRmMlo88PHCt1PMd/WZ4igKuipi9RDqsCplb6Fb7Geg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZkcvCmrhVC51iw4LUFgOVcZKi30uWUGff+B7LkH5AFv7WNK/3gM68UtSj0sQmCKUwnoqr1ftNhjbyUs0YQ6QmT9QAJJEb6oAfR8EuYWaqwhW1zK9OTa40+UmDY4ac4lQa/1TpI3UfG2f0AnXDaieatQoUwcLthCYwRsRW1/NsNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHcGV0i0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHcGV0i0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc97653887so15210775ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785526618; x=1786131418; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0ewrVxMeqvBGGSPxSXtxhMuI7ejZHXlp4YxL17pORnA=;
        b=HHcGV0i0seJ2vb5c/qZ1D6j59qwlPpW6PxDPLTriHAV2hd9eYaQyp45b7QmoNz77po
         HCZfTYVl6qHTHkCFlTLNCNZy1T9wh1w8Uw8R7tsTG2CldjGpTvqK/xZ1nQQ/2ndRfeMu
         x5I4TpKJIIQnIsEMBSdwaSCQtjUIzoeQqT4Q3dk/ZDyOIcmPXDvzJte/7FS4Op2EMLqg
         jtLv+4jyG9KqicFwa6YJ1ckvBwZ3kTrxiPyahVvQBzAtitgJOiP8DLmCO9oW7VC2ueI2
         k6GtD5zYBOERM3rMMPkqjPwQySUMYHj6wgIU+wPpzcRd9TjhY+mXt8WMf5C3r7KbKHPv
         7zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785526618; x=1786131418;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ewrVxMeqvBGGSPxSXtxhMuI7ejZHXlp4YxL17pORnA=;
        b=m4xLTsVpp0lqpflIDzS6DLtOEO0jqLOSofUqjd/melEyP/dbftK2pKhUaD/SNl0JSk
         liVv9UT/nIQ7iQ+YpHzHYPzTvPJRMFWl9VYVjQ43ZWsHsDduSqDC+gWK7b1F71fitkBd
         qqRfhd9Hq1yPkwF5G/xLQTSqXfrEIh4g2wTQSPxQAy+lnrdRTI5e4q73UsABFKsjlj1t
         xNWN/O0Tf3l73ScCyN3DnYz/9ieZKMNbTLvsCnmpeAdmHGe21CwFvutKu4B8bq31V6kS
         UvmWY2RskOV102dCnLWeALQa+rJmObwaQHVF3FiT1UGzIDKb+pm9IKmEMAkj4c2ZT2tP
         cx1w==
X-Gm-Message-State: AOJu0YygTAk4q4uSwvptW1EiNKgy1FhbE/GwJfQOD58QK5aqQ0G5O0/S
	dkvbnxu+1I7cUB66ugBD2Iy4YKTTTnTJsYyfogXidnww9by1HYmj9qo68yDCvRtP
X-Gm-Gg: AR+sD12eAOrHTwDo7XWdAmT7oO+4ZzI13Io9Z0aGQHT3SD8qHd/yTChOzFTJ9UdWzb0
	Ain/1ziRF+v65c8H9HKaQOx+3aefxUo31ZFz5qrwl+N4XX1bSzyNudFbNxZ/4I9I2VEwI6AGy7s
	o7+oFqvhe0CmBGl/ehVfkgyQ3N/FJ3Imx2VrxOj5fBuy544rneclllIYU/lXqnORdfOeo9DMVM8
	l49K1fpf/r7SKyGpwZkQj1VT2B0nBIA68ERxGSScmGUZkjslNMC9VoQcZBraUPiZemK9vLq5Qrx
	Eug82lM8L1vfOSLW/T5eswwnEYQfXcPfe6vMfi+7g4edHDv7+3h1YXnV/wSefxkX2LvZEAoJ5PS
	5y1FJk8kEmvGDpISzBxZVUxI5XQIY2t2TAS/9BPyEqetNZQ4EPjcx1yH+fD2r6hZZQZi5O0OYw7
	5nSto2QkUO/liDOJzMxiCM9Qm3NMKpbwJ072XVhE5aqgvKdqQNzHiaNhJBNd3vKO56Gj+M5GMRL
	VRPLNfwDWAeHuoKXhwNNImYr0Xv2UC7JVl3ccdqVnOnUw==
X-Received: by 2002:a05:6a21:3991:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c92a9284f5mr1006225637.76.1785526617659;
        Fri, 31 Jul 2026 12:36:57 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:f5a6:d314:fc37:ae46? ([2620:10d:c090:500::5:7346])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm8920252eec.7.2026.07.31.12.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:36:57 -0700 (PDT)
Message-ID: <a9475d6a37b2569aaa754c5b2186ba53b37c405d.camel@gmail.com>
Subject: Re: [PATCH bpf v4 3/4] bpf: Propagate untrusted pointer state in
 commuted arithmetic
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev, Yiyang Chen
	 <chenyy23@mails.tsinghua.edu.cn>
Cc: bpf@vger.kernel.org
Date: Fri, 31 Jul 2026 12:36:55 -0700
In-Reply-To: <20260729153536.F3E2E1F000E9@smtp.kernel.org>
References: 
	<20260729-c3-035-public-bpf-v4-v4-0-8ee297e2346b@mails.tsinghua.edu.cn>
	 <20260729-c3-035-public-bpf-v4-v4-3-8ee297e2346b@mails.tsinghua.edu.cn>
	 <20260729153536.F3E2E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-07-29 at 15:35 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] sanitize_err prints the wrong register name for immediate oper=
ations (BPF_K) when R0 contains a pointer.
> --
>=20
> --- Patch [3]: [PATCH bpf v4 3/4] bpf: Propagate untrusted pointer state =
in commuted arithmetic ---
> commit 74ae77e327bede792130d0bf76a485d3ad9ef6b4
> Author: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
>=20
> bpf: Propagate untrusted pointer state in commuted arithmetic
>=20
> This patch modifies the BPF verifier's pointer arithmetic logic by moving
> the early return for untrusted PTR_TO_MEM accesses. Placing it after the
> pointer state is fully propagated ensures that operations like scalar +=
=3D
> untrusted_pointer correctly leave the destination register as a PTR_TO_ME=
M.
>=20
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index cdb61fab84351..fdc5fbb1f78ca 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -13707,13 +13707,6 @@ static int adjust_ptr_min_max_vals(struct bpf_=
verifier_env *env,
> >  		return -EACCES;
> >  	}
> > =20
> > -	/*
> > -	 * Accesses to untrusted PTR_TO_MEM are done through probe
> > -	 * instructions, hence no need to track offsets.
> > -	 */
> > -	if (base_type(ptr_reg->type) =3D=3D PTR_TO_MEM && (ptr_reg->type & PT=
R_UNTRUSTED))
> > -		return 0;
> > -
> >  	switch (base_type(ptr_reg->type)) {
> >  	case PTR_TO_CTX:
> >  	case PTR_TO_MAP_VALUE:
>=20
> [ ... ]
>=20
> > @@ -13750,6 +13743,13 @@ static int adjust_ptr_min_max_vals(struct bpf_=
verifier_env *env,
> >  	if (dst_reg !=3D ptr_reg)
> >  		*dst_reg =3D *ptr_reg;
> > =20
> > +	/*
> > +	 * Accesses to untrusted PTR_TO_MEM are done through probe
> > +	 * instructions, hence no need to track offsets.
> > +	 */
> > +	if (base_type(ptr_reg->type) =3D=3D PTR_TO_MEM && (ptr_reg->type & PT=
R_UNTRUSTED))
> > +		return 0;
> > +
> >  	if (!check_reg_sane_offset_scalar(env, off_reg, ptr_reg->type) ||
> >  	    !check_reg_sane_offset_ptr(env, ptr_reg, ptr_reg->type))
> >  		return -EINVAL;
>=20
> [Severity: Medium]
> Does sanitize_err() print the wrong register name for immediate operation=
s
> (BPF_K) when R0 contains a pointer?
>=20
> When an immediate pointer arithmetic operation is rejected, sanitize_err(=
)
> is called downstream of this offset checking logic:
>=20
> kernel/bpf/verifier.c:sanitize_err() {
>     ...
>     u32 dst =3D insn->dst_reg, src =3D insn->src_reg;
>     ...
>     case REASON_TYPE:
>         verbose(env, "R%d has pointer with unsupported alu operation, %s\=
n",
>                 regs[src].type =3D=3D SCALAR_VALUE ? dst : src, err);
> }
>=20
> For BPF_K operations, insn->src_reg is 0. If a pointer was previously pla=
ced
> in R0, or if R0 is uninitialized, regs[0].type will not be SCALAR_VALUE.
> The ternary operation will then incorrectly choose src (R0) instead of th=
e
> destination register, emitting a confusing diagnostic message.

This seem to be a valid point.
Yiyang, could you please special-case BPF_K in the patch-set #1?
Let's do it as a follow-up.
