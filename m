Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92162279DB6
	for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506876; cv=pass; b=Lww7rrxW0o1AUFmSQIPkdXPGepJRR2MVvG3T7WDMbAjqTPQoFOx93OkBVJsIcSqYas7DMbAkn90/jjPYvECGIFp2rb5jp5n7OwCGfHBkeZvqCNpdaW1jLyWaq8UtnDM+LjKkRL4aw+IE0U8PyuXHBSaBMBrB7vbn5vioQdIB/is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506876; c=relaxed/simple;
	bh=fRXLpqtWS107ISqvj9m9xqfBNcFxfHU43kRA6lGd1wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlVda8O8FghBV0m+3q19S4obVNn0LyreiOvERP6lGb2vI5Ta9vv4xZkEebFbJz6c5cn2cPczf6FaHNgMjSidbPwnzTtcobjHfylY3qIF9LPlpMJzqOAlaFC22XA9cxnzPn1DDqD9a5C6QBOjaKBT81QjjL79MqCz/7sq+sAfpK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=LhFcW/ds; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LhFcW/ds"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c7f11150cfso9356775ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 26 Jun 2026 13:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782506875; cv=none;
        d=google.com; s=arc-20260327;
        b=XgwGunDkAG7Q3Ndu09MiRYJ4Wk9xqCXhF/4rGCScTJhiClKjAG4fe9aY2QulawLZF4
         uYgqnm0Kh8YG/odWPUSAP2AXeaJjTA0+aLiR8wPuyp1bIss4ezq8kd+wwUEB4Wr5yden
         CBG78zuS2anwMxszuxs4Tx75e94bDPYUpkrCIzMIEksMPrTUqA5wqF+SkXxN5gAVpolW
         DtPYT140m+CIDvm5azIubOSc0dBoXj9BGO1yRiFEm5raCgt63FOqMwSoKrn9y5+n976N
         d2MYJc6u/MHplFusnzv5HOcJ/TWcU3RNXeLEbOZtwLuhkclCUzbW3k3P1WXbn+kRKOTo
         537Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sNLuqs8AENajSxrPRNeAARQCcGTvPkM88RwMuF6w8X4=;
        fh=rXpS7ZoNGj077E0weHvrjKFME5+RZVs0tg1GsovAsn8=;
        b=oFSdJK8rjIj3A1D9yWq5ITrXKMJnaPQ/hFZ3yLrEDAeMsxJ5VAbFra0k8pKdQG7v76
         oHHJPJtCVPNmOJqgi1cAQKd74m9V43tC9yUNOE5L5/tUyrZHjIYB0Q5oplK+JJZeAX9F
         XLcMowT79jIbFKmXASyGbc3Y/Jij3rHZ2PExS0cmWu0GL1aIUD4LXk6NmbPR7KcDbtpJ
         Nc7CzRVLp97hjPfycg+5igZYdxWflAau5AsaRsW1Z4FbuKkF35VROgm7nDUqNOYjJ+/e
         70d9VJFBZXeXBJD4+Bhye2oCN1XN1juoAL4fqXzC9J4Ug7m0jb345rYMau2Dzret0uQd
         v1rA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782506875; x=1783111675; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sNLuqs8AENajSxrPRNeAARQCcGTvPkM88RwMuF6w8X4=;
        b=LhFcW/ds0YYHqbq0IH2ar5vtQ/0X+x+4IX3TeXnsicy8m19Y9VaBwhZbJatnZu8yG9
         eMWmYV/bUx8RQdKSgyUoJOR1iKBfsjVpTL0a9yaJS5ygirnodr0dOfz8pT3rIw119tiB
         wPE0JA8u99ezX3vk+AcNo5PH6Oktle+p8EgdPO8qvrFPePBhfcZi3yzm15zd9Fk1C0nb
         JqUb0Iwqj/m8FbKhEp00gwRFbdXnjzyAyrnI+jyEl+uwEjOkgjJ8/xungvMmXaqDlo8h
         WmVJXxoyl1K47DKeQLSIlaVRrTEUs9y3+iYnAYLtWzSdywaCs6vzM4GWgDp6CuYbiKZs
         UjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506875; x=1783111675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNLuqs8AENajSxrPRNeAARQCcGTvPkM88RwMuF6w8X4=;
        b=jJaCERt0nCjm9sBiVoeCoksvcGf64id1EmXW7FJpHYNGj1u9E3HOOcL9wbKip94N6l
         WRyKfRLDI0pJPou+JPikAs7cEbQMRCvj60xsiLdIqVSXx97jvvGg1ukOUTOoxJb3RDoZ
         K3+0jM++Vp5r5mYaKirD8PUkKlaTkVbDIQ+Y1rjteh9gv3LhKlJea1GH2+ppqWS8c/Ys
         2SU8xJp8S+8tANxJaxGaJkIzgolapkdaR6CgAWISAYdFVjji7tW3rxxaO8oJZinVDJqC
         dhSYY+yHaawo6V/+MNEMdHmGZ3M5sztMfYnO909+vIjr31re+9h3bXJnEgjGghr+GrHw
         m0BQ==
X-Gm-Message-State: AOJu0YwOPR28pdELjK27SIXBTs0z9Dw1Y5OGs/OitojxxjlrsIJVkuAS
	li2BJGqh4Y4W4pzUeWzg/wumE2lT4QANaxGLwQZS5RZxhfAuRlry5wh6mR+/i8qqMOTwQhPRSJu
	Aag0qwbOpzXD7DmatsmUVmOmTBQlbiXVSVw==
X-Gm-Gg: AfdE7cnl8rhvmZdEh9InjQSw3z5RteJhDn+Z1dHVS9BoFWiS/I9Ktz6RjqCJT4tcHG9
	/fQNB3203Qm/a7yTMPI4C4uxlYN1MUHmHPaqm+Bz529aZ73LqPgzUTiqnJ3AmkxyqLlBiQoc9Wv
	sFY2+iyb2grnjqAqnE95zi6EinOLLKaMrAlo8fpjp+zfHXuc3yGBBlIEn71OoPh29KK21abxKJo
	rnaDz6gV60hQC3P6oENY2togh2u4jQmkZGu15v3mvLvxmhbboWSS1OLgmDtSHTNGkYvnMdi+Mad
	JKnQ80rBSjy6AA2dRCAi+TQsd7hYKg==
X-Received: by 2002:a17:902:ec86:b0:2c0:bcb3:86f with SMTP id
 d9443c01a7336-2c7fc657921mr81245665ad.6.1782506874711; Fri, 26 Jun 2026
 13:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626080422.4191435-1-christianshewitt@gmail.com> <20260626081559.6EDE41F000E9@smtp.kernel.org>
In-Reply-To: <20260626081559.6EDE41F000E9@smtp.kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 26 Jun 2026 22:47:43 +0200
X-Gm-Features: AVVi8CeetCkdMw8FSSJAzul0ZypuaM92e6F0OmO4razl-HqicBdqZsRoebx4nho
Message-ID: <CAFBinCA8bCvJ92refztTgZsA_PXCUi852B-3a5ytY4LSAncivQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
To: sashiko-reviews@lists.linux.dev
Cc: Christian Hewitt <christianshewitt@gmail.com>, linux-amlogic@lists.infradead.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

[ ... ]
>
> > @@ -68,12 +69,16 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
> >       case SNDRV_PCM_TRIGGER_START:
> >       case SNDRV_PCM_TRIGGER_RESUME:
> >       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > +             snd_soc_component_write(component, AIU_RST_SOFT,
> > +                                     AIU_RST_SOFT_958_FAST);
> [Severity: High]
> Does this introduce a race condition on start? In fifo_spdif_trigger(),
> aiu_fifo_trigger() is called before the switch statement, which starts the
> upstream DMA engine before we issue the downstream S/PDIF fast domain soft
> reset.
>
> Could this discard audio frames fetched by the DMA into the FIFO before the
> reset, causing left/right channel swapping and audio artifacts?
I don't think so. The sequence introduced by Christian matches the
vendor driver (see my other email with review notes).

> Additionally, the ALSA PCM trigger callback executes in atomic context with
> the stream spinlock held. Is it safe to call snd_soc_component_write() here?
My understanding is that ALSA uses mutex instead of spinlocks, meaning
this comment is incorrect.
