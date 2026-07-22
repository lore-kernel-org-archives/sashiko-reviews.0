Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719B46C4AD
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734166; cv=pass; b=C/QB3M5AAmA3Q/ZEUvDV6cILSj80w2JH+/E6A6F7gS3ZhitkAM8FIPWJurOAC36rKdk/I+CD4MrwJBnILAfjR12q+uDkSpl4AwmssDhKB7e7CUUcFUr1EaCJUEsDGINNXqYS49PG5TXfVSWr1zM2LbQJctI/wJeMs9cWCsYFGnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734166; c=relaxed/simple;
	bh=om92Vg1MT06YPtu4FZa6UsTxYYkEP2jooVYJUsl6Wn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCR2113i32rbpJvi79kc4zXN4yLBox/9ADp284jN29oqo5Jp3PB7dBAR1/tjQuP/ooF/ibSXBbxeWiTvittP5dngCNyB43/qJ/gsHczpsutUHYsK0cezx4U4LwmxwD3a/s/+FyoOyx4qKZkCVrGQsCN+FzO8sCBV76i4SESoKbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l92BlLN7; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l92BlLN7"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so2113048a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 08:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784734157; cv=none;
        d=google.com; s=arc-20260327;
        b=pUVcgH7ZV3EjZ0gs/xKSvgya0BiPSRU0DrAAjkTNsUMuoE4x5uECmHvoEHhsskPsbp
         v1lexEcScRiBW3HlfBq9zuqvQY2AC/pX/nXkDtWe5IgySox7zTgP2X4srmjDLyW9lpTG
         TCAH9O1IZek28Q5waQiBTdnuXuEr9JV1o5H/kXcNNk0dE+UzGall3SwKwKM1q6vHI9t+
         j60bE9pXB6RSFZE6anXfJjBPaz9SRgTp9DEyEm/Os1eGQQbxZG2ikuBcILdO+3oxPVmo
         QZDyILMjg+5pV/0Er7zgQordVsD0eKQLBF7jlSXQtS0r6dNVg01ijl6LfCsnl3Isb0ms
         ODZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Aoj5jAfbWafkO/PX+megQ9fW1pG8YJPAHZMTkiGVzA=;
        fh=0fHHe6hyqTxr+2U4Mvy7dMhphiN2eoOFGiROZURMZEo=;
        b=jzBDaZtMwnNIpJM7/xLgG8RH0V5C9iizFeAj0lWjsuVbhmQaPqODE64faN2GS6sf96
         vKQ6a9XxGr9si1fiPnnWahsNERi1WKStSMkl5H4KuuSH9TAS7+ll+8vqO6h4cy1dbDdq
         TIbNcaovlSNJXPPrDS0zimwM96QrbP7QRy991NjGZRfvCIg14MM6iQPFV6oW6OLot7ei
         JA+Mg/Mm1A0zFDGwoMWn32Bw4kEw3gMttUx9wgzJvLqCnG3aMYcBttV69fcgLL5pKl2g
         yPWQ4239cG23faFotT7ESWgNjgVI9O5KK8UnRx117id5AqrChs7TuPRUF74PtvLLh/YI
         jX7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734157; x=1785338957; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Aoj5jAfbWafkO/PX+megQ9fW1pG8YJPAHZMTkiGVzA=;
        b=l92BlLN75gougtWVe6FNnkZBSHG/XMPInkPa7scCmAQhbT6Y92WIr4OPkutK0/g+BS
         UKckyP766YKMNYDdTHLe7+mrmolVBp7J5fi3zePXqAjF6ZmwUlP13SPA2BtIPizEzeXb
         jEBRVZeo6VMGUSW9g57uT77PMdTeXVAZkZOUU6YhN/eCKLDqiwSLgPFqatqevJkBu1dB
         KX8qECXDRWpcsami8V4sqLSQ2b8ilRBh+j5dslHbs3H5lnvezT1g105b2HDWHRH3uqU1
         mxKTSdPTsO/097LrpHlO9x2QgYKpYWoOLahaNLZaa1YbyhP5nWqXGqjApZrIMm8B4ukC
         cD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734157; x=1785338957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Aoj5jAfbWafkO/PX+megQ9fW1pG8YJPAHZMTkiGVzA=;
        b=rCgI345KPUvEwa3m9LMmQocgLpqz6t71I94fx1qVm4hEw+htipxDCQLr2ZNakiG705
         L/irGt44Vi6+WCOs/nm8YAMeezgckHtcjftoi6ZHwvArxJy7oP1ZCLDz1Y85qwi8/The
         vJjM9sRopSZjQgB5UD2PSM9zC/lH89a0a3AmQn8wGoY7doqTQvux1jCv2VLgLPfWQIoS
         k2bIK83+PrymJ6uk5Z8FeQTK8M2mQq9gDH5tNf8jq1mW/2L537CX8Co0umBF1ZmTsCDq
         MVpcXKyl6AFX8/Cp9qproBEBOMTHeKyuYxNUDVmiPeIKVnySDgVpWel7pYFl8AvWqzX0
         /rSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpuzt7adIukuUZtez5768xxIbJaiW9c1b02K4anZejMXExlf0lSFYZbg7nlvXspy67wAqTQgHfaNBsSqmYpHDs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDWIZimu/L5EdgapvpAi+IlEdNger0Wp5xSaW2WSlAv682rFVx
	QUkozyfELmIwvmc1IxjKLUKYlvS6BOjU3hlkjMOKQ+FkRFRb2c6SSy/k0aKywN2llvO7NdiKBOd
	jwG1wiiEuiwQIGByriXRulGgdvJ8eBxo=
X-Gm-Gg: AR+sD10SQyHdbnIJ7a2q0S3S19Mqo7uc78cGgQI7urYH3TpUs/NDg0xRlh76740SX+O
	MAEkJPQl0YCyrOf3KtWxG19XMwYDhDJfKoTRtmzLa8phS5pxRPwHru1dY0mBty+rS64c5fz8N4V
	MmXCvhBO1UUIdXjMiwrq8KkuksjbAbwLgu8U8QZE+THEVQceqd/Pxh7qa7lUJ+IAgXmhEzHIKWQ
	OsEF58v1/HPhe+cirV4Kjg0hFACrUMmLtKg8TZOTSNBI//C0JyMCyCSz1a1iA76ADBw4ZdyCcSi
	9YpKAaQB5JapScGBDxOj3MrjBu/6plvOikj9IQ2VqTa5iKi8TZz/4EUAdhF2EM3Ckxm/UsSDbCx
	jmg==
X-Received: by 2002:a17:90a:bf92:b0:38e:ab3f:2c99 with SMTP id
 98e67ed59e1d1-38eab3f38a0mr1422489a91.2.1784734156982; Wed, 22 Jul 2026
 08:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722041257.1557-1-pengpeng@iscas.ac.cn> <20260722042744.5C1B01F000E9@smtp.kernel.org>
 <dcadf40a07a616de931c484bbe68f4b3f1f83b80.camel@HansenPartnership.com>
 <2026072224-moisture-gonad-409f@gregkh> <2026072205-unsealed-emcee-b243@gregkh>
 <ed0f74db3342ead9a36a0367b8a5cf694b0decf3.camel@HansenPartnership.com>
In-Reply-To: <ed0f74db3342ead9a36a0367b8a5cf694b0decf3.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Jul 2026 17:29:03 +0200
X-Gm-Features: AUfX_mwHR2f5q7FTmXaAPXY0LSHFQ4XQZ-onxLdgL2t_w3ErYqbkA-y1dJ2vX8w
Message-ID: <CANiq72m4XJcj+y-VnWYBwoMvJd+P8Xqs2dK3vaGEycFpqwAt_g@mail.gmail.com>
Subject: Re: How to fix problems with the sashiko review model
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, sashiko-reviews@lists.linux.dev, 
	Chris Mason <clm@fb.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-scsi@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 4:15=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> So you're thinking of this file:
>
> Documentation/process/threat-model.rst
>
> ?  It's already mostly in there, it's just that sashiko doesn't seem to
> be picking it up (otherwise it wouldn't have suggested the problem I
> noted), which is why I was thinking it needed to be a direct prompt ...
> unless the prompt should be to read that file?

Yeah, I had the same question for the Rust subsystem -- I have some
guidelines I want to add, which should be useful for both humans and
LLMs (e.g. not too many tokens), but I am not sure what is the best
practice here.

I think mentioning it in the prompt is needed, but perhaps it is best
to force it into the prompt `#includ`ing it somehow (ideally without
actually copy-pasting it every once in a while).

Either way, it would be nice to be consistent about this across
subsystems both on the kernel and on the prompts repository.

Cheers,
Miguel
