Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792611487;
	b=wJEBxhh6qrCa8Tj7sUO9ncHX7/xjuRo/BIYUBH6qAY0xO+5z9t2/c4ouqx55c/c1wmHe
	 ryl7BcHxm1yAc0BhxQXT+mFmxnkyVFPSNVW6etyiTZ7afp/eKxy4K12Wy4y/tzeXv+m9t
	 HGZqEt9WszsSaxoSdJOgBWB47suhod5Hfm/bITRTkelvEiQv5hA+8tDma6zUsQ6X/oXks
	 rxwNVrpnYpa1fY6e+mkuhPo0jhX36XIKUJwxZ6nkRksP1cBp9dlREjs7m7ws1O8aQ4+Mz
	 Xm3Rma+vn8vlEZpnLlbWjE14RzyLa8U9Uhs09Y3/SF+Gpy/wn+UL4V184nT8F0jzdhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=gx7b9r6EmXrF49L/iJ9Gk/oxTO3zxiI3rPNkkxbsnYk=;
	b=Y90YOXVGMib/lNxVfp0IqF62SC+P236kbdBSOD9Yn2RvCjYvzK9cACLf7EJGiuXEEamb
	 AdJqsHjlNM3kZfyLgM3utxHZcX90UNmfDRGAgaOAreFjx5HGGEDlqOC6jP313KNCD8IQJ
	 iH7LPBp9vTddSVIh4VPSg5JR8OcMnVDk1Le3YRuad56xh5bhHMrrxi9wpUzW4dmEZWNXh
	 2ZPTlTDre6Mm25q9v8W4iLChBppw1MZXubO27oYSvG1acNKA2WfHq3vJNA2Y4RHWYtZTa
	 oA3NevKsHl17N/tN+y8CGodVxHPVuogi5sozbqacBrxpZ8GF9clyiGvIRWGmwWlVTVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=zt3rTAcZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2C4606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 19:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=zt3rTAcZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1079137eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 12:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792611486; cv=none;
        d=google.com; s=arc-20260327;
        b=GlqzfldLxOLcwQ8Uy2+rtuxZyzRjnihG4+oU4Ie42oPvbfkrW/5pqcJlDentMBwk47
         /EIspFf4tcmQu+Ju2WZYxY2A+iE1ZWxblSXWwNMF0da4SAcVe27pHLad3lP3gOlvkKDg
         RZ5n4oHZevZoN3q3b885dG9znXUCyxFn8BsAfNXxPun3PnOI7y4AfDsSPfjLkFnOdE5a
         fEOc9l7i+EY4vE8kpMcMrTm81NwEUiAOwkwrdsN+2Pyr3B613X9/1jUsvbD9USXEIQGA
         EoQictAqxHQK66O3x+uAP2blQnLrBYAvxL/nGyoSxRUhMnx88GcbaG1uyA9L07fP2bS8
         uj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gx7b9r6EmXrF49L/iJ9Gk/oxTO3zxiI3rPNkkxbsnYk=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=ZeZbeWAU1FsVbTyuckAE7UG1NS0o1ckIjF6wdMmkkX9WhZV+NU8JFwbxWui6YbAc0T
         kB+CtjgLNoQEJH0VabMdJliaXV8le9HooeKiZzg0SzeKhw5Vz5sYCZpiIFzWkDmg6WNH
         UeGa4rcws4J77vNexB6lbO31i/przC7AfvgsVbueoKMDkj9d7kW23ckk7sjDX0CksVwJ
         onIAjnWParWUfl/CKaPJmC83VhIKP6Ov+XngcoiLGBY3/2RzBr73+dYwEXi4sXQmtC9L
         xUp6UxTB4+RTHo6IfZkKgqLDdTYrE9XfiylM96Svmeo+5oPmsmsHXZcUAfR9HelRe26v
         vKtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792611486; x=1793216286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gx7b9r6EmXrF49L/iJ9Gk/oxTO3zxiI3rPNkkxbsnYk=;
        b=zt3rTAcZaslnGT9nhlwrugMBedvEGUfd7qDrzXMFY64peu8A6t4a9JCuLJx+P31oY4
         86I6armVfoO+/38+eljUSWoyWZMAB2L0+3EwZ3RuqkRmyoz90rGHtWxyV7CDbFr+KgdW
         cdcVyIm6XO65fEQ/95dMGB3GJMg0QEJUzBt/kmBQAFXLZkOBPlVtiETkgrM5CX/Ty80u
         J4djBmR6v9poHcnPP+6uZXO5DBJuICVlTcat/wSw6KoSopsQ5gt+NWZRCr7r97B/sVs2
         6v2lQ62xNVkNV3RMFBsXBNeOpW45zpe+TXnYmedfss2y8jnv/DGBzUIkftDG+a+lgR5y
         anRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792611486; x=1793216286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx7b9r6EmXrF49L/iJ9Gk/oxTO3zxiI3rPNkkxbsnYk=;
        b=bW7tIfsSmY+5ktBF7AghNf2Ewp4adK7wXkoLH74t6WHff8UuWA6RVGJb7UcAH4wMbW
         ivvI7g9rNOGl2G1Mj+lWeCpAfVeu+mDW8zOGaMlc7wcpBhsv8Q5ywPQOhtsqbtknwEOw
         gN119HD5+s1o0KEn2KGc16dTem752qT0E4LZ4tF+eI4R2IMAtxucF9g3DXbTcgohVvap
         PP1c/6aofYTC1W7YaXF1P5mXX1HIeRz+4A38nm741lfe0yio28YXh51WbcOHpu+S7df3
         oqSPcSJ05CJPkR+CMKV4y5oquh0TJgj0GmX0YcbXflp+UHFJyotMr3ZcmXCgMzGCFF7/
         AgSw==
X-Gm-Message-State: AFq9FYJUGWDjIufSeQkvdbC0WNRFDFxk3u+OkuU4bypAthmlcC3cJ9gq
	DbQSyRcC5RwfKLzQs28dO4AcOkuTtTIPJ3qtYEnr1jZg/T9xPh0SMXIl2+SX0Y9YtmsEW2mYPt3
	AMW33SImVF3wqSD++BrGni3JBcnIFkaz8FZxXDU0NivRezCwINI2Tkqea
X-Gm-Gg: AYBFou3K9wJ6Ghij67p+nvts+jPuSjPKy7pkbbD5Djd2xL2vHeAJlk3uJypfhbWfCjq
	Lu+Mtl/ldnZ247JTGxiw2QZ0riEsDlqdLiCaqi/sxYtF/Hi57U0RlvyDt8rwcmalKTIntqVGMv0
	Ocj2m55ue9LkyQl8ncpi5Wah2IdyAaUg/dRoBC2QsLIW4xnEVyFrTj0gA2nRPTCkWSlDjrTt0jy
	W6uPgY/FvoeQkJh0kIYkJspf1g8H8lLlilQeFusnunf+IUEeRz/A9L9QQCLU9wY3h5A6KLwzwum
	LaMRzED87MQ+MKAu2mDPpp6HgZnsIp6zdV5PRca1fgVrS9PJ5aE927LC6CQb/j4HZyWTt8lu59D
	r/xxxMm16NjjJlrDW2ijKNR5IHtrQCaeQGCgMa3CKil+kEs2hXUa16Xl1MVfCUhw+o4oOEpdTYV
	JWct/ZVh89Ore3AzAubhI0Zg==
X-Received: by 2002:a05:7300:d58a:b0:35b:9f06:e383 with SMTP id
 5a478bee46e88-3674e450e8emr4670388eec.8.1792611486142; Wed, 21 Oct 2026
 12:38:06 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016202909.1289496-1-dhu@x6u.co> <20261016202909.1289496-5-dhu@x6u.co>
 <sashiko-outbox-174921@kernel.org>
In-Reply-To: <sashiko-outbox-174921@kernel.org>
From: David Hu <dhu@x6u.co>
Date: Wed, 21 Oct 2026 15:37:55 -0400
X-Gm-Features: AclHuK-arAWvDrTZe7uApi0sMp8JPVVE32312fzqw2LiTVQd6LDBosGNwx8KMuE
Message-ID: <CABdL-LQR1iEdy27AYzBXHFx=cMhPqKbSa5++LM7zww=rPDM6eQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next v3 4/6] RDMA/irdma: Split CQ setup to umode and kmode
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> > diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/h=
w/irdma/verbs.c
> > index ab25445f38282..4b7e9c2d9cff5 100644
> > --- a/drivers/infiniband/hw/irdma/verbs.c
> > +++ b/drivers/infiniband/hw/irdma/verbs.c
> > @@ -2624,41 +2624,198 @@ static inline int cq_validate_flags(u32 flags,=
 u8 hw_rev)
> >       return flags & ~IB_UVERBS_CQ_FLAGS_TIMESTAMP_COMPLETION ? -EOPNOT=
SUPP : 0;
> >  }

> > +/**
> > + * irdma_create_cq - create kmode cq
> > + * @ibcq: CQ allocated
> > + * @attr: attributes for cq
> > + * @attrs: uverbs attribute bundle
> > + */
> > +static int irdma_create_cq(struct ib_cq *ibcq,
> > +                        const struct ib_cq_init_attr *attr,
> > +                        struct uverbs_attr_bundle *attrs)
> > +{
> [ ... ]

>
> drivers/infiniband/hw/irdma/verbs.c:irdma_cq_free_rsrc() {
>         ...
>         irdma_free_rsrc(rf, rf->allocated_cqs, cq->cq_uk.cq_id);
> }
>
> When one of these pre-init error paths jumps to cq_free_rsrc, wouldn't th=
is
> leak iwcq->cq_num and clear reserved bit 0 (IRDMA_RSVD_CQ_ID_CQP) in
> rf->allocated_cqs instead?
>

This is pre-existing, and a valid finding nonetheless.
`cq->cq_uk.cq_id` is only populated in `irdma_sc_cq_init()`, right
before sending cqp req.

Happy to send a patch for this, or fold it into v4 (if v4 is needed).

Best,
David
