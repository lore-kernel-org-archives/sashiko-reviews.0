Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4996D376BF4
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783892113; cv=pass; b=ReflTP4glLIYsBtCGSWiJ9oxgEFlwp5ZXuPdMuy+dtuDKe+9h4CgCqmx9ZUTztj6GcAh6L09BYvem1WDNOyESg5j1g7R7yze1TvoRuQUuIeoryL1zBHxm8eatRHB55hPYHGYFlphpAp018A17HDhm89DkrJw011RLm2vXID/P2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783892113; c=relaxed/simple;
	bh=4lgjQbnrS1gX79OUu4QY4Xk489ZtNNQh3P3tnZi5bfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MMrsrK7qYvAyQ+rAR4X96oEPhVvqqAltU+iFA12WgTFIB4QtR0gFFZpXve0DiW5CXRrmkGcVCx/xADAZMjE790m78n7rZyw61dV6T0n0Iq8lUX9f0Jj1M8i3AHOLVpW2x4rC7T1+YeZFYxbg8HhqTeIu/UKqkoXZkNywgFYpqZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXGEllAH; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXGEllAH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so2245009a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 14:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783892111; cv=none;
        d=google.com; s=arc-20260327;
        b=V6uqewd39Vlmvs+q+0pTE6jB8c3iNA814LC639glY5cL/e1f6/Ez2eHzvQbpgVglOF
         c7a32aXx02dOtw6jrbWUPRowoU4qdT7dGTAzFq1hHCfNx7GHinWm5z3wO9TBWVw5VX1Z
         PLzODe8X4SqUiAmXv0fJOUP185lvuuI9EFN16/UUGWk4Qm+oZMbku9mY83xBhEHkyz8e
         n0yI77NplIfTO2p10Fwa4MjRhPFaf+LTpXUFiPobEOGBNfhDu8AR1Z2JTqwHrCeIU4l7
         FXRH9Ws9fjLSNYEUMsUc4YPVGKja6SFQqBpfJfccV8ToLrs1BPta3mx7v51EXxamKpD2
         Y6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H6svE1Y9gX08lxLl1PsQffGhAtCL3j44Y2sHWjx0HOM=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=i2DJoS40SDEBGh/jBe93tn3WYrjTrFOpbiluiVSUkSDFP/OhDJnPs2CpGIL+Twn/DU
         3/dudK0w2WU5jKQnevFCtZAJdQx2Gr6vfEuSxAH2w9kJQLpJcy/cS2t2EfZpOwUHy+7W
         rz4HXbWhSqJpp1kJz8PIArslihjRFCb6N8XVr6avDqDFIgFufnyewMHAoYwFqXYASlrU
         RQAcU/N/2ksDV0UxKo0D7YnQhfW92XzVdAlxOEbQfM2PcQf0VSJblBDVrj0VGu9aD1am
         +PaotmWuPMtxPEJ61NRcWpliHKn79lxLEUamOiaeWM7XpbwEBklo82BekZw9ET9CYu8t
         B6BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783892111; x=1784496911; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H6svE1Y9gX08lxLl1PsQffGhAtCL3j44Y2sHWjx0HOM=;
        b=dXGEllAHsxEAsnEaZVmVYEHTw7DB0k6xzhH6GmLWd6pkkDEGwMTE9eQIuIbit8t8DW
         fFgbYN2ue4ZYw9cr/FaByB9UF1luq0j+DIzM6VDS/Db5QYNraBXPnh3cHDk0aJXWSj30
         ULINX0/+nfX9rl1gH51jzTrGU29pYsCA9odnaV86PsIh8J7GwPhst9bbvPhDSdHHelQE
         32qtbgpcJs469ggWl7veK29hFRuWtLpqrb9TITRG9KizR57FzwFCE0JWRfTrEelKqyeJ
         6O+7vUvouLDJeUodtQxheh4vHrUG1WF6DZFzMW7XGa32Uj2MaP/6bbGYKUTb0Bbjym0P
         N5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783892111; x=1784496911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6svE1Y9gX08lxLl1PsQffGhAtCL3j44Y2sHWjx0HOM=;
        b=XlasYhIlnuZomeYibly1QM5epabSQb6i+nZjqZT45U2ir3Q8BQEpT/RyIcgg7l/9h4
         Tms840rWrRwpjBCdaxn+KRDQjzV5KW0EQp2R8L1OtZR9YTl9PaZfEK3ph2B+PjiO3AwZ
         ViAnvjMF9NWNTTFI3xV6w8HWcnahbQhlT9I6M8QYm8WZ6opE2oMyfCXieA5BEPMlP5z7
         u5Nj2k8Uzj4jrpLSdrgiCA/hNE/3PkK8exbFmlbCrlw2+77JMQo7jPYr1cZFVdo7T1qO
         u4pPVKddqQceTyLJxFzdTlIKbrDpBR/a2KbBqkalm5u+c6L++X6cx7PLXJtCWTGgLSSx
         BudA==
X-Gm-Message-State: AOJu0YwwZoj6ls2ECIDU2MqfFplDVL9DopbbqIbDw2bBKFzHeA4vsRRv
	Djg7ZPa0ZF017InCOYvusYkxMRBBCZMX+EuZ6EZGgUvMGm2S3h4i9LUn7leGwPHWLvxmaCS/OiP
	psRZNBKlh5ZAQrkqWta06mJ1665hFRx1vCA==
X-Gm-Gg: AfdE7clcFE7nkZMMMPLIf3hM3CdCZrbTfgXZyQVaHZMRrqWsAvKqKi8k8N/DCog6Mxc
	dJuVei6rLNl2hoifUVRqeaAeZfALwZ+2TVUpR+ZT9SzYyRqPlaX+VTiI9rafieFGQ/7asFHxeki
	8Wjpks1jFyLIE0/cXfoZbBN7ZvqfWl+ydz+2cmqZCFlCpZ82UDtnv+qth/QW0/uTp4WEJI4BRhS
	NyVCNhDG/63DyB9Rljci8UYNASaOPa4U8oGKAaToZkX56IMgd7kns3RN8ySaxfdqA7g6p2rPLKW
	Gz4yLJnMxiSMDgU18tV83MVUgBEQ9NfOuNrqgFGwjRyZgC030g7L+QPz9JOv+qFEch7aCrtGjq9
	qeNVOCMcFOZb2TDErayhF52OBklAQMcNNSZfJgaQ8EaiNYSsoWbC1li915+mEuH2VZIYQPkE8hx
	zu++4ylpQ=
X-Received: by 2002:a05:6402:13c4:b0:698:e595:a54 with SMTP id
 4fb4d7f45d1cf-69c5f22db6cmr2912144a12.25.1783892110564; Sun, 12 Jul 2026
 14:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709005005.1587852-1-rosenp@gmail.com> <20260709005005.1587852-4-rosenp@gmail.com>
 <20260709010212.3D7C41F000E9@smtp.kernel.org>
In-Reply-To: <20260709010212.3D7C41F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 12 Jul 2026 14:34:58 -0700
X-Gm-Features: AUfX_mzOo3NXEjUnMcIaXCByvIGPK_bkdr4Yrjobep9w2U0y007HAPWVmWixMJ8
Message-ID: <CAKxU2N-Z3TCN8axeFYw+dUCexukWqBoQ1PouPdPdWevuguXKhQ@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator supplies
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 6:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The struct device reference acquired by of_find_device_by_node()=
 is never released, causing a memory leak.
Not relevant.
> --
>
> --- Patch [1]: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator suppli=
es ---
> commit 737d149c64d97348e97b79fed6b2378d4f1a140f
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: helios4: add SATA regulator supplies
>
> The ahci-mvebu driver and libahci_platform request three supplies
> on SATA controller and port nodes to avoid regulator core boot notices.
> The SATA controller and PHY are powered by the 3.3V I/O rail, while the
> four disk bays are powered by the 5V HDD rail.
>
> > diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/ar=
m/boot/dts/marvell/armada-388-helios4.dts
> > index ec134e22bae3e..af1e81638f829 100644
> > --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> > +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> > @@ -217,13 +217,17 @@ sata@a8000 {
> >                               status =3D "okay";
> >                               #address-cells =3D <1>;
> >                               #size-cells =3D <0>;
> > +                             ahci-supply =3D <&reg_3p3v>;
> > +                             phy-supply =3D <&reg_3p3v>;
> >
> >                               sata0: sata-port@0 {
> >                                       reg =3D <0>;
> > +                                     target-supply =3D <&reg_5p0v_hdd>=
;
>
> [Severity: High]
> This is a pre-existing issue and was not introduced by this patch, but do=
esn't
> adding these supplies increase the chance of memory leaks during probe
> deferrals?
>
> In drivers/ata/libahci_platform.c:ahci_platform_get_resources(), the devi=
ce
> reference acquired by of_find_device_by_node() is never released:
>
>                         port_dev =3D of_find_device_by_node(child);
>
>                         if (port_dev) {
>                                 rc =3D ahci_platform_get_regulator(hpriv,=
 port,
>                                                                 &port_dev=
->dev);
>                                 if (rc =3D=3D -EPROBE_DEFER)
>                                         goto err_out;
>                         }
>
> If the newly added target-supply regulators return -EPROBE_DEFER, the pro=
be
> fails and is retried. This unconditionally leaks a struct platform_device
> reference on every retry because put_device() is never called for port_de=
v.
>
> >                               };
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709005005.15=
87852-4-rosenp@gmail.com?part=3D1
