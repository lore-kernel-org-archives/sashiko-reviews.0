Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794436184;
	b=erQLrEP7PgS6NrlZDl6o8GIxSOYqcQIdVM0wDps+XfcLRxLrH1NeNmL61H1ymNxftRxp
	 G/z009U1SkFRbJkHi8y2a7EpKTxNsV249hZxlTkrha5ZsUb0uyUqF/iKUTo3z0LG1GWCB
	 LTysUmVC4urcIrp5qAVwGCMu7UIQxl0LJTnSBN2svldfsBRIJqi/1p4u15ZsoB9AI1qZC
	 oKAjU7k6zAowrqXLD6siEOr36281/No8mhovzI1efSTlm6X78PWx9Bn3ITYyptH+5nW3R
	 YIESK525upjq+fRRQmM978MGaP/T4egKxVkIiEmXJsBXYnaT/rjPSWFXn2TLBt54Rlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
	b=EjQo2oCxwcxkKBhseYAEoBvt5xyvoOiyy6p5WK4woy51HaEiz8kGGISUGd5Xy/ZyJ2Um
	 NP8lG5mD+I9o1fG7U4fHbT6FqJE96GRHMy7Kdkh1l78jR5wgOpYnXxEXRPbLkt0GpKxJ5
	 qCRN2iscnIX4bygzV50GZoLPcpfioZ6MOBHOmEpDiLKdbdB5peeLiiRGtdh7OC5oVhJ2l
	 MPQLuzJ8zeyyEqZLC78o2Hx9H5K3iCaa1yMrkJT9qpzqBTTjirStFOY/J0piqiuzcuJcE
	 GviuCEDcM8mso0yMhCNWyzBA4/KR0V4GD61+ybqr951rV2EkedC+AmE0ZJSvN7YmNVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsdXJCIt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED66606E20D
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 22:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED66606E20D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsdXJCIt
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso4436366a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 14:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794436183; cv=none;
        d=google.com; s=arc-20260327;
        b=LDo8HyU+meBQw+LxqmxqO5nHFAjMFRECRhuRNODjbrAw5BZEKV51nrB8/L4x4dIADv
         /UDpUT2bg6RqqtQ0Z/6e6KU2/RN16p0EDSHXglf4FRfZERSmn7x7dv6z3jxPnmEVsVnH
         edc+fWQaWDIuPY/FrN821I8zRX9QiFOlWMNVmLB7KgeaDsRmEWyigLSUQwR8jCRjlAh2
         uCU+aLd2PTvmxaDahlzpZugGgT2d/DF4ExTKaTUBRpBU22bK5+z+kp3A3GYflrgy9Uyj
         iPd7yoqR9ZrbvxHA+Llfd2PORcuDk5Qnl5MT9m/sB0//1pct5na/3KJMFTAZ5h0nyfCo
         uG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        fh=3vEt61QNJOheRnm9fd3Av6wBGJCAISb+cqsY1Q+5YgY=;
        b=Mlm9WAAh2x1/ksdJnT4uhlFPb1QVa3Shm3J5eEcu1TxDkIL8hhcRCkJ/3NtwuOxg4L
         2/wOXA3ubL8C9PkQJdbl4ywJpDaG37zymjWX4bfIQv5FINuBVdEWQzRm5DIyeF7m2oHz
         CJJGacy9pJd8Xw38667qIW5eaEwJwSBVc0p85I/GX6fZSuHG9I5KMste7UwglWYNhrSG
         qTb9xM5YMPagic9ZRPKv51Swafsy2gfDBmVE3hLi66RvsE4uvSJrdTqDOkW/LN7ygaT8
         jRtPyx86IvLWL8AzZvi4vZm2dHQOWZXC7z57vJJ84tQcflzseGcIJ4sGQypvcmroUz4A
         WpIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794436183; x=1795040983; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        b=FsdXJCItxQt4dcYQVHtP+jauYChedRdZk8VhrPwg0vVUqbwM3+Btae/+qElM8J526A
         vURd/IfcxTRxKpwDupzXUEpy9UXkrwmsdhUN/YCa8CUzyefvb1yCg3gzT742mZ7j6AAt
         0EVF4MsIFQXSFtcLolF69y9/bsrDifXM1PPBhgJhp2p1FMrkZhCvqIDl0gsF7XHM5KEz
         i/neyC4M0UuHJ4EI4MSCG4BtqEv8+qXHxJMAKn5KDThJzf6yBqCBTSnHph97ZDfqHIr9
         NDqgz0iGywOpmgCcGCoCdhxwLT6+GQmCjaevsymDHnW8iNpMCDm5d5BrfOAaT7ymCnDf
         DDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436183; x=1795040983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        b=ihabUi3hgegQ9LDyxiqh7cJwZOiKo5NBDenOQbOEtgZNrUWqg//GqVnxBNyjZ0/2+w
         Lz7B8zaiDX4QOSkkxiSQFAjWpCdsQlJ0xFh1r2bDRhlbqpunU3uPerc44JOCkUCrBh21
         gCKaSVppAkJDHtlTYnrRRGtYw5Og06sB/VRuMlAQoJ3l6pb35MqRnFgRS5PY4D3BJDoX
         Y8j9ifcCBrmV8pFuuAJFcWWoUwgQvQ/Lum+XAQLNywei/2oW9+1CgYAj0kBBT6mbMDi2
         szquVk3nJlOM3KDclklhzJyBPiZXYULOH9LpKusfWkpN/GG3c0FmGzFnAHR4vYwrPr4I
         mJeQ==
X-Gm-Message-State: APuU4Z/nu6mZki4ryw4PwoKPycsG4tjCobqpO7QrjMn4vrg3s2bLOXKj
	2e21YE5hfWLNpCsMRD4m6kMmI+GP14ybql0baRjVKwxoFmZAn0c10+p19BcwywihuRfHszb+4/i
	HHdmibwEF0cmLIS7X2QRE9eS3iTufq0glfRwX
X-Gm-Gg: AYBFou1+OP0vK/LtX0irbERvfZJLrrWGVzAlIJd5WYpIlwRyhXqhqNb7J6KufqUpVoX
	7kmW+StM/3aai18EHcaORm3ncuwsUzuAM6tuLJHBh5pkbq/3eVP+UKwP4istlaTwhIGRq16QnWF
	Pzmrq21FfR1kfiK89GjMtkBI0jyG3Mxl+qQZzv5t5B1GHgwK1KTHxxcVgubyZx7rjDq94s0Mqg4
	9z0PoSmAZXuSgJCv6ZmDK7qDXWAKoSHZqTqsl/GpwAmpY327q0FGARFh6wkeLQzy7vU/+z0NVKz
	IwKzwMmDDruxDrLco5uVv7CpQaHr2wi9usLyEbNh75Ny5l3kgtFCXNAvXbBc7xuVaQAIUUHGljE
	OKwvzGysAi6nwgR7rmnLYCbJVYkAXGcSBIEcBPY8JzmyUMQdGjX0NOupTHOPSs9r5w+DjITGRnv
	45Jjr1sq+AS+R0aFlLt642Pw2pc2BjPxOCI2+FLgVWpl8H9kMcPbCt/H30FYJ3TmqOfkh6t9yzF
	duaKdVYKjXoLqNn/2f1zUmxMBF4V42AC151CTuVvCdc0tP2jQ==
X-Received: by 2002:a05:6402:c6c1:10b0:6b5:962e:e00f with SMTP id
 4fb4d7f45d1cf-6b77780f404mr2255040a12.28.1794436182455; Wed, 11 Nov 2026
 14:29:42 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111215729.10683-1-rosenp@gmail.com> <20261111215729.10683-7-rosenp@gmail.com>
 <sashiko-outbox-209774@kernel.org>
In-Reply-To: <sashiko-outbox-209774@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Nov 2026 14:29:31 -0800
X-Gm-Features: AclHuK_NMj1qq8-W9ISvxeZgzbGMriIS_aT5l7uzjtRMavpKllDh5UrOmxBfjQA
Message-ID: <CAKxU2N-DMRg=Azrb1QRmLw4zBjij_fui9s8fubK_ystZAKfBfA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] clk: add a driver for the Atheros/Qualcomm ath79
 PLL controller
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] clk: ath79: zeroed hfrac shift in qca956x_pll_rate()
> --
>
> commit 423abf763de32c1b127032d8210181c833b02aa9
> Author: Rosen Penev <rosenp@gmail.com>
>
> clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
>
> This commit adds a common clock driver for the Atheros/Qualcomm ath79 PLL
> controller to replace the arch/mips/ath79/clock.c setup code.
>
> > diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
> > new file mode 100644
> > index 0000000000000..6eab4cd1a91f7
> > --- /dev/null
> > +++ b/drivers/clk/clk-ath79.c
> > @@ -0,0 +1,782 @@
>
> [ ... ]
>
> > +#define QCA956X_PLL_CONFIG1_NFRAC_L                  GENMASK(4, 0)
> > +#define QCA956X_PLL_CONFIG1_NFRAC_H                  GENMASK(17, 5)
> > +#define QCA956X_PLL_CONFIG1_NINT                     GENMASK(26, 18)
>
> [ ... ]
>
> > +static unsigned long qca956x_pll_rate(unsigned long ref, u32 config,
> > +                                   u32 config1, u32 refdiv_mask,
> > +                                   u32 outdiv_mask)
> > +{
> > +     u32 ref_div, out_div, nint, hfrac, lfrac;
> > +     u64 rate;
> > +
> > +     ref_div =3D (config & refdiv_mask) >> __ffs(refdiv_mask);
> > +     out_div =3D (config & outdiv_mask) >> __ffs(outdiv_mask);
> > +     nint =3D FIELD_GET(QCA956X_PLL_CONFIG1_NINT, config1);
> > +     hfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_H, config1);
> > +     lfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_L, config1);
> > +
> > +     if (!ref_div)
> > +             return 0;
> > +
> > +     rate =3D div_u64((u64)ref * nint, ref_div);
> > +     rate +=3D div_u64((u64)ref * lfrac, (ref_div * 25) << 13);
> > +     rate +=3D div_u64((u64)ref * (hfrac >> 13), ref_div);
>
> [Severity: Medium]
> Does (hfrac >> 13) always evaluate to 0 here?  QCA956X_PLL_CONFIG1_NFRAC_=
H
> is a 13-bit mask (GENMASK(17, 5)), so hfrac is at most 0x1fff and shiftin=
g
> it right by 13 drops the upper fractional multiplier completely when
> computing the QCA956x CPU, DDR, and AHB clock rates.  Matching the lfrac
> term above, it looks like the divisor should be shifted instead:
> div_u64((u64)ref * hfrac, ref_div << 13).
This was present in the old code. Unfortunately, I don't have the
hardware to test this.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215729.10=
683-1-rosenp@gmail.com?part=3D6
