Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389233;
	b=q4kmrpVO8q3jt8mgG+X0VBtq0cPACUInJCZgLTV1LoCAu14xrDoIHm2s1n9k3tutf7ka
	 S0UF7XMKc/AhWImThNP8RF5IkfIRX4A9ZdZNX2134CImWEMM1WkQVEuPQkkheNgcth7A9
	 xGtoFrhip5x7WZ01XKlP/WnvhDpo1yHcf0Krqlud3fTJYL7QQ6Z/bMQHsh8PBnb7FzhbL
	 hDG8ISggcighf1VxUurW9Lt0UBpLTwb4uq9AvYHiUqOF4H6jiuU0ezrV2IWT2Wi8LTfkb
	 Cykm1QQntAV9ul3vwpDHsZP8x+6Tn3dMf5AL2ECvQD+VT7pMdrSv3eNDASl2KR0dGEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389233;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Uqesg7WKqhC9WVOamLuXbk72+8gOLRbYq5v+fNOaRCw=;
	b=jAA+qnIWafmyZyO3zT48ZYnN7CRW7HK+2QgB4VUKyv4aEubf45YdvmQ9+9QOpNMoPfAx
	 yhENwFGmXeu3ilKLo65ACVY+qJ9krde5mbLwkdAc6fXhA678gSv9tCYz5r+o5Ga7En0Q5
	 8AD6fqexBUXHD68z1tu0pNohO2vs8b5iqMgGQivz109K8J+2N5rnxKG32ldpq/omjdHDs
	 2yRZRhskLEqyYD9yooVMe0kvYPEjV0vIH21AxM1qwFeCg8/c5QHBGp34/JAWZ+s4Lq0Bi
	 k5sQhB0miIFFWGzlOXMKPzoVxCdTIWNfloxiD9B751i0c1q/S1nfV3/giPa4WdHB2Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Np8Zt5tX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38AF606A31E
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Np8Zt5tX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816C21F000E6
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795389232;
	bh=Uqesg7WKqhC9WVOamLuXbk72+8gOLRbYq5v+fNOaRCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Np8Zt5tX5qnZeku1ZR7Cwn2mNTLssVPbLKbcAd6ZrqTa/w8aRMs/FQGgn/v/f0fD1
	 J8FtUnGyFnxZH+7aqm/eXGKe6xPwoGewr2vylyPiSHX2zsu+d1axARv3dyv+qID1/d
	 EzbjNktE9MSLkNRI06nVykRGSkU4w5T+qokh4jPUS52TsxnI/O0f/n5BhNa8D0FLLV
	 dCMoYPNEMPM8oGQHsoyin6LO5BPm4AFAYfrjKafPZ9jGJEzYXCxuPxLj8G/fnlWSaK
	 Bp2BFRK447sprWtNDo+bMV+1gkWxANTbxVRwkG5GdyPIKDHB2oTgB+CsEDNLeWNSRH
	 WPmU/FvjhuWcg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso3972512e87.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 15:13:52 -0800 (PST)
X-Gm-Message-State: APuU4Z9c6KEeRow8Jp8iy1/J2ispShj7ttWoz4U8foZA2JJtpYfcF4TI
	x2oTcEmSB7pVF1ifo+bw6Ei88NfSDxx388LrTlvadZH79QCk9knlp5pE/KbCAEvXVomRpqi3CwR
	Fkdgw6PJ7BXWuTpeLpuEIgM3ZdIbiomw=
X-Received: by 2002:a05:6512:b9d:b0:5c1:4a64:ca0f with SMTP id
 2adb3069b0e04-5c1bc81230bmr2927823e87.31.1795389231275; Sun, 22 Nov 2026
 15:13:51 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122-ux500-dma40-powerdomain-v2-1-8a0ebfc75b80@kernel.org> <sashiko-outbox-227882@kernel.org>
In-Reply-To: <sashiko-outbox-227882@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 00:13:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAmEa_xNuJO9qqLU6w-=1+sM=f5tqsEHrTgYCaKHcCvQ@mail.gmail.com>
X-Gm-Features: Aa3M54r5H93aTxydLJ0ujwPJoMIhlr_QeooGnZ_E_JrGc-b1gyBGpl2TAgyHuHk
Message-ID: <CAD++jLkAmEa_xNuJO9qqLU6w-=1+sM=f5tqsEHrTgYCaKHcCvQ@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:02=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dmaengine: ste_dma40: chained dev_err_probe() in d40_probe()
>   clobbers reason

Aha OK I should have fixed that too while I was anyway fixing other small
stuff in the patch, I'll spin out a v3, one moment.

Yours,
Linus Walleij
