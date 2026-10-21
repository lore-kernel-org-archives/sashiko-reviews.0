Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565458;
	b=LNOXJ/GQCy9WRySRmFEsfh68bo8FJuaXDU/UdZKDfFy9rH0UHNiALgeCDapD6mgL5wHy
	 dXcewBho657iMMaFP3nGpJ7EUWEvMiRpyxOL+yLsBMu83+hJr3WF05nEvvAsxRNz4NVxx
	 PFP3ZE9G53/jxwomsd+yeNYQvATrxq67nmpMeyL3yfc1zpTYF8LCULwagxRbhi7ha6w0D
	 /Jjato6fIlqhjOT6yDNdiIHZc0qnZq3TOEmx4T6WZLK89Qm4fVEz4X8zVAs7AC5ih2pAX
	 aMShBrQ0I9cv8zvDj4dbGJ1Es6Rl1Rz244yPMYdBPs+hG7bLhuFkPM0P/mLsjJUYB0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
	b=ONlGI72tXQHgcE3jiHgvNucOIXms8rMXKwN6TVHVbraK4MNTsNNtdEuIHFFJuhqpCtkJ
	 stutuMePf9s1+2pri0U64HvfFTLiL2jYlPh9auvCj9dQJs9skEndQGYELOWCtMHodO/6U
	 lE2YaYJ5TJARjUytLTsNfCUkb6N+V6rzFQJsMrGJrGFj9E+fsiIfdWp/enrAbCsNTEqvb
	 GrqqOI948ZeAXLa2xqIkVCwDxAIbZJWL0W63I1fTbRELFswrl+cTYbOb53hVQdmLf5zj0
	 E6I7/wSakTF3LaoFSouLNIDd6AD07ydFe9RABZSELmRBI+zdtp+JMWv80Cowp+pgOEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g80Jmac1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED63606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CED63606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g80Jmac1
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b55859245so5756666d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565457; cv=none;
        d=google.com; s=arc-20260327;
        b=R75eWNmyBpUwIfZz+ykCccX+k1fe+s/KWRwg7y9J5S/nqwh40kkv3Jx9L53TojBfi1
         0vlf/3K1SSyX1tHjvF6sXgWkjHQRp+O8nmC9vBbpTHnFC4P5sgLSVCXhM/rqFWULjr0c
         YsyADw0THfAIg+x+JCBpgeuya6Vqq/NZB7vcSUpag+yYWngoMpHgFLNlUokSE3tpulKo
         G0OhqLXjBz6/h8D5g1u8fFQSTu1N4avQnoZw7Bpd6Bzf+lP/ithBaB3AdU9hbfLlqXeJ
         YMKBM1+q/MuCqCxooVfpZGvDRzCtbbec3h5RI+NsieTrnbVxPC4WggjziByLXwxljNey
         Xr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=CrqWRiw/GSjpHS1n+QqDyTR1p9SgqC8bUP5A8GPQGPSuJi/YtrYSteQ3KIhB2/PPdB
         38lZxBpKuz1Ot1od5JL55VFVCkJQgYbzUrQG1MI6R7vILenTm/N0J6AWQv/3wbkBljt6
         M827eF+wp0jIaNyU1YHzlOA5iz7T/8e7uyxrl7XusrhAqcUwOkym7DR7K16DZeT8VD5b
         jSgpGOEIb9qfSLb3JiJA51rM7qK/xtCQ0NOpmnNlwiqNs9cAe9alW/pLm3ejKeZvXQgE
         5uPTPDJYcGOvr0bcMrx+BQdUl8umNhjBfgwXpaBBGxaiEhQWtl5zX2LtslXOvqyqXb4m
         tRgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565457; x=1793170257; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
        b=g80Jmac1DRf4eWKn3Vop8+wFJNy5ddCE7MEbGelbkScbYy1AVQyc65kOdL16b5eaOc
         WoWYRQ1kKii5fFOAsna/KF+bqSjb9KEXPN92MA+EfHbyPGOiR4M99jZ2yWNA43BhSzak
         TnoDUNxm1bbFJ7UMQaLL4o9pmnq0bOkFdcmToXmP6akxgEqPslTgmm73+vmLz2u04hJB
         SQ1uM15ZwPRfJ72tnzIcr6JyXgJ5r8yLR612qieFvohCbyeoEgRA3LHC9IPgSmVzPcfV
         PgTxGDIY8GYoONRfKB0kbfvvh+s4KiyRAE+73/mwwaF5jmPcF6tEiGrl6yMiexAhjhKy
         wUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565457; x=1793170257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
        b=Ook70C488ho/3bNO6iECKNRMtl0DTdOUnRa5fG7GGSziWtLgjyA3z2kyQ6QNS/Npps
         ap64UhlEADCJuk6ZdL2UH8J2Jgy0mLoiUbZoZK5SxTvmn+cUCZcy52VlqjypUX8EdpNy
         1GygNEmiA3z+N9b5HpzDDrDIrhke3vDHAe6jb6lEUBVIpbniGCcDNhNhIgej+XiGyCv+
         z9Dt+ENz3+oAWqAETh1qMBBo4MkdRkdILB7CS4/nNcvfwUWeRHRdfaEZzRv4PC7UCVPv
         7qdePPNIfBjL2YJRMtzNUBPUr1smpuXr58QkCCblwYNoKxgal1wVxi6jhyrQhg3cG2so
         pOMg==
X-Gm-Message-State: AFq9FYJS7SBdJcc1b4BNiQogLU3cKt3fCAKvAlTJ7kDYM0YEYQbjy7yu
	ypsyGRcN+AtUWfBMX4pbkXGskDbiGw6jxFd7dcmmb8da+fYZ1yaueM5KPVy52G+dXsq/xbVDrUJ
	MgFKyln1POjKeQtRESWATsV+4xlAi+p5uBVJd
X-Gm-Gg: AYBFou2MWYkUczWpfmzme7OR/+5hrxCSNYkbp0Kuqp/6W5HpHznrX5KDwZfIQVMu1cU
	2RiL/OwFMkEqLT6vgVnP2JuDOxDmI9LvUlyzV68LW36qaj/pbGthzNIy6UX8fNzPEC64PwhLwxd
	N+o2xSwjK++8fhhRAam2zGyINpeV1KEGagaXVESg4y1jPF7LQ8zgnn4a65dZk0jfOjl2oDO7xsW
	1ccIZm3mW4AhBNAp2jdXkOCaCAszmg8hnM95pvSLAODVAABtg0F/FNGeW5ZL3ut4s8n4i9B+tNy
	MM+ILRf3ls9OB0tCwdQRxxp351V952TPCYcYmLWCT37UTfa3mTDvwFwbfJ4dRtdiifxtSNbhRAZ
	8l6xNV+NByroXu4hbBE5Qvj9jjf4Ahcb5p5t1OA==
X-Received: by 2002:a05:6214:3bc5:b0:914:525b:8ff3 with SMTP id
 6a1803df08f44-91c12ee14ebmr19628896d6.23.1792565456830; Tue, 20 Oct 2026
 23:50:56 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-13-a0282524688@gmail.com> <sashiko-outbox-169155@kernel.org>
In-Reply-To: <sashiko-outbox-169155@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:50:45 +0800
X-Gm-Features: AclHuK8l-GakzbBBAFJIhdIP9XwIuXlTamlHLll5qwcy-5fawq88ReLULCKF1yw
Message-ID: <CAOoeyxU3KT25s0V807xFtk3Yo5RNqtOcADNm9dyxJijjRuoaPw@mail.gmail.com>
Subject: Re: [PATCH v9 12/12] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mfd: nct6694: uninitialized kernel memory leak in regmap_read
> --
>
> [ ... ]
>
> > +static int nct6694_hif_regmap_read(void *context, const void *reg_buf,
> > +                                size_t reg_size, void *val_buf,
> > +                                size_t val_size)
> > +{
> > +     struct nct6694 *ddata =3D context;
> > +     struct nct6694_hif_data *hif_data =3D to_nct6694_hif_data(ddata);
> > +     u32 reg =3D get_unaligned_be32(reg_buf);
> > +     u8 hctrl =3D FIELD_GET(NCT6694_REG_HCTRL, reg);
>
> [ ... ]
>
> > +     return nct6694_hif_xfer_msg(ddata, &cmd_hd, hctrl,
> > +                                 hctrl =3D=3D NCT6694_HCTRL_SET ? val_=
buf : NULL,
> > +                                 val_buf);
> > +}
>
> [Severity: High]
> Does this code inadvertently copy uninitialized kernel memory to the devi=
ce?
>
> Looking at nct6694_hif_regmap_read(), val_buf is an output buffer provide=
d by
> the regmap core and contains uninitialized memory.
>
> If a caller (such as debugfs) requests a read from a register offset wher=
e
> the NCT6694_HCTRL_SET bit is active in the hctrl variable, the driver pas=
ses
> the uninitialized val_buf as the tx_buf argument to nct6694_hif_xfer_msg(=
).
>
> Since tx_buf is not NULL, nct6694_hif_xfer_msg() then copies it to device
> memory via memcpy_toio(). This would copy the uninitialized val_buf conte=
nt
> directly to the hardware shared memory mailbox, potentially exposing kern=
el
> stack or heap data to the device firmware.
>

This is intentional. A read of a NCT6694_HCTRL_SET register implements
the firmware's write-then-read command, as documented above
nct6694_write_read_msg(), so val_buf holds the request when the read
starts. The only caller fills the buffer before the call, and regmap
debugfs never accesses SET registers. No change is needed.
