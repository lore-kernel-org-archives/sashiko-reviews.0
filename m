Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6035430CE3
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781332; cv=pass; b=Sh3yBMvCz8UizZ7/aIaFZwxniAwFYOyU9e8tqKDhoSNQjFt5E3fhR3exSRqjlYNykfMFjgTeVowTonUmB/fc3Mk8xPzBwEDzyE2zTzSnzh/dzXgvlvr7yY3JyVjV4XEvTanlm1OzCARt03JFqfmrE9xRCLxF088Ux4PmWD/dvrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781332; c=relaxed/simple;
	bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9tH5CBTaE9BI2AEb1Ujpwd4ju0c0ThCqfQYVDcMNmfruwjAXLP+AkCepFgvQ16tZZHkD17vrfMPoC3cMqoFvk3xj8xNiJxAPqjMmO/vvACYtTUKd74IDdcmyqmPlN4mzK9c2OzwF9dDeW303XPNjmN2hFMVDNWcAF2veRJY1ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6I8iuNS; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6I8iuNS"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0cb6e96dcso3049400a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 11:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785781329; cv=none;
        d=google.com; s=arc-20260327;
        b=ihK5M2lHoq5MzKj2hxrfpQk/8GAP9JHRXxypa/oSKEfFuGWVk7TXZWNObINUSDRw6F
         6xldJxCUcNb/bmoi3x+Lv4tzhK/Q/HWvHR9DfCYMxcDWT9tcC8n7ihzkocZdoxKBZFYK
         O9uwUlmYiKFiqtV5FHOAYatF5/+a0qvz5w7O0Z/knb8sVXKd3pa+lRNsRW068hc26sw2
         7T5EZfaN41MX6tV66cdXpSs3+PqfGHrtP855f8pO84Dx91lpDjO1/EbHXodayGra2AiE
         ABrcYytUrHKrPMaDSLVl3hxw2Ucek7KcbQgMoMOv9wG5k4SLWZgI60z9gBnUf93Ybn/V
         lyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
        fh=mCKC9j567DejzDGvNCXCOOLS6pElQ3xd5d3KNpk7Svs=;
        b=bKZuyBgV/YSFAYUbV7IqVlhUwYVdDzIrv2ahYu0lZE0Mp3CtMsa/X9/HiLTWkNTjEQ
         ++sBubE95EntkB1Z9s9bQL6mnDubdHlT2fWVWoOesWEIwIGgiQsUWKTV7xTYyOhqVVqp
         mnOK7USAUhjvcgi8EJ+dXKHe0FSgJc8ZJDWCujmlIMiVhzZn5/ltZrMYdLmSRkzeDj7u
         wan4+mnD5qjizQCS2XMNQBu9wtWSvdxo4aypB5Us8+0H0D533DD9VjEm945UZyyQ73Io
         fl7OZLEVAz2fB8wU8LsUYGzOW7Jz6EcSQCdg4FQhlk1afP8C8wTUzZ9O7Fex2WQq27N5
         YcKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785781329; x=1786386129; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
        b=R6I8iuNSoC5hdjeMhne2kxlTz8/E6Hhw/bPPQGmPDmLMk4cSGPRvrI/9HwEbk6mw7P
         1xITgj92pBb7KWjCZBnRROylM/rmRBgK+yE58qSooEAgazqIQ6imeV9uO1FqLGt/K0jd
         O+8KWXUPddlHx8edo8tL/WDrJGJ/pwU99uGlvFIhVGev3Y8ww6WknZzSdvfj+xWOJFTG
         C/sQX5gUgtq0HYxsFK7oQbjRpNpvnny7EvfmbrDsZfOn/UhgqIz+2+yzj4QmlZL+KWRO
         QMPhnKmHG5GIGfi4jmo3m0jrKaJNiX9+DWgAJUVdSNcmqGppJElP3Bxpwdk8sz9MH9ks
         JUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781329; x=1786386129;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
        b=fPWwdgPUgAj9r2/SlOTS1bgVjOSZ79W62Oza69exNb1UieYFnaN9bbPkiUfWWvDzIC
         KLBjhrlYWtPIAFzmCklzoypjHCZ2YrmGUdl8kz5ycFV4ihGuji5qdY0Mjx9LI6/sDZVP
         bKgZe4IsIjrbx/+X2rwukit2ilj3s2Yxw6GbxKI+7yl/dhfH8tTHqbxpU1h/6JFwWMu3
         5R5iciRdtuiKkJ0Cjxew8Jc3ygu9NBvSNQZ69zT4DrxXY0Qm9j3dQpBTGI636yjR7wsj
         Bex5r6Wt4X1Q2FPCb1YMw8E/Ac87a5H4DPqS4LDD/F9orhs9jHl4usVYok0fa0CsLVtt
         WWMg==
X-Gm-Message-State: AOJu0YzMXdOAb0bGEyt16m1Ep93ryYYe0gd6wlOliCZTWSJLE5sOhysv
	PPWth0UMe/lLUPHUn59AYRlqoG4ZtQT+Ukb3702Z4P1URoqeDN7OyaVC4zaEgm4GH/o37m3aVCW
	Pl0LvcxNEVYO2WRHlAR7YO9pvPw8Vm1g=
X-Gm-Gg: AR+sD11Cc9zOT92ZKOBxYY3ZIikLnxH8Bf9xF3sac4CpE9VEAkdcWSkndBqYsCmJk0h
	eOb+HDJqEcKV43D78bh+Qi/Rag2qBFDaJszth9YK9gQq0CnzMPiL308/YgmcNwR3iVIP5iaOCVV
	DhFWSYObgCkXPE1G5Hv3WB6/F9S67sOt4B4YV36K1tobCRKNIT1jLAhVRoG4T9HC9ZSjs3kL3+J
	PnINdKohC8sWbbvMgXCpxBxwwc8Thl5B2p8axUio9sq0GO1o6WyOjP8Y1w546ABBYm4kLvTwSFv
	VGT3gHBg/jKtcz1bzkxVQnkojXpkFM7UiznHKHi8rYmGooQW9bIR3gIVuI5GOkhCjeAdp0XalC5
	oN/01c32ppwDYFIawmYVsd2ot
X-Received: by 2002:a17:906:345a:b0:c15:df42:952c with SMTP id
 a640c23a62f3a-c1fe814f9d3mr623164666b.28.1785781329045; Mon, 03 Aug 2026
 11:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707175212.412699-1-dbgh9129@gmail.com> <20260707180553.78C7F1F000E9@smtp.kernel.org>
 <ka3af5qc63pdcvh3uf6ulb25wrsf6udjugm62ooxuscxvz6zhz@mbuivewege2k>
In-Reply-To: <ka3af5qc63pdcvh3uf6ulb25wrsf6udjugm62ooxuscxvz6zhz@mbuivewege2k>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Mon, 3 Aug 2026 14:21:58 -0400
X-Gm-Features: AUfX_mxg5JGAIlsbnyi6v5lSwC5pBz1uJRyo3H-rzUgbkZm2NvpqldQcxoYUhKc
Message-ID: <CACrCO_UUX_A+Z7uCsT9=JkXqqkG0Tp=n0rXO3j+KAzNxGRuVQQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: Disable stream clock after video-ready timeout
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Kees Cook <kees@kernel.org>, Dale Whinham <daleyo@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 10:05, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jul 07, 2026 at 06:05:53PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Disabling the pixel clock while the DP controller is actively in the SEND_VIDEO state violates the teardown sequence and can lock up the hardware.
> > --
>
> Could you please comment on this Sashiko comment?

Thanks, agreed. The posted patch disables the pixel clock before
reverting the controller from SEND_VIDEO, and the bridge disable path
may later issue PUSH_IDLE with the clock disabled. I will send the
revised patch addressing the comment.
I appreciate your time for the review.

Thanks,
Yuho
