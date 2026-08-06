Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F28381EBA
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002472; cv=pass; b=By3FJzoOvmILm24q/M5gWWs/uUF79qkxLiA0hQU+BqICqzRBhpMu/NlL8yw1X41lNU6wkx3B7jkj0++rLGJQFJ8e5bXs34Kc8DtY5BPIvoQpymtFFEDZyIPFr7+07IbsBUlpmZC8VdoARjsJ5FzuP4fA7DMop4xvKO9SWDkphTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002472; c=relaxed/simple;
	bh=1Gc0o+/7RvPrQBeYe64Gfdce9NN9vPNc/pfa+Tldbcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pul+KlzugDMBAsTdMbz7rtBBHiJys9pYDSRf46ybeIAScycP+zD/l6+XtQY+ilmuxTwPEoprdicNQ4fA5/+y425nPA78WdUyZgHxYqs5S1w1GnOTSh5bksvFyB8MjNx8i2xgu17BwJFuuI76emPnaqISLZY0NazA6R5HxxL97bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZj9v3Y2; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZj9v3Y2"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso1122178241.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 00:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786002469; cv=none;
        d=google.com; s=arc-20260327;
        b=b0ncxFoVr5ZLBv3CXMkwKe1IJt+PJg1rBLbCvDCdhMeJNPDzTE99V0CMdHBWAa4AR/
         FXQXgmIAgvjnMqrHo0wXSgONsLs79tY2eXZzhmIMT3Qg19rRuG1NYYFhmK442qrMfJNn
         E+PWoUmOrD8RzSuKWpOs3XKI4W9iMUf+nOJ+8tFg0ZCaRAJT0fEUpZo87t4aCDT4llFx
         U5gcyzQFeRHe/7WNN9KRuZETijmyN/ecqBCg0MhruzJpIEXbjLziY4E8jvnS1iU1Pw/b
         yhYRpMU0Wrnq4msdcQfT5ISi23mjWKFRrzWOdU9aV1qLjeBuA2ehlqVRW+URmOwTwi95
         wOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tl7NIfRHqSjM0Xzgd5QQB63n5RUmzjWP9DBfv9ASzSc=;
        fh=q2oa1ekct7KR5WHTVsuodzZeNY7MhQ5926J4NNvSleA=;
        b=S05gcMLxjJVt5mny5l+N7wondExG8SAX+fjhmasa54nCmbfXbIdLoFwa52SLYG8mHX
         fBTp1m29phEOZyWfA3O6ZJy1ePURagA74w9qJd6XkIx9m30XhLH1/UlKvCkotT0q+Lnz
         vi6RxFGlx8fUMlpH4gHw6owzKlhGr81sQGtyGcHXKcbjkUdGb4GIQkuEORhcUwubnowX
         TqljndXS9ZwfXtbLy2kng1MhtIgOWXr7eNO39IRzGQFLac4scStwORthiwy9GTcOhRGR
         Fml1pyYQ6za8a1q5IdoO+1xsPvzerci1rCpT/McoBJPLoRQ5NOeDtjdUBy6o/rZHltOD
         rfaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786002469; x=1786607269; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tl7NIfRHqSjM0Xzgd5QQB63n5RUmzjWP9DBfv9ASzSc=;
        b=QZj9v3Y288KhlwqOi1aaUrXlLwOy+U56tdXf3rtb9ozvyQb5CcR0I2MYHNOvLc7fho
         DGIWFROKjDH9yY76YzgUofuC8YKrZwocSgOAn3o22ZxMUXCueamGoM6/+bfOTZ5iRJDk
         djHTClTx3O39jEeuD1M59eHS1bgDV6x2l8eq5Yogz+Rnbschm6yOFfl09aaK27C9aVyO
         dgL3s/CW8KzUszecohJIkn8D4PpDgf6lQWJsW5bYPs04R0xmUzMjSNUTxACgx6K7DI+X
         La1kUgAzPwBIE2slDag3JXH1OVLjkY8xe3U1VTw0KjuV5DczS/4xXz7qYflCbVIXGLNf
         ClhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002469; x=1786607269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tl7NIfRHqSjM0Xzgd5QQB63n5RUmzjWP9DBfv9ASzSc=;
        b=R1mgwaEQ9wzSvTPZmCP7WJi4snnM15+a7E7O3NaH7hCDnD6GS3sBm7qu6J51UxOIvC
         jmieL4/3MNV4LpKZh5WKwMp9dzNq+4lKzYl4nQbfpvgX81p/3ijduYlxH5nlE45nUG9E
         gadKWOI/hNIdys/TgT7N7D0gSgkDqx2uAf6DBp1NId36phbSG7Oqhi0qiDiRF9OG7Ohl
         WFKHWJyVRNKYk+wHY0sRjUOIWaXI2vwJ7pLqMWcj3y/gobmNW0Tr3ZDGGIpEY67c80kn
         su2XHrFJWj3Yp0oX86waauCclQ+576SfAALeutUcWLAupJKG94LTNL3zhv/pNWxMM28e
         BgQA==
X-Gm-Message-State: AOJu0YyrhOd2n/HSmjPsQinsI9avQT6hsx5ohckw5xI0INOTQOOtfBRZ
	gFCxfwtW7yuNXauSyFOFqPbhqLzmCXtJDq0rHcJwBsJOk2pTJeXNqkVdHgXpk8brvp3oTQIZnRx
	9WTSRiHAeC18G+XJ30bL7lOv44hU7O1lnZsse
X-Gm-Gg: AR+sD10aY/ZPUrPo8d3MYamdZI6QRI0cmyojxFbuspMfZUu3O3d48tnBmIWbSVhcr0u
	cES8ZODurGmkLgRni0e6DH+NOR6+O45iJOSdEFx/EpNn7szIkD6QlGwK8yrgGbeF4MC6MO0sXLO
	VRy3uew2WxUmokAIfr0SxW+hOHu7+ctxhUo9UFy4ghFTaJqNVCPh5T8WnJHdH+yFVchTNA7fl6t
	Lfi8UP+Bi1QPs6jr/eIGr7/F2bHlCWW/TriVUA8ZRQRN9eSjBcz7YluUZBQMARvdGJVDccVoCUg
	whxgJEWUR02TmCy118/HzqDknj85xDeRjCL5Iat6Tpy5G4rMdGc5Jv5d+Q==
X-Received: by 2002:a05:6102:3f89:b0:74c:7fd8:73eb with SMTP id
 ada2fe7eead31-760e67c876dmr4030855137.1.1786002468676; Thu, 06 Aug 2026
 00:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-2-5d67e0efa6c5@gmail.com> <20260805131843.451FC1F000E9@smtp.kernel.org>
In-Reply-To: <20260805131843.451FC1F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 6 Aug 2026 15:47:37 +0800
X-Gm-Features: AUfX_my7Auoq_NqzDivFDUdXsU2FHDJP1N9mmdPbEYLWdTv0eXwWmA3dM5aeCwI
Message-ID: <CAPBH0A9Op2U7THS6APB+oMvRJQp28sAU9+NaUTFoxLpDfEQBRg@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devicetree
 and point wrapper to it
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=885=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The wrapper Device Tree file includes a `.dts` file directly i=
nstead of a `.dtsi` and drops the generic board compatible string.
> - [Low] The commit message ends with an incomplete sentence.
> --
>
> --- Patch [2]: [PATCH v4 02/12] ARM: dts: aspeed: anacapa: Add EVT1 devic=
etree and point wrapper to it ---
> commit 0f5bca30c4e664b3bfec688906a2d297fbe5f884
> Author: Colin Huang <u8813345@gmail.com>
>
> ARM: dts: aspeed: anacapa: Add EVT1 devicetree and point wrapper to it
>
> This commit introduces an EVT1 development-phase devicetree for the Faceb=
ook
> Anacapa BMC. It updates the top-level wrapper DTS to include the EVT1
> hardware revision file.
>
> > A dedicated EVT1 DTS is added for revision-specific hardware while
> > keeping a single, Anacapa entrypoint used by the build and deployment
> > flow. The top-level aspeed-bmc-facebook-anacapa.dts
>
> [Severity: Low]
> This isn't a bug, but it looks like this sentence ends abruptly. Could th=
e
> rest of the thought be included in the commit message?
>
If I need to send v5, I will provide more message.

> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > index 1fddf3a5d1383..209eef65cedbc 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> > @@ -1,1079 +1,4 @@
> >  // SPDX-License-Identifier: GPL-2.0-or-later
> >
> > -/dts-v1/;
> > -#include "aspeed-g6.dtsi"
> > -#include <dt-bindings/gpio/aspeed-gpio.h>
> > -#include <dt-bindings/i2c/i2c.h>
> > +#include "aspeed-bmc-facebook-anacapa-evt1.dts"
> >
> > -/ {
> > -     model =3D "Facebook Anacapa BMC";
> > -     compatible =3D "facebook,anacapa-bmc", "aspeed,ast2600";
>
> [Severity: Medium]
> Does this change unintentionally break the device tree ABI for bootloader=
s or
> userspace tooling that might rely on the generic compatible string?

Thanks for the review.

The removal of the generic "facebook,anacapa-bmc" compatible is
intentional.

The EVT1, EVT2 and DVT boards are treated as distinct
development-phase hardware revisions and are expected to use their
own revision-specific compatible strings. We checked the kernel tree
and did not find any in-tree drivers matching on the generic
"facebook,anacapa-bmc" compatible.

We therefore prefer to keep the current compatible hierarchy and
schema definition rather than adding the generic compatible as a
fallback.

Regarding the DTS include structure, the use of DTS includes is
intentional and models the hardware revision inheritance used by the
Anacapa platform (EVT1 -> EVT2 -> DVT).



>
> By including a .dts file directly instead of a shared .dtsi and replacing=
 the
> wrapper's contents entirely, the generic "facebook,anacapa-bmc" compatibl=
e
> string is dropped. The resulting device tree blob will now only present t=
he
> "facebook,anacapa-bmc-evt1" string, which might cause downstream failures=
 if
> environments expect the generic identifier. Device tree conventions also
> typically recommend keeping shared components in .dtsi files rather than
> including another top-level .dts.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-=
devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D2
