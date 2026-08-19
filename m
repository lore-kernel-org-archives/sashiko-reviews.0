Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AA2641C6
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151739; cv=pass; b=SOCKO99GW4QdTZfk/M1ztvfVMd7N/wWq51uefmGkL4h951odl3MOWoYwWhS2NxmbbOvUo93EVndNMuiyYkZRYBHxG7a420paHABpFlBPD41P8cHWQBhdH/JsrUyHABVVZXxUXJXTGDuejvRoof6MWku+YNtmyPhnAbtaZl8/6HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151739; c=relaxed/simple;
	bh=Y2mlUUUB/KRRsTD+WBoNTXGIM5Yr2t9stv66pcM4yS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeROrai3he3sQSkauIE5LjQMk8D74QPvhoLa7OJL8by0PqIiBV8x8n4pfy+nYaNja5OI68r0g+uFNhULklg6IxHLGdjMqfUOdbd4ZuoFWjElAi2VA0MelbGyAlHLRSTmgZrbWG+4Y/2fjzKVpZlzESFlHLSFGOuhH30fiF0tHj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTCF5RC5; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTCF5RC5"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a12ffc112cso20898061fa.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 08:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787151736; cv=none;
        d=google.com; s=arc-20260327;
        b=fAA4rD7gGCnkco8Xn41U4Eg9urr/l7mWGnz/fwPvGh9SXkJ4K7Y4ivJCz0pfm9L5pB
         ufAdQ5Rgqrtp+LoK1Y8HmzzLYPlWe2/wUGZ+OSrfIdZahaETPO04PUaUvc/2ZrMZUIly
         QUGVUXQe+tOVFbTR46dQUsj6Aqj5JpbJDc0+WBQ5cTEdFXc/myDuGHAwbPAgpJiMfQXX
         kTo61m/RHqgOyb/mFh+djov2v21xmQV6hUTP3SiFgISlPkf9YXnxdnOVrNDzyDqhR2SB
         7uQ1H20zgyoIE7aPkeigtukarJbppFtoGmaR0pP0v9+4RuAh/ihA0OVSoieeSZ2RUXyc
         1kUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ymew9bpImdFjLeF9c8WC+a0QvVk3Jp70dtm/1rKnmb4=;
        fh=DKaxhmaQZl2Mr6QMtx93LDxRDsV+oE9CXq2Lg4UQyFk=;
        b=h2da9syQ76blnhyUJm0wEKij0RRBP+nqlgzWCE6E2ndRzkDiX4YzLnTEKQB9mAHPpd
         r3hnvjN5KDF8WiMEKMcQnrh5Pl8JTo8Nt0L344nOv9iIDWWh7JfmnF42OgrIt8DrbfFF
         KqhyS3HxtnFuJ3qIea7yz9oe/PmzZM9g5NXi9xuJwDmt8XWMWJGklJmc6J2cXt+nn6OD
         adkvV3AUWBtzP3ZtUvjt6FubB1pbIlfH0IpG/b0pWA6tenKESP4+DtWf2AxWbgJuLUzu
         0edIHI+Iw5P8Vp0T6ROr9iBNjpNUolii5WX1jqY4+nf3tn/IXs3ZsU15ZwoTx9sxnxZ3
         Yahw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787151736; x=1787756536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ymew9bpImdFjLeF9c8WC+a0QvVk3Jp70dtm/1rKnmb4=;
        b=UTCF5RC5cj7WUltJjtcTFonrYQwk8OL/TIPb2VIHb4yUPLqMhxC3TVML2arp+X0qY1
         HlClDS+E03sDanr6Jis8nnmy8ii5ZTt8Za2bVv3PClfsiSHIZRtfzfaCOcaZ9vM3WJPL
         9zKmBv018MCZ9lQwq7d6NJUqQwvqJ5lV0xyXT8jbaYSuS5ZWuzC8jo4HYx5kLP3+sSRE
         YFqYD9jHHosVbSYut1SAHFzISR2JioxUTw4v4EP/dY+26eF8VS2k+ebq4y0zoIErwB15
         t1AWzlaE5nibOBU4DzWtqGMh1nOZZQ4yO6yIxWwOY4QFJU4SiXLEGebvA2xQLYAdOAsa
         Oh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787151736; x=1787756536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymew9bpImdFjLeF9c8WC+a0QvVk3Jp70dtm/1rKnmb4=;
        b=QfBXGQ12cc7HfMmOgphFvHiKHvCBDSi4+/sXRLoKL0JHRmwA5puOFW9dBaCu5vcKmi
         JDeHEvynyWpS37LYG8BylFys4n5VhpSl3oZtOWAQUHCq9T//gl/a/O+vv7nSu6hHuqTH
         iRgT0EDFX6gz0BiLEjPBjnoM3iUXOlfQof5tgwbYIuejjSckhY9pSvjyO9cJjG7nLz9P
         bZN0jTI6aUAKLrVOhJj8Dci3zbdyrOL/SKo9VjNrdlmaClIzv2NnDx0WpVPnNNLYLsH9
         lzZb6noUH0WFsEud40uLbwd3qhu+Z49j9oclhf+E+gyX/tRVtdXwwTQWN1iMeX/ypndM
         jDVg==
X-Gm-Message-State: AOJu0Yx/V54CPpFGOQME8xWVOGeoZ6EYLA0/yNNck+LAC4ae4UdA9I5h
	1zeBDWlo80fL0TG4RSNrnGf3200Gbkb2oQsn6W6Et6yW5aHMr4yby2BTxQDD6JmHy+qqdoNTrHK
	IEckgCGlOmKUq9l9O1QPqfpp8/8rX8OA=
X-Gm-Gg: AR+sD10ht+CqAU6VNvYDAALglT/QgxgF+jacHR7puuIfV6ebMD0vC2RhH5K5zl7TPFc
	Gr7LjktCXsOdvcIUfkn+gJdTPuuzxhYZgsRt0zp1s4fWxH5fc6z0RlUNIUQlD3yrbvuDeFCrC2r
	p/2gm4lgulNDaGCRjy57OcdIQ5ET7vhtoymOA7ly3tEIRhiCbby0LgT/mPqMNrQSLaOCmHppfBC
	ofDOUcZSgNTK2Aoe4QuqxfHXIwuWNquc50rYxxpUdbjc5gybct1RJm6NaaVqzKEqZF9wDO6ThRC
	vqoHw7MuIKC+asFJigJPyLB7mlxGj1icR4Cp1ARuyD9cepcitTtEG9QuDf4NhzWz8hjAr4555mL
	lNbmITu8BX/obY4e2QcSt0XV96+hqtgMlhA==
X-Received: by 2002:a2e:b8d4:0:b0:396:ade7:4153 with SMTP id
 38308e7fff4ca-3a1880c90f4mr9383981fa.0.1787151734863; Wed, 19 Aug 2026
 08:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com> <20260819092506.832631F000E9@smtp.kernel.org>
 <aoXAXFI3kRWh98R7@SMW015318>
In-Reply-To: <aoXAXFI3kRWh98R7@SMW015318>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Aug 2026 12:02:02 -0300
X-Gm-Features: AcwNN1XMaFpCa6LnLPfbr-oPlJfW99zg1WbFRWcOdgz5JXtHUa-XRE36iSsmIpU
Message-ID: <CAOMZO5DT63sfGdUXiKNK=ihMs=rXbA6kBUUO4TmE1o=e6dkxkg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in probe()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Zhipeng.wang_1@oss.nxp.com, 
	Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:43=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:

> Make sense, this check should just after
>
>         data->irq_count =3D DIV_ROUND_UP(irqs_num, 64);
>         data->reg_num =3D irqs_num / 32;

This is what I did at:

https://lore.kernel.org/lkml/20260817190621.335492-2-festevam@gmail.com/

Zhipeng, feel free to include my two patches in your series.

You also forgot to CC the drivers/irqchip maintainer.
