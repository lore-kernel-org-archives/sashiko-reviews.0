Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE59370AFC
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336879; cv=pass; b=atO0a75bYyOrZS4fz3Yd8euKmMWmH6QQhlswLNE/rrzreaTiGvzcpycygIVpjZ+Z83sdWFd6jkJzfjqdVdWJHDPhJfREfLXc1oy+EFPPZafWMhqmCk0OifXzq+My7kUn45UNtfqMllb+M7V7P3NTnDarHzUhSY5ykHVdaqrv5sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336879; c=relaxed/simple;
	bh=+c8yIMrlDM+qUzZxuCRwA4fdsp/cuOIvaXQsFKyMViA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQMxrypk3jliCAttXqf+B9c2WHByYnyB2/tGEteKOp6rMq/0aUKR12dqX/TbYLF1a/FAu+TtPiN6WBhdE9oSLGV/6vXBe6n8AYGe3F94QBmXkMmO7STL4cAodU3U1PMJUpl0wwn2ytHDnQarJRp9RHZ7Cqr1MHQZlZy35x42/QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1b2QLZb; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1b2QLZb"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-777ae5e5caeso322579137.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 01:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788336876; cv=none;
        d=google.com; s=arc-20260327;
        b=NajEy5jCXraizbl1k2HV77PFXK7DkBk7SS44zV1gkXTRIxEASKTfvKOBsWxyEx1opO
         P0qzA9aE0v+M1Q4Q8oSiNE6vlSKSY+HF4mB40Siq+Re1l1eN5WhOEL7a+cp0wNL6lxtf
         uJ6aOUiHtKa4q6Wl88gRFxarecmTEb1DgiBT8aYKMfjm592jWesJCazRt7tG9AaIn2kC
         D2EFpsjXEcDdJLGruNQHkChnV3wPmJqz/xlgSt2wbiEIrbZ01qjxBKxqnAZOqyrinsFE
         qBRF7gEiw9Denmmx80sdLfRi9eyRjVwnrJy2jYNCUOlvyqB1BDl8+4WU9AQlXTpeCZqf
         tJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tHj5dQ8OvL8pomf0qCLtJN3kNWsHoYdxixHEmUsE5w4=;
        fh=vz3pN3PK/bu+NRXdfIvIk2p5+cHuimYs4qHOOK8kDks=;
        b=q0srCFjWAdU/lhcg2daUugOAeuowhUyP5PgGvzDvBRwwqDRNuOzupaTBhwOD/0iRYv
         6KAgqWI5EP6FvelC3G/WZWaWoqPKjNxqo0cEibOq3wG/F3NjgLPFPBWYSNOwVbQnE6/T
         OMKwJDv0bjoLECb6AtbGsW7HAotDu0Zuvleg86/9WYEGtD5aHN/bPJTzQbJL2XwRfLf9
         YL//dz2uKAxFSFED3T6y+mJyaG+v59CTaZYCHZ/bMtkNlafsXTtJVFuPBilNf19hC1Qv
         FC9oDyyat2Z+8VL7FiJRyA4ocD9WQl3eC45kp7xRl9E7MyKvAaGrS1EN6SwRCuI1EWgi
         7ZBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788336876; x=1788941676; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHj5dQ8OvL8pomf0qCLtJN3kNWsHoYdxixHEmUsE5w4=;
        b=Q1b2QLZbunkd6bE8MQax4UkAXo3XKsHMsg3bprMIZsSt/xoi1xyLjlX7RTRur6wFPp
         WuCXcE8LhG+7fMzlOTrp+BJ/MmmBMPYfxoBNPicHemI6Q9NwW/16A853jmqCFJYytqC+
         vcJhogrqWzCVmk9qNt1KlFCS+cyYz8apB7wLOfusEpiFzdm7X6U0Vt9l0iN73hTpMnje
         fFK12m0pXV1k83pwmGMhQtTyXh6Irv7Z9iVvtm90rAN8kOaqkCmB81vSLonkec6fuCVQ
         WVJXgZ/f8Fi9Pj4d6fMDKXd2xka99INDQcoOZ+wkF1LpAIOrUE2tzAqtpsQHmFZrspxG
         J5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336876; x=1788941676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHj5dQ8OvL8pomf0qCLtJN3kNWsHoYdxixHEmUsE5w4=;
        b=jukiz3tqY/DTxLJ1UQJDi7nrSobPqcYm4+HjxyRVtx0EeeJdiQ0RNVy0kCah1i6rc1
         H8w2i2lzEYgGPVyQrCNolP/Hh3eOGxt4rryA5BmOcY1jG7zlNIAUkEqvwHONU63apMPx
         76iuJpqVWyHKusWRr0MGwRB1fPtUlTVV3Hh5eiJWwFOKomkYwiEoH29BJpBh52s92f1l
         G4o0hrFHL6dJZrhbDgKxZL7tQpDJFJ5h5hHT5oeXMEWoH3inKHsZDczuXfhX/Fn/13VD
         39n6dnHZgBeYqH0F4TU/TXAzhFcuzFtx+z67JB2dGQ4C/ZyduTGdHZ9sJNp1tVw7CyUa
         Bm8w==
X-Gm-Message-State: AFuF++nIvdMaethN9aGlKNPcDwzP9XwtRCrZCifHU6e1sQmq99E7ereE
	ynJcOPfh0NNOZzzAir+fipJGYou3PRtcD3IGgUR3n6Q3+TvvXywy/mbX+u5dRf93FLaUXMW8+nb
	PasuRgLQ34GNoXWFo4miicckqfFMFv/nVKA==
X-Gm-Gg: AYBFou0ONBbD0JFokpnNXvOior0wsVIDY0o3i/kSs3BTQaFbIH/UskI8JulXb9rjyWk
	GUvGT68YSjFHzQ1uao/mcektpACsqJzbJBpgtHzhKEFJNjA6MsFWDaMC43OiN2ZosQGzNhaeGB7
	zbsr3qq8iB/NMSbkZZOWOOh3UIjl3QkWnX5qDZyHWqYJka2w207gRxRjLfM4W0yfY/o4YmD1msf
	CcvaeTmBqTnBL2Qe2td/r+M8o3luMtIfhKX7kJ3iPwgwN6ZyM0ahRUqagib0Bpdvx4fHBGhe88s
	NEG1PUxWgrFgMgmjzfnxtH4s8//PcPHSx5KGkoWwr4YpQ+Y=
X-Received: by 2002:a05:6102:554b:b0:789:56eb:39a5 with SMTP id
 ada2fe7eead31-78a1f21f9bemr925356137.5.1788336876344; Wed, 02 Sep 2026
 01:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
 <20260901-anacapa-devlop-phase-devicetree-v7-2-0bd71d2e0105@gmail.com> <20260901122853.23E641F000E9@smtp.kernel.org>
In-Reply-To: <20260901122853.23E641F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 2 Sep 2026 16:14:25 +0800
X-Gm-Features: AcwNN1WiCJIawK0Ti208acr_E9oI2A5bdOdmfOqfl4p61ZvVQa6fWkwSBaLQipU
Message-ID: <CAPBH0A8g27oMqaSdsU6+itwLzQ9C2nwg1x5O1bEKtEJaXbdsJQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/11] ARM: dts: aspeed: anacapa: Add EVT2 devicetree
 inheriting EVT1
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=881=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Incorrect GPIO line name mapping due to a likely copy-paste er=
ror in the B-block of sgpiom0.
> --
>
> commit aa80bc774dd824dd074a3ccff2eaf0de685d5eb4
> Author: Colin Huang <u8813345@gmail.com>
>
> ARM: dts: aspeed: anacapa: Add EVT2 devicetree inheriting EVT1
>
> This commit adds a development-phase devicetree for the Facebook Anacapa =
BMC
> EVT2 hardware revision. It updates the Anacapa wrapper DTS to reference t=
his
> new EVT2 file instead of EVT1.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.=
dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> > new file mode 100644
> > index 0000000000000..be7f17ad5f8ec
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
> > @@ -0,0 +1,168 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +/dts-v1/;
> > +#include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
> > +
> > +&sgpiom0 {
> > +     gpio-line-names =3D
>
> [ ... ]
>
> > +     /* B0-B7 line 16-31 */
> > +     "Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
> > +     "Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
> > +     "Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
> > +     "Channel5_leakage_present_EAM1", "FM_CPU0_NMI_SYNC_FLOOD_N",
>
> [Severity: Medium]
> Does this code break the sequence of ChannelX_leakage pins?
>
> It places a _present signal here instead of in the D or C blocks, which
> strongly suggests a copy-paste error overwriting what should have been
> Channel3_leakage.
>
> If this is an unintended copy-paste error in the B-block of sgpiom0,
> userspace tools monitoring hardware could read the wrong physical pin for
> Channel 5's presence and fail to read Channel 3's leakage entirely,
> breaking hardware monitoring logic.
>
This is not a copy-paste error.


> > +     "Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
> > +     "Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
> > +     "Channel6_leakage_CPU_DIMM", "CPLD_BUF_R_AGPIO330",
> > +     "Channel7_leakage_EAM2", "CPLD_BUF_R_AGPIO331",
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-anacapa-=
devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com?part=3D2
