Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F30C51589C
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755558; cv=pass; b=cKaqs2jxVXUFTDLqktXxM/vh9rf4PIuHd0LUHIZvwWknNRkT1CPDXTJg08U2HMr8o2Fj2MxrzopiC2h55AJ1SBd59Os+sYMfHrXE7UPkqfx6I9o7fvSVzMxaFxSsgW62f48V8Kcgn1Y02uNJfdU0qmHX3hc0GSxW9fIMcKxI8Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755558; c=relaxed/simple;
	bh=B8dH8j3d8XLDzSCJawbfImR14z+XNYtPHGcF4ZCRVQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K48VYQeR8PEhxcyVNAiJOYnnooH7URUyx7UU/o1KcF3nue5UYfVSemSpQ65XrBzT3sOeoUxCzEcn3NiO+kR4gynI1Z+jgWbit03eupg9/FfOAyoHo0VOrqoXdIhYFbng8JoreZ0/L7lqEIy/BRruU1Bi9bCjvGFq4rnY0uwHRwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNw3jl9e; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNw3jl9e"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so1512152a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 11:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789755555; cv=none;
        d=google.com; s=arc-20260327;
        b=ebe71l1x4Z+KTg/g2D5efza6Qa6rRIaKDuYlMWYzrsLlvWtiSlDIpslTdIkGF1xgrN
         ZsVJu6x/9g8taTIHFipb+8RxsIu98/SrANsQaWHknZjVymMuVCt9pFC/DLRpCHlbKWJ0
         JSAP2Rpl5t/u3RWF2rcbpQKDImKmKqMeRE5Z42y1VP+uSlEN5gfEvEiSLWt9UCC+CmMp
         dcEaVO9aDaDqPaY+I1fH8GHhAHW0aQAzYfc9V1PBNtc904TSVZeMF0BHpYjf96X03g1A
         Rqhn+hEDokZNliYeNzwr+7VefX7x/RIUuVO+om5mnodJU1yVbQhdxSrBW565rFJIboKY
         qwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lxXJUnL2aGCDPT+0B0LiFdakuJvQky3WO+D+mrk96o=;
        fh=dZD3NgG1X7s6kpr5hZ2U8f/WHSVkfsXTB6YiQT1XEfs=;
        b=KIFh3g+PNbwJEsCdvPcNFwlVWFk7PLMeNpaJXqT23LAvgez/FWTzrUPs+PxHOr+ULa
         PpK+P4QMWcbd2TpaK3/WaaqMSs76DIY+bGIwsj/LcghtS3olCZDLyuG5mOUmaryrOJwq
         fuED0dbYHRCsa0AIiqE7/JuFpJ+MAkOnIM5wnfjsEru5/kuMyj4or4CXPK22WH1Gij6e
         9DS8DcwMPOMw3XSDG+00lRjL+pgxE309nje4G5zAKzagExUYoJPWGRpmG1OJucw8zbaS
         Yu/I+A7H/ErkXq0USbwdyjneZkZ0+Nz5chWw/hUv0CCoELza2DjOCmRaCEZXS1dH03Kw
         pehg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789755555; x=1790360355; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lxXJUnL2aGCDPT+0B0LiFdakuJvQky3WO+D+mrk96o=;
        b=hNw3jl9eMrwdZmQQj5XNa3XlgtBPvT9LXp3NcruSeJgYRGlNuLwQLgePAb7c1Htb1h
         C+pHk5c5laQB37l4g3FiVqcVECp13cZqB3sHLQewnx4RmSO1CT/Dib/aC1ayRqfDnhQb
         RvQTdr9Sg3SrmJuq7Y/N9nRW/tPRae8wAqqkSvuQNALpsh7gNVwypPNNQAw4mHGagdog
         jXfpfJFVU67qk0hGXnfsMtf2wDofAb2pqNmjfJa5bRmuWqfAMKWuokMvLfocW667ZG2/
         2WNeH90niMd8C08mvRDTLR87EvH7bLBSd2g9fzx7YohgJR5ONt6ICpKEIQb4sbIARKYY
         vwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755555; x=1790360355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lxXJUnL2aGCDPT+0B0LiFdakuJvQky3WO+D+mrk96o=;
        b=VoPcc1OR48kPWFTgr+l2MWZuK2iuOnPboURsQwA4sABWExsmxvUEHx6PdYaXXGxheE
         iKliy71MPP5kYlgFcsQoF//kQlEI8tOumPqr9GdbhVQENDIIyX//HDEKs4JzspA/3AwU
         p8q8A+cu/X0a3r3H7W7NPVvJJJ4vx12pbLbTs+py/yxSy4H/ys7V0U7Z0B1RjF6BOpQx
         8MibysaFDvHEAZwMaCOKTlra6XRRpqPsfxNvFnlj58lNGqnj3PH3n/b3ioZRuFd8h1UZ
         /6asmr6XWMfmu6+6+Bl0fvuXJaaLMt/VB1usEp6XEPJyTXCRLFKasvfjpo64cLsvmDiF
         4Anw==
X-Gm-Message-State: AFuF++lmn8lyCt3rriwzZPn5GlVIWsCC18yszuOrmwbJjMkpWLPKhRPm
	OljY9w7o+sLMALa8roM6ZVe1ZYM9qVGjH/Ru85+l/k42IFEXeXXP2BW+TXAYfVfA2YCx2z61ngx
	bza2WvcBu4rzRGsTm3OazDif/badwQl9QZBID
X-Gm-Gg: AYBFou0k7LtHmb+vzZoeF2IEcpodXt9w19PC6BKLaUL0cHNCTnw//3HrRbELT/V7Gaz
	AAbOuyGB1zkM6k0CBnB1sNjbiAEBCzskY6Jvmf2oH4PeAQMCar6kR5HOwHj4cQdoaVsPrzNcQqw
	RYiwIBOuCKbEcZYWBaE8FTZ0doVCbu+UydJeylwVHhaR1feijpU1wimqoLahU8dDHuRc2gUS/UU
	SmKAuj5knzGgHHt56gHoiDV9JqFclVgjofVqVu+/lqsztOpu4VauhJNMr+uorVI/rX6+G0xgZWh
	qW+4ZD6OIm7upG/fkpq3s0d6nQQX0I+jjs74pKF1+/U5D/5hhtLrSeM1N+so17y7z8IX5r3oLBU
	gKQ3cAm807DmGFppUDj78zq76pqYcU+62P7C7flKfEQ+oqy+gfkn7RmrvCHj8mOqDUG07c4zKAG
	77IOwZZoA2HeI42bIGmz4rCirnLE96ifOCPcN1BUoW2jIwQVUa5vAEV6HqHKUfB/L3+sU8mwjrh
	iqH
X-Received: by 2002:a17:906:c113:b0:c29:65ef:b907 with SMTP id
 a640c23a62f3a-c2a157c9032mr318214066b.26.1789755554588; Fri, 18 Sep 2026
 11:19:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918175950.21657-1-rosenp@gmail.com> <20260918181025.DCFD81F000FF@smtp.kernel.org>
In-Reply-To: <20260918181025.DCFD81F000FF@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 18 Sep 2026 11:19:02 -0700
X-Gm-Features: AcwNN1Vsq01WUhvaVInIWSguLOn0V0MH48-XC3VKFbzajnMGmMZfA5TB6E39QAM
Message-ID: <CAKxU2N-t9vWTazxtC+dSd-SoV5cvS2Hf98t2J2WrWCZNNjH0tA@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: Enable compile testing
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:10=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] kconfig: missing PPC_MPC52xx dependency for SND_SOC_MPC5200_AC97
This was merged:

https://lore.kernel.org/linux-sound/178967135736.285745.8925263446043052641=
.b4-ty@b4/
> --
>
> commit 95cb68468081de8e2880323cb63c64d9da8626b0
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: bestcomm: Enable compile testing
>
> This commit relaxing the dependency for the BestComm DMA engine allows it=
 to
> be selected on PowerPC for compile-test builds. It adds an alternative
> dependency on (PPC && COMPILE_TEST).
>
> > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfi=
g
> > index 5dd437295964d..e23ba4982d7ed 100644
> > --- a/drivers/dma/bestcomm/Kconfig
> > +++ b/drivers/dma/bestcomm/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >  config PPC_BESTCOMM
> >       tristate "Bestcomm DMA engine support"
> > -     depends on PPC_MPC52xx
> > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
>
> [Severity: Low]
> Does relaxing this dependency cause an unresolved symbol during link time=
 for
> SND_SOC_MPC5200_AC97?
>
> When COMPILE_TEST is enabled on PowerPC, PPC_BESTCOMM can be selected wit=
hout
> PPC_MPC52xx. However, SND_SOC_MPC5200_AC97 in sound/soc/fsl/Kconfig depen=
ds
> on PPC_BESTCOMM but lacks an explicit dependency on PPC_MPC52xx:
>
> sound/soc/fsl/Kconfig:
>     config SND_SOC_MPC5200_AC97
>         tristate "Freescale MPC5200 PSC in AC97 mode driver"
>         depends on PPC_BESTCOMM
>
> This inherits PPC_BESTCOMM's relaxation and allows the driver to be built
> when the platform code is absent. In psc_ac97_cold_reset(), the driver
> unconditionally calls a platform function:
>
> sound/soc/fsl/mpc5200_psc_ac97.c:psc_ac97_cold_reset() {
>     ...
>         mpc5200_psc_ac97_gpio_reset(psc_dma->id);
>     ...
> }
>
> Since mpc5200_psc_ac97_gpio_reset() is only compiled when PPC_MPC52xx is
> enabled, does this result in an undefined reference at link time?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918175950.21=
657-1-rosenp@gmail.com?part=3D1
