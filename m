Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FBD4499BF
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673609; cv=pass; b=e6GbdJbWeOyLYYHc1OFqczq5XuZg+1cOLl6dIhp4XjmynOgsk8iEY5BE6sVrkrHbYaLvNuRTKlfapJcuNcCCxPMZWXgaiU9jxmz3T4SAPczuEBtVd5Ls5Z8WRDXA33mUF1acaJBrXhkus3UTmcoS5MHEpGTGP7is7CGJF6Ju2Ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673609; c=relaxed/simple;
	bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhUoAVh9lXUj/JGt69qABds05y2U4da1jAiDiTh52OvzhsDSCyH45DHbUFQtoY4W6/OqxVbZsRYzdP3gdxzCWUNK7emT+h0yr3eWB8DgGa7tyhqhcFVmf+aRdaFQntX8YlF9vzsbcpIA0+hahfiImL6kPg5xKM+yaaztmMszIu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qac9rQKx; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qac9rQKx"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81e6f2ee60bso20172547b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 01:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783673607; cv=none;
        d=google.com; s=arc-20260327;
        b=a8eHwT1UM4hVOA9QaPOC5H3+GaviRsGtqCnjGStEoMpal4wLLqOwCktEMOzYpaW3cn
         Xsdlt8gpImrTJSZtOTdxjULl2iwlAJNilvv10w5wtNlp1d8m5zU3E7UTZHS7fnHy9ybL
         P2BK2GGvD6xT+0EBAE4AONP5lG0b+51UzMfXnTGhE+jhIkVLhWzWifxZvGfe6Ao9mFeM
         RTIV6WpAkEE7NGPZUuapX4v4bXpgsOWvah63sksxhIcJbTm7RJcFydSiBnLiAryzkk5z
         hfEYHSiHcSAaqKVtg0Gmnng1HgG7mcuFIoZSSZc/p1IAY5dR8y7wqav6XJz9vqT6+ita
         nP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
        fh=WdZE3kgJeTebCBJ4NXeUoIjbXeb3faIbdq3aHEnJVzw=;
        b=MeiY0u/9AlMj8R9YgtIdsNmSJJ7sk20YT/1ECKUx/uwi5q1lzqSscoDDElaQYN+Xvh
         OywkUFjs7i8PP4ig62sWl/F2eomjYoHItfQDW4TVcseNWAFV+7s5eedI/p2Tc/wXJ1UC
         kMC6y706/ikrXWbQZXMjDuHI84FX/mr8zUYRjPl4wmC6jnVj1ySGuqFKMIY4d47cluX9
         sb9aoHlSxD4cFL16CGC0uNVlRmq9u087QFd5cjwtYNib30KtvjHdexa1sVnQ3vX+2Sfb
         oiKrkDqNcf7IMuCC5Nyhpe+2L8Htd7OxhCbRvE3KRPnuMWcLBMkaO7bFLR4W9e2EPmn4
         AtBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783673607; x=1784278407; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
        b=Qac9rQKxIgOmWtv3NA9gBATEHsaBuiu2LFGerh4mRIr3poVJLyQ3fRJHJUvkZFigkh
         RUD8YX5X9SC5lUKAM5p5WViLJTpgdemrcyaIQve7uTx6LlX3zXpieu/5NvMm6Mm+LdMh
         haOf2XndMVdeRiELytnrgcX9JnZxWuQMy8QPq9uH2cLalE2U8nktsjdYSulf6qYay9Vo
         teoCcM8XhqQKJx6/xMclfYEmxRqSnjPeMjOdQIt33NhTugf5Fao/1XWlT0+Nk8PSecZK
         IELdstqLl5N6QXMNQu3mzu+3rUsQmrLFhFIndzq6wVYo9Ggr8LXTylDhMCrn5XGAOPy1
         iWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673607; x=1784278407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rrokNO663AJnxfbZn2qeXq7kp5aHBWHkKGU/gi9NuAY=;
        b=kgW3JPJk+Af2LbPEdm66Cu9P3x2jo9oGdIFf0b+upBCtjdjflBFQoU28/V6qCu8Uhj
         /YOnsGXpAZq/TdR8+XavHTfMwGX/ndEebpdyg+HEI+aK0utImIKD6IBKrUnucuzr5Jeq
         jrlEPW6DV6F4uoa4jaWEjIlqck+W0+8p1UlpoglUcH6i0eJsyro3VOHrQOIEh6omBj6v
         NXpYFVDwctjWs+o6R6OsHVWmv6m1jvF4d9A4JrVQ8eAZceRcuTv2f9IFsFkR1JiLHB9O
         etfzDO5xLHHhwEMJD5oTvOd8f1Y7EPn6QQCn7+5zGILRBw9IdFWY38c3P2kS/zG5o45f
         xpVw==
X-Gm-Message-State: AOJu0YyzCQyWCDnmffx7BI/3er+dkGe0enXpAd7G1yBvPXR6mZjVmRLE
	nAcVwCSJZZSlfB86AQns9BAYGV0kFM0IzNoev6uZT3HDhD5oWSniUbEMRBXfi+AaeRSjcrjX9FX
	3pkx1rvjG+dXfeRD4uRuxOi6KwOt75XG7qqhDbWc=
X-Gm-Gg: AfdE7cmLVzKwG+v/IAmeDiChSaN16AQ/CS9OKNXxtmB9kLq9W3S+/rKDOktXkyqV5a3
	mmJJHmXiGeR0jndENfD/XAreO83IG+qyGrkumspTZzu/1w+THKSgNdZAw/VnP+SDA1LuSUM2eAh
	SLxgPhxeJ5FnP5xHqyCZxYj5mIqfHy9dWSFafQyIk9hRK0OXV45zhGjtzmSVJr74uSgYXsJPOB/
	sk4GsGLAncId498xySJwQd85nv1MDJsn0DskQdMpJ96oPR/xGcaK2rRqCt2uiP9oXwkArSHdWGQ
	DhM6/Ios30jYC+vcLKjEJo9l0dI=
X-Received: by 2002:a05:690c:6603:b0:7de:8229:e86e with SMTP id
 00721157ae682-81e7bc535bamr22632267b3.21.1783673606816; Fri, 10 Jul 2026
 01:53:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260710070141.37214-1-mertsftl@gmail.com> <20260710071132.2AAB91F000E9@smtp.kernel.org>
In-Reply-To: <20260710071132.2AAB91F000E9@smtp.kernel.org>
From: Mert Seftali <mertsftl@gmail.com>
Date: Fri, 10 Jul 2026 10:53:15 +0200
X-Gm-Features: AVVi8Cfl_h5TZSnM2_kzmR_MbRt3H9iKsVECORQF8uRQGYJAwZpkIFrbi79ng6I
Message-ID: <CAA3Noor8kEMPbjAOf8UWz4LQ=n9H80=1L42wseOGH-3HGa7-XA@mail.gmail.com>
Subject: Re: [PATCH v3] leds: pwm: Annotate leds[] with __counted_by()
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

Sashiko is right and I tested it too now to confirm. Under UBSAN_BOUNDS
&priv->leds[i] traps on an out-of-range index, but the led_data++ walk
in v3 does not: decaying the array to a plain led_pwm_data * drops the
__counted_by association, so num_leds is only enforced on subscript
accesses and v3 has none.

Getting the check back means &priv->leds[i] subscripting. I can still
pass that element into led_pwm_add() as you suggested, it just brings a
loop index back. So it is a tradeoff: the cleaner pointer form, or the
annotation actually enforced.

Since the element-passing was your suggestion, which would you prefer:
keep the pointer walk (annotation stays documentary), or respin with
subscripting so num_leds is enforced? Happy to do either.

Thanks,
Mert
