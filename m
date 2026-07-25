Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AEA495E5
	for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017060; cv=pass; b=nvZu2hUuuDd5GJ5tkw/fYzWJe/KwUshPN1LWeVehCXdD8Kng1NVd0bEe3AM0ffMHhtq+gmMu+5SL+nANma3w45idrMWgxnuWeEqgPNpjYl6+YLzkbQiX6EMELTkVuPHnRvcxLsZ4C+ijD5rSV2V0BzZHtNAWCnKSoJt2cKehVlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017060; c=relaxed/simple;
	bh=EHOcVotzmswca7blERgdhlJds1/4RTVDDpMkg2edbZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7tp7WI5maHk+fwVihGKxr+q6pq+3o6MTp2oC1mhGT/IZkym4n2e5UEGz/bLM5NRZt819CEB0ihLoBF4uKqG5rmDP9xMD+Pfdwswmy2L/2RRbhQr//J2/gXC3XCekZ6SejMEb78E7AyhfuTUBmADLQiMo0+s0NBUtbWQIyFmQQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIaD3kuF; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIaD3kuF"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so2185117a12.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 15:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785017057; cv=none;
        d=google.com; s=arc-20260327;
        b=KbrIsDWIH/wloTaqcEuWU3k7fPB4d7Ww7CmtxhX1bxANUHPmW630N6b2Txk/P/D9ND
         OkRsbGFg4DUwAp9iy/xAZzPEZWR6mDyvQYOjwapvX1sJPcTiOYUDzoXtBScvz8ROFtQI
         /M4kRE3yhf7G5ip2ACmdo56AQjsZYSG20uiLhbpQ/KT705l8+IzyFU4MFLMAJgeHLHrC
         q1cQPBfr+SfF1hcZ39vBhz0SCw7WY78Hg3j4uejTJknjygaZ0jb1lPNJmuOTrbGGEMmY
         gdg8x9ZhxGkJk253jvsX7xbi6IECxTrvas+oQIebN8VF9QQNaN8DgRgrFUUobN9WW36i
         yc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uV2SviPa1CEOIwcRUlU4A8uP11ac2KavmHu34NNJkAs=;
        fh=vz3pN3PK/bu+NRXdfIvIk2p5+cHuimYs4qHOOK8kDks=;
        b=Q/5CBrZh8lkkmbX6PWGkUEsGABgt0IUfYN/XSp/AoNugFayFXtAPWlr+SJl/mCVcjl
         ltql4wIAJ3hD+itX2MzAcMW2zGh0hON0Z3CwMSVuiw3Al8DbLT7Jvo084pfedj3P5j7M
         LfkWxahCCsYSpAmtgxmu3MuIUHC/kvuVa1J89xM47xCr48FaCSczRvE+iNtqD8bwJqCS
         A0frYUizEGC3+NxUea9Tnt0nIu6L0JdjQc+/Z1rQRZhyTO+BrXzPW2rpUhRCgBN9z6mV
         0UBIa/mODNqLN2Eizd4LVQKNNq7u2tHROB5i+u9iznyo/7GBuMag716OJdkSgNnp0g7V
         D/+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785017057; x=1785621857; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uV2SviPa1CEOIwcRUlU4A8uP11ac2KavmHu34NNJkAs=;
        b=oIaD3kuFBOneowdd9lDocJnDbVO7qtDkMyKH00REEos94TOcofHRbr48EErCt1yPnC
         8FkRHqWj3Hp8imrxq03oT6syWzC4R/tJD/A9Z5RZhZSTdqTMmn8mIDs61qnodTp5YwiI
         U98/oBV5CkKIyFk1iku2BEMFwmI5V3igHAm5fUeBIEtZw0hXSWHskcQH8cMEeSkiqmie
         LuS5z5tOtRj3frcDUz4Z+n4QgL0nmkZDaZ7crGvlVAx1JhvOQBeDfalNVnGP/EcB3Aph
         Qr8PsVTrFD8TiIu+AZqma4h/BRXBNW/G1MYv4XtucXcY1DJWQvf20KtjjB0WRg4LkQ6s
         Hh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017057; x=1785621857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV2SviPa1CEOIwcRUlU4A8uP11ac2KavmHu34NNJkAs=;
        b=s8pfCyO+7HKW+gvrfY07C2Jc3HRkvJQ3NlmCfgmrLARpLn0rDCOQZhCMZr7GBWKP9Z
         NGUj/9PGcS0WW304kw1dgJGgK65bIXb8Brhp3V00zqRF2WgXw1rOtn13TwyaVponEaF4
         EfIQO/o48pDPp1IParvWZo00wO1h6s85nWhcWflTh6YwH66mYf6XDluilBydF2v3ELtS
         ceslTtugGvqNvKCySmZ8DfnxglnIKdxXeJopZJqpst+w9Y4bvtoTZLS8LBF6hyn0sG3j
         UAKNztDeuvXxpLJ7pDQfZv+7Hu8LQi/VyaY7Y43vOBhmb7HqZ6APKQofDtZr5oh8wg1A
         Hd6w==
X-Gm-Message-State: AOJu0Yy4ZJjBFW3MMhx9jHffWWwLPUyw1sblWsknMv6bJ0uZ1gphOGXE
	U72/5VdHhVOFn+vbkTDxfdz1qBuJ8Ri6TA3YgNvfYM8PhAZYo97hA6de8SDS69TV64qg3NRmB5n
	o1EvXcWmo3Q4GAfLfDgYMapKbB5FCDld5Cw==
X-Gm-Gg: AR+sD13g2C/pQGSb5isKJYqRW0aWH0l+iyYWNr0ZpDKV65ISrHujPCfSWoE+70NkORY
	L6TBh9SVCN8TsINuQ/czJ86Vl+OyzIHOs1oCYmZwJ6MWlpvb+AoT3wGwuJlbdQyq3ln1GI4lznn
	LhF6hTOVQZlu1Icf0bs1KpIuU2XTFIm2yzydo9nUyJHci3u5o7BBVCgOzTFjYtKkOJvQUw8EXz6
	QkK/rQ7cNh/3R0vAS9LUpS9mR/u8cNdNEBTfb2pE/QDYsFBrl0rMGxYB1NmUVxLvYlcovaHLQgo
	W+PDEPGphdicZya07cRCGlrr8lxh5HLGcMcFZd2oZa90J1HDYL/AqDvr5hopWeiW5WjMzTOFJ37
	ibeF5m3SqQakCaZe7N7e2HahhfJOqEV7D/Gf05F1BsUFN3ffgmrIlG8PsXwgStiL4REUq7i/H
X-Received: by 2002:a05:6402:388f:b0:69c:3ea3:6d39 with SMTP id
 4fb4d7f45d1cf-69fc1181147mr1270091a12.35.1785017056792; Sat, 25 Jul 2026
 15:04:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260725215722.9323-1-rosenp@gmail.com> <20260725220058.902C31F000E9@smtp.kernel.org>
In-Reply-To: <20260725220058.902C31F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 25 Jul 2026 15:04:05 -0700
X-Gm-Features: AUfX_myeRw5IGq3UI6EfkOOKMLXsB3UMp4GkbqGL575VjBHuPUCc25zRaWi8oaw
Message-ID: <CAKxU2N-vts0NV9HkfSLA1-CvzgnkAU23z7T4q1EHECfVx+qVyA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 3:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The commit message inaccurately claims that PCIe controller 2 =
has interrupts 0-4 mapping to GIC SPI 138-142, omitting the mapping for int=
errupt 5 to GIC SPI 143.
Quite pedantic.
> --
>
> --- Patch [1]: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second i=
nterrupt ---
> commit 61d1b598a171b93e277ba55c095b09aad8291a33
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
>
> This commit corrects the interrupt mapping for PCIe controller 2 in the
> device tree. It updates interrupt 1 to map to GIC SPI 139, fixing a
> copy-paste error where it was previously mapped to 138.
>
> > PCIe controller 2 has interrupts 0-4 mapping to GIC SPI 138-142. The
> > mapping for interrupt 1 was incorrectly set to 138 due to a copy-paste
> > error. Fix it to 139.
>
> [Severity: Medium]
> Is this description accurate regarding the number of mapped interrupts?
>
> Looking at arch/arm/boot/dts/broadcom/bcm-ns.dtsi, the device tree explic=
itly
> maps interrupts 0 through 5 for PCIe controller 2:
>
>                         /* PCIe Controller 2 */
>                         <0x00014000 0 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 1 &gic GIC_SPI 139 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 2 &gic GIC_SPI 140 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 3 &gic GIC_SPI 141 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 4 &gic GIC_SPI 142 IRQ_TYPE_LEVEL_HIG=
H>,
>                         <0x00014000 5 &gic GIC_SPI 143 IRQ_TYPE_LEVEL_HIG=
H>,
>
> Could the commit message be updated to mention that interrupts 0-5 map to
> GIC SPI 138-143?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725215722.93=
23-1-rosenp@gmail.com?part=3D1
