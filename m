Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794186644;
	b=TD91TtM4Y60vHFgM0CJ8wBVhGa+iVPXmqqWdhEIlknhDIQxGMJ8RHjC+GYzO+mPmPEHN
	 h3c4s41g5fBW5HSEIR0W5RWEuaAfvRoW6bSlq7ngv4yfJdeTp7GxQWyzzo5lOGMafTa3E
	 5lq/A7yWqLviI/JBlDmRxbn4IFtHVYRrOcSzAZxiWxgmsshEBtS1i0np8JGRtTo8v5AEp
	 7uQeOZ88n2mVY6n/Z4LHNJd0E2iQ4EM16v34vJdL5bwzQ+mwVMt8Pc85X8Sgp6QefjZ2V
	 ZcFdWu/ki+9Id7ydKhiNvJC0hqwuXjc155aq7tGOvFhYgDMpMxOcWlSaAjBMc9NYJeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794186644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ViE6dOq83VJv0E7qr5/6vevJTI5xlIvEnicou8ustdo=;
	b=f1WbVrkqubNiEusVLw2Lk+tpoOtpxwQHzcau4EQbOv6fmDX+3tW7YGDOYViKjUqKhf/u
	 s1CxGDb8shMkNHy4aCiLdUN1h5nRU32TzJ640Ant7yytA/9z/Qd5jM7wczQbJSy3vcatL
	 sdg7dxZAMdZ9pBVT9/oMnaUJWdOkYTdemybO6ek67n9pDWRaDad1sT9KYAoJ+ciF7Akh9
	 a6wB/2v5Kasy54XyigYSSJOEzeXMgrrISf+R8nB+ggMHQbcJNNrg41emxVg6zjUi0mF5Z
	 jrWjKGP32sbLCzePt4sKzY5xyQ7uIWvao7Rfxfm1VpJJ23okk8JHZdMta0W6UD55XSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4HI7fLg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F157606A336
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 01:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F157606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4HI7fLg
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso235646a91.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 17:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794186643; cv=none;
        d=google.com; s=arc-20260327;
        b=WWYikFxZeHpVSbj8O2LmXATpP43ovtA9osPxPdG6Sz7ifts7x3P6uIIdbl3uS7OnmS
         2wXxW0N6R7gga814J8EdvGecFQPL6ncc0ILcTKPoaEJZ6KXszY7p9rDrlRw34ZIbB5pv
         ME58qUdFd9VYAK6/c2DD544FuNZCEYz/hjnvBrWSYCR5b2nacWDm1KWzRwB524FIjnwt
         QMM9TyHdP6erwCn9naq7MXCEILpezoaxEmw65TEj0rDKqUBHbTUM7ERfRLoy2L9RTjYe
         mk8rL1fjI4aY6kC95ptwxqSZrQIw8gENMod3WcKLn+FKohAQx58d9rsOOLlFtaw3p4Ni
         JiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViE6dOq83VJv0E7qr5/6vevJTI5xlIvEnicou8ustdo=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=siksgFCDSLbRQADdbiOjkSYYo1wpGWUKxfAusGJAJl97/t1XCptpfpzfpqxyrqaa4j
         6jexdKztHK+wtvje6r4fkA0mMEx8oFFHmtm7l8r2Pqccf3rFtAI0nmVoLTS0uV4V7Alh
         ArSarTrfpZbZs0PZfmClDa61PzoAtz8nNUW2V56oN10/OP2Dnb8+Ex7d3NmsW7p+QyAf
         VuJ14xg56ojVQN9GyzTCGF+vb010SYm9j/IGT1RO40mMsx+WeLVRUmDBzUGGeb4Q620U
         EHJrvh8Bh/OnLC6tnqa02T3m/xmlx7n7Szq9zZkUPQ4dh6JFHUy3C8eQT+eNH43kLE5a
         NKKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794186643; x=1794791443; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViE6dOq83VJv0E7qr5/6vevJTI5xlIvEnicou8ustdo=;
        b=B4HI7fLgvfx1tRf4UvFZ0DoQG8J8AW2qhxBGVZXYe2gtMIodCutlampoEKbCttD4Wv
         qiI7Wh3jlBSI8fLKu+k8a3eNG+sieq/eb2pGwOJXTNFPCkMVEdeHrPnIndT364sWiBuh
         sgtpE6P6ejs5k9rR8ucobQ6SbIItW/GZ/Rcp6sH5GPRQMLrGJPFgwxbMpp4RY7OT1i5A
         rhjrbFUvSs7/YL49KM0nKdoEwU2ak7sqNYrSIJ5Ba0ZuQuOMA6X4f6neg8D6OF2AE5/E
         +arhQtBjQ+Jy6qma/JcJc2KXMHPbIfZ9NOH9qZE0Uj3CtySxXEX1Ly8TN7fk5Jp13A+m
         YSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794186643; x=1794791443;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViE6dOq83VJv0E7qr5/6vevJTI5xlIvEnicou8ustdo=;
        b=XiGo4MhsaoCOtnbT8LKYgGpHZ1YvluoBMYnyr5LxyQdPxkCjIVXYkhvUEOq67/NXj0
         62F9Lrs/T0DYNTr4U3x2fLps+cWvR4i72lxWw2H/yleGFicJiGRI2gZf8yiTbB4mQqaB
         otICfGU/osO1U9S7rH/2jr2JSAQRpa7+GggOmJL5RoIYk1WP6IfzyA+UTsvMUQREznd0
         nyrI92pTlMfNxCJlYtfnogDXK/cWVVD7KpNpXlWlsOXuMW0lSn82cO4qwYtgrYd2xi7G
         iZ14UlJwhw5Pg/m4eDZmwaE8voEoPKsGDvcZFmFJlScO319nDWRXbZFm/eJ9cRdIWs4k
         2k8A==
X-Gm-Message-State: APuU4Z9KuV8z3h55Oi3fBx43x2jfSog5RNZs1rDG9NBye+gMoBwsxZwg
	OgeygpTCzDdPeA+09b/MOqHnIsz97Oa4f3pFZPmbSyww4UTjsJgiO5c22/+1ekf/P+iylVcpwf8
	D+MsA2OXjegjInanr7HU0ovcCVciDCtLePXOM2PKwBQ==
X-Gm-Gg: AYBFou3R5Q7f0bmfCKg1uXiJy8kyynpY3j+hVNNEDMvm35cBD69QQHWDyHzI6KoJR6J
	I1PwezGSo4Rx/FFG/EN/rdxnUG0/+Ub2OWfNOmgRznYw++CCfxDLbO43W/FNTFOpKGYBa3D6WMR
	uKMbJdxHWxdYaogwsHCggJ9fetSv0zHYH/SQIoU9pP53dFskaAyZ8i2BFfJD5kArPNwdgcqj9Ty
	4wzQKb1pjZl/Ff3jiDgTVKGtcdojQbRwnJhYLl5ZQXJ4fopQPmnemlBETX9OdYFcxkIIMDOi+5o
	vKdRW1gKrFdovesz0taA98OY/y5J8luzEYHE04cAJOF12pxAIUFy7Q+R23ptzeR2bSgwIIbAzCp
	f+gLu2h2pLWend2+LfGMnqvXULgFzapZyAB2Q
X-Received: by 2002:a17:90b:4c4d:b0:3ab:884b:65b4 with SMTP id
 98e67ed59e1d1-3b12d5bdbf4mr2475698a91.59.1794186643430; Sun, 08 Nov 2026
 17:10:43 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com> <sashiko-outbox-204265@kernel.org>
In-Reply-To: <sashiko-outbox-204265@kernel.org>
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 9 Nov 2026 01:10:31 +0000
X-Gm-Features: AclHuK8f0tpwg1s6XLr9Y1Crfhrm0g7RIgUXtQn_BcDJ9hkDinOa0TB5VxI1eLo
Message-ID: <CAEo19Oh8jtyBZXWRs5a0g2N6tBvSY+=SoF_507Wu1SdmbBNpiQ@mail.gmail.com>
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"headset" was added to dt-schema recently:
https://github.com/devicetree-org/dt-schema/commit/bcb597bbb0c988b490fdd6ed=
08d023d6ddc538b9

=D0=BF=D0=BD, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 00:57=
, <sashiko-bot@kernel.org>:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: qcom: invalid chassis-type value in
>   halliday-samsung-xrvst2.dts
> --
>
> commit d2d9cbc7744fd9c3d95a63b1d3df85d5cbe99afb
> Author: Stanislav Aleksandrov <lightofmysoul@gmail.com>
>
> arm64: dts: qcom: Add Samsung Galaxy XR
>
> This commit adds the device tree for the Samsung Galaxy XR headset based
> on the Qualcomm Halliday SoC (SXR2250P).
>
> > diff --git a/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts b/arc=
h/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
> > new file mode 100644
> > index 0000000000000..6fcc1aaafd59c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
> > @@ -0,0 +1,218 @@
> [ ... ]
> > +/ {
> > +     model =3D "Samsung Galaxy XR";
> > +     compatible =3D "samsung,xrvst2", "qcom,halliday";
> > +     chassis-type =3D "headset";
>
> [Severity: Low]
> Is "headset" a valid value for chassis-type in the root node?  The
> Devicetree Specification and dtschema (schemas/root-node.yaml) only permi=
t
> desktop, laptop, convertible, server, tablet, handset, watch, embedded,
> television, and all-in-one, so dtbs_check fails on this DTB unless a
> standard value (such as "embedded") is used or chassis-type is omitted.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday=
-dts-v1-0-289114ab8197@gmail.com?part=3D17
