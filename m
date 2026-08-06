Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A373783B5
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 01:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979354; cv=pass; b=DfvfdLZRGle9c3iayTD+hzHgxrv5VDQR4qHDEcp/X/kgeuQqpAyeYvY8i+7LCdPoWBXmgMx1g482nTZ2psAhQ7jUY1rIlqTy5HIMzCgTbnUJl06sL//EhNLstuHZ30CdH7BIBv/NaLyvUinq86xOLtUqfq9XXS+xA8BHbaiLkwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979354; c=relaxed/simple;
	bh=DjWYmhBKtJJzERRUUW+D5EYkAOs1qhXbIqwsFtxKPfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZio/n7wbtdL+nq7/Y2Jw5GaoA0uXhOQjorrTWv4MGYaGK7tPKmWc7eeXapWZVkKvFe+2xRWpLip2KkbC9OMJcf+WsuQXGxt/uUFyFHCDc2vU+5LIfceqq5UK8zXxls8PnO3WR0GsmWnyjRUxBhcre55mXjrYMSv1Pavf9j5dwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGM9dTkl; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGM9dTkl"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-973b676e5f5so936179241.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 18:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785979352; cv=none;
        d=google.com; s=arc-20260327;
        b=dvMeXRJ6M8D9jtXCj2NMuu7g0vtDuR/eSDz+W1CzOuqM5Pd8Wk9NN7kvFiWIG8E0W4
         GKZfUcDflG4tLOa9wH2i6j2e+mY0xnq5nTUelcBMbGwBDFa4UlF/NpxDauFcDrgUFv5g
         /7V1t/+I4a96p5wrwOcWopg5Cte0eD/BMcMncqJLsnhOrnpb2YEGVlVY35HLnI6HtBVJ
         9WTNHVqfYdVeWkWlHHT8A9IkLYJ6QHhYIqPdc2ucxnwhOybiuFtvxpgynWw0pKCxpzTU
         rjHQjX28oxzGGpCynbrg1gn/D/cL9XymfvCJe9WSe6Gy5EZQu2GeQS1orGlZF4rPTrB7
         IHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QA49Za2VkvJvbOtqLvEZSGcnBBWne/MDjPHtSxdMZFc=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=rWyRZH5zO0q82i3LY3HHL1Xi3eXLfaziHWpqFK4wPQEMPgVIvg5gRe8YAjXcwAxgeD
         ztSvVjFjMjxhRHn4OrZcwuKiq3EvmRRsKynsYda+jjkxc1vOrCnXKMLqiDCBiaPJVeLZ
         0WD8r9PhHuHQ6qT/idFTWzLjBAiI3rwYKz6pjNVxXAByatUtlV/tNpwOQGQMPDKGRhMV
         9lQxFi2RUznQPZiLZ7tVHZbRCHYwiMS6KEy8vEuS7nuyFSbW9XDNAPRJPtlnk8HBkRpV
         Y+4YSzbdedlUHGngwL7RRCggxyljzyntuLL6viaOvlMvwXIDv/UUAL8JedqvS8ZC3qo5
         LhuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979352; x=1786584152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QA49Za2VkvJvbOtqLvEZSGcnBBWne/MDjPHtSxdMZFc=;
        b=OGM9dTkl8179IzfXY0Zt9PcLzbmgwdNU6iFLDKMHH71pqpdJe8ukynwWIdZAq8Ap+x
         dc/+h0HamGX9u2VllQX+F7Hlnul28EGzm1LCN7M9xoK9DRfuuzItdvR0+t3btGOplRv6
         j6Y6EnKSBhUdzf4wngH3odfLwBrnbA2HZaOPpqoIf3pTafQes0/vmJfctOH5T1vmd+Ey
         DV6IHmvfgTtP+itE6WhawJxcChTf5sN77toxj+qGRRVVdFGNiMIAkbfdd4EbJrXWWjk/
         26uBHxdME/Ryvz9rF/OQlFS1wQuCCgynICIygyclKGF6Ljz8+p5oEvKy/YpVlclq/Z4T
         C3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979352; x=1786584152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QA49Za2VkvJvbOtqLvEZSGcnBBWne/MDjPHtSxdMZFc=;
        b=Yx3TtT78+zbq4IRuNkh6OehOLzoCzNDe1l62VD7qokZZEIv/SYY/o9/7h4puYnoB2d
         CMdlW1iqb87NScscZkm5gUJXXUlrq1iGIG5/CS6wIaLSg+SDXHlQl3PYjiJ2BwsXDTK3
         3/MhNlajvLh/QE8uOC5thlKYXB0tQsQ+l+DIGW/fclz76OShD8CyH0HDlPsft28jVjnY
         jA+WkB7KXBjWEGCOLDQy5BzCDiN6dzKe2RFCFMjU1CltrgN9TaZBFFFztmu6UssHYPyl
         /sYBv3/rmA0mTwwcc793zScT86E2iygUWJjPtx70Crdn/mttJxdoCWJcORBcccMO4/wB
         6LDg==
X-Gm-Message-State: AOJu0YzJrzgRrIJ0IozQVUKn+uadmLpSV1eRwYF7DLFuPa2Zxourhr1M
	veHwWr2aDxi6cXNV6cE/zLDn9izR2vKBcpvUVcgI4obDiWNsYjIIBZk8S+9PZh89Erm/jfXiqZw
	4/8KpSZ3vXKx3tUUL6M1RMFId159dkmYpag==
X-Gm-Gg: AR+sD11Oqh+AOSV3fDoxtgn4buwembg1alDJfoGmcy3d/BRsV7dvmmuXxXcpkRbcnuT
	xrjIuwfee5JK+k1sMEEhRfomgdoc1a4bFLzXqcAAQLbTpbSEjws0+wtuQ0Nzh1kpj1+yuD3OC6o
	0wi9RmiW6opBSA1xYhv2yww5V8fvkP/z8tWfdo/LLck5QTCtf/C33tgDfSqm9Mf0zN5RxrX10CA
	7SOsQF+frkZwGAsbdziEgsrtYoKIUw4sVhVv654vHL7tQ+iaLpydEwtpOmqp698vhaA1cOGkZKe
	QN44VqX5dH3cTcsqGjxvnfbOx7d7xr1Q2yokOIXVFd7YNDE=
X-Received: by 2002:a05:6102:4246:b0:738:d6c:7108 with SMTP id
 ada2fe7eead31-760e76e22fbmr3291431137.1.1785979351864; Wed, 05 Aug 2026
 18:22:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-8-5d67e0efa6c5@gmail.com> <20260805132941.8B8F51F000E9@smtp.kernel.org>
In-Reply-To: <20260805132941.8B8F51F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 6 Aug 2026 09:22:19 +0800
X-Gm-Features: AUfX_myyiOvu3Ho0sO-RbG5JBiR5SgpMhvTveCX1rERMgnQv5T_zmcQpQkRNFho
Message-ID: <CAPBH0A9+K9XpjoA4r0M=CZi0NQNj8SuKOKRTwvjj-WmSLUhPXQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] ARM: dts: aspeed: anacapa: Enable MCTP and FRU
 for NIC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=885=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing Frontend NIC (FE NIC) MCTP and FRU initialization for =
the Right Bridge Board (`i2c10mux0ch0`).
> --
>
> --- Patch [8]: [PATCH v4 08/12] ARM: dts: aspeed: anacapa: Enable MCTP an=
d FRU for NIC ---
> commit dd43e6fac4e737bcb1c934de5c94c3846795897a
> Author: Andy Chung <Andy.Chung@amd.com>
>
> ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
>
> Add the mctp-controller property to enable frontend NIC management
> via PLDM over MCTP. Also add EEPROM device for NIC FRU and reorder
> the I2C virtual bus index according to the system silkscreen index.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.=
dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> > index ff393ad7cdb79..703284721224f 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
> [ ... ]
> > @@ -55,6 +74,106 @@ eeprom@51 {
> >       };
> >  };
> >
> > +// R Bridge Board
> > +&i2c10 {
> > +     multi-master;
> > +     mctp@10 {
> > +             compatible =3D "mctp-i2c-controller";
> > +             reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> > +     };
> > +
> > +     i2c-mux@71 {
> > +             /delete-property/ i2c-mux-idle-disconnect;
> > +
>
> [Severity: Medium]
> Is the Frontend NIC (FE NIC) configuration missing here for the Right Bri=
dge
> Board?
No, there is no FE NIC for Right Bridge Board.

>
> The &i2c10 override configures channels 1-4 for the Backend NICs but omit=
s
> channel 0 (i2c10mux0ch0). The Left Bridge Board (&i2c11) includes a Front=
end
> NIC on channel 0, and an alias for i2c10mux0ch0 was added in this patch.
>
> Does i2c10mux0ch0 need to be populated with mctp-controller and the FRU
> EEPROM here?
No.

>
> > +             i2c10mux0ch1: i2c@1 {
> > +                     mctp-controller;
> > +                     // BE NIC FRU
> > +                     eeprom@50 {
> > +                             compatible =3D "atmel,24c32";
> > +                             reg =3D <0x50>;
> > +                     };
> > +             };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-=
devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D8
